/// This set of functions forms the core of the Infinite Debris Engine.
/// Please see the READ_ME file for how to use the engine.
///
///	The functions in this script are:
///
///		infd_create(chunk_size, room_w, room_h, layer_id, permanent)
///		infd_collision([sprite, image, xscale, yscale, angle, blend, alpha])
///		infd_instance_destroy([fade, steps])
///		infd_destroy()
///		


// Define Macros
#macro INFD_NORMAL	0
#macro INFD_DESTROY 1
#macro INFD_FADE	2


/// @function							infd_create(chunk_size, room_w, room_h, layer, permanent);
///
///	@param {int}		chunk_size		The size of each of the surface "chunks" for catching instances
///										on. This should be kept fairly small, like 128 or 256, and will 
///										be used to define the size of each surface square that will be 
///										"catching" instances. You can use -1 to use the default value.
///
///	@param	{int}		room_w			This is the width of the room or area that the surface chunks 
///										should be tiled over. It doesn't have to be the actual room width 
///										and can be any value. Use -1 to use the default value (room_width).
///
///	@param	{int}		room_h			This is the height of the room or area that the surface chunks 
///										should be tiled over. It doesn't have to be the actual room height
///										and can be any value. Use -1 to use the default value (room_height).
///
/// @param	{string)	layer_id		The layer to create the controller on.
///
/// @param	{string)	permanent		When you set this to true, surfaces will only be used as a means 
///										to create sprites for the debris to be drawn with. The benefit of 
///										this is that it means that if the game loses focus, the debris will
///										still be drawn when it is brought back, while when set to false, 
///										only surfaces will be used and these may disappear when the game is 
///										minimiused or put into the background. Using sprites will be slightly
///										slower to process and also increase the memory requirements.
///
/// @description	This function initialises the Infinite Debris controller object. This controller will be
///					used to generate individual surfaces in "chunks" that are tiled across the given width
///					and height in the room. These surfaces will be used to "catch" instances and draw them
///					giving the appearance of infinite debris without the overhead of having thousands of
///					actual instances. We use multiple surface "chunks" because these are better for 
///					performance and overall memeory use than a single large surface, and are also far more
///					compatible with low end spec devices.
///
///					Note that if you set the "permanent" argument to false, then the debris surfaces may 
///					"disappear" if the game is minimised or put into the background due to the fact that 
///					surfaces are volatile. However, setting it to true and using sprites instead of surfaces 
///					will prevent this from happening BUT will come with a slightly greater performance and 
///					memory overhead.

function infd_create(chunk_size, room_w, room_h, layer, permanent)
{
// Check the layer is correct
if is_string(layer)
	{
	layer = layer_get_id(layer);
	}

if !layer_exists(layer)
	{
	infd_log("infd_create: ERROR! Layer with given name or ID does not exist.");
	return -1;
	}

// Now create the Infinite Debris controller object and set the initial variables
with (instance_create_layer(0, 0, layer, obj_InfD_Control))
	{
	if chunk_size != -1
		{
		infd_chunk = chunk_size;
		}
	if room_w != -1
		{
		infd_width = room_w;
		}
	if room_h != -1
		{
		infd_height = room_h;
		}
	infd_perm = permanent;
	if (infd_width mod infd_chunk) == 0
		{
		infd_grid_w = (infd_width div infd_chunk);
		}
	else infd_grid_w = (infd_width div infd_chunk) + 1;
	if (infd_height mod infd_chunk) == 0
		{
		infd_grid_h = (infd_height div infd_chunk);
		}
	else infd_grid_h = (infd_height div infd_chunk) + 1;
	infd_grid = ds_grid_create(infd_grid_w, infd_grid_h);
	ds_grid_clear(infd_grid, -1);
	for (var j = 0; j < infd_grid_h; ++j;)
		{
		for (var i = 0; i < infd_grid_w; ++i;)
			{
			infd_grid[# i, j] = instance_create_layer(i * infd_chunk, j * infd_chunk, layer, obj_InfD_Surf);
			infd_grid[# i, j].image_xscale = infd_chunk;
			infd_grid[# i, j].image_yscale = infd_chunk;
			infd_grid[# i, j].infd_surf_col = infd_colour;
			}
		}
	infd_log("infd_create: Infinte debris surface grid initialised - " + string(infd_grid_w) + "w, " + string(infd_grid_h) + "h");
	}
}


///	@function					infd_collision([sprite, image, xscale, yscale, angle, blend, alpha]);
///
///	@param	{int}	sprite		OPTIONAL! The sprite to use.
///	@param	{int}	image		OPTIONAL! The image index to use.
///	@param	{int}	xscale		OPTIONAL! The image xscale to use.
///	@param	{int}	yscale		OPTIONAL! The image yscale to use.
///	@param	{int}	angle		OPTIONAL! The image angle to use.
///	@param	{int}	blend		OPTIONAL! The image blend colour to use.
///	@param	{int}	alpha		OPTIONAL! The image alpha to use.
///
/// @description	This function is used to detect when an instance should be destroyed and
///					draw it to the debris surface before actually destroying it. By default 
///					the function will use the default sprite properties, but you can override 
///					the collision event of the parent object and call this function using your 
///					own arguments. Any that you don't need can be set to -1 for the default 
///					values. For example, to use a custom sprite index, you'd call:
///
///						infd_collision(my_sprite);
///
///					Or to call the function with default values except the blend colour:
///
///						infd_collision(-1, -1, -1, -1, -1, c_red);
///
///					Note that if you have enabled permanence then the previously created
///					permanent sprite will be drawn first and then new debris sprites drawn 
///					over the top.
///
///					IMPORTANT! Because of the way depth and layers works, things may NOT be 
///					drawn to the surface in the same order that they appear to be drawn in the
///					room. There really is nothing that can be done about this, but in most 
///					situations this isn't an issue.

function infd_collision()
{
// Check if instance can be destroyed
if destroy == INFD_DESTROY
	{
	if instance_exists(obj_InfD_Control)
		{
		// Get vars
		var _sz = obj_InfD_Control.infd_chunk;
		var _id = id;
		var _spr = sprite_index;
		var _ind = image_index;
		var _xsc = image_xscale;
		var _ysc = image_yscale;
		var _ang = image_angle;
		var _col = image_blend;
		var _alp = image_alpha;
	#region Check Optional Variables
		if argument_count > 0
			{
			_spr = argument[0];
			if argument_count > 1
				{
				_ind = argument[1];
				if argument_count > 2
					{
					_xsc = argument[2];
					if argument_count > 3
						{
						_ysc = argument[3];
						if argument_count > 4
							{
							_ang = argument[4];
							if argument_count > 5
								{
								_col = argument[5];
								if argument_count > 6
									{
									_alp = argument[6];
									}
								}
							}
						}
					}
				}
			}
	#endregion
		// Target the other instance of the collision (the Infinite Debris surfaces)
		with (other)
			{
			// Check surface exists and if it doesn't then create it
			var _sdepth = surface_get_depth_disable();
			surface_depth_disable(true);
			if !surface_exists(infd_surf)
				{
				infd_surf = surface_create(_sz, _sz);
				if surface_exists(infd_surf)
					{
					surface_set_target(infd_surf);
					draw_clear_alpha(infd_surf_col, 0);
					if sprite_exists(infd_spr)
						{
						var _salpha = gpu_get_blendenable();
						gpu_set_blendenable(false);
						draw_sprite(infd_spr, 0, 0, 0);
						gpu_set_blendenable(_salpha);
						}
					surface_reset_target();
					}
				}
			if surface_exists(infd_surf)
				{
				// Draw to surface
				surface_set_target(infd_surf)
				draw_sprite_ext(_spr, _ind, (_id.x - x), (_id.y - y), _xsc, _ysc, _ang, _col, _alp);
				surface_reset_target();
				ds_stack_push(infd_collision_stack, _id);
				alarm[0] = 1;
				}
			else
				{
				infd_log("infd_collision: ERROR! A surface could not be created for the instance. Setting to fade out instead.");
				_id.destroy = INFD_FADE;
				_id.alarm[11] = 2;
				}
			surface_depth_disable(_sdepth);
			}
		}
	else
		{
		infd_log("infd_collision: ERROR! The Infinite Debris controller object is missing from the room. Setting to fade out instead.");
		}
	}
}


/// @function				infd_instance_destroy([fade, steps]);
///
///	@param	{bool}	fade	OPTIONAL! If this is set to true, the instance will fade out rather
///							than be drawn to a surface.
///
///	@param	{int}	steps	OPTIONAL! When fade is set to true, you can also include the number
///							of steps that the fade should take. If you do not include this value
///							the default is 3 seconds.
///
/// @description			This function is used instead of "instance_destroy()" to destroy
///							any instances that have the "obj_InfD_Parent" object as their parent.
///							If you include the fade variable and set it to true, it won't draw
///							to a surface but will instead fade out.

function infd_instance_destroy()
{
if destroy == INFD_NORMAL
	{
	destroy = INFD_DESTROY;
	if !place_meeting(x, y, obj_InfD_Surf)
		{
		alarm[11] = 2;
		destroy = INFD_FADE;
		infd_log("infd_instance_destroy: ERROR! No surface instance available. Setting to fade out.");
		}
	else if argument_count > 0
		{
		if argument[0] == true
			{
			alarm[11] = 2;
			if argument_count > 1
				{
				var _val = argument[1];
				destroy_fade = 1 / _val;
				}
			destroy = INFD_FADE;
			}
		}
	}
}


///	@function			infd_destroy();
///
/// @description		This function will destroy the Infinite Debris instances and all the
///						dynamic resources associated with them.
function infd_destroy()
{
for (var j = 0; j < infd_grid_h; ++j;)
	{
	for (var i = 0; i < infd_grid_w; ++i;)
		{
		if instance_exists(infd_grid[# i, j])
			{
			instance_destroy(infd_grid[# i, j]);
			}
		}
	}
ds_grid_destroy(infd_grid);
}