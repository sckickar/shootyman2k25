/// This script contains the different Getter functions that can be used
///	to retrieve information about the Infinite Debris engine.
///
///	The functions in this script are:
///
///		infd_set_permanent(enable)
///		infd_set_chunk(size)
///		infd_set_clear_colour(colour)
///		infd_set_origin(_x, _y)
///		infd_set_area(w, h)
///		infd_set_debug(enable)
///		


///	@function					infd_set_permanent(enable);
///
///	@param	{bool}	enable		Set to to true to enable permanent debris or false to disable it
///
///	@description	This function can be used to enable or disable the permanent setting of the 
///					Infinite Debris functions. When enabled, sprites will be used instead of 
///					surfaces to hold the debris effects. Sprites are more stable and won't 
///					disappear if the game is minimised or put into the background, but it comes
///					at the const of increased texture swaps, memory use and CPU overhead.

function infd_set_permanent(enable)
{
with (obj_InfD_Control)
	{
	infd_perm = enable;
	}
}


///	@function		infd_set_chunk(size);
///
///	@param	{int}	size	The new size for the surface "chunks" being used.
///
///	@description	This function can be used to change the size of the surface chunks being used.
///					WARNING! Setting this will wipe all the current surfaces and sprites being 
///					used to draw the infinite debris effects
function infd_set_chunk(size)
{
with (obj_InfD_Surf)
	{
	instance_destroy();
	}

with (obj_InfD_Control)
	{
	ds_grid_destroy(infd_grid);
	infd_chunk = size;
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
			}
		}
	}
}


///	@function				infd_set_clear_colour(colour);
///
///	@param	{int}	colour	The new colour to use for clearing the surface "chunks".
///
///	@description	This function can be used to set the surface clear colour of the Inifnite Terrain 
///					controller. The colour value that you give is the colour that all the surface
///					"chunks" will use to clear themselves and is by default set to a light gray 
///					colour. This colour is only important when you have debris that has areas with 
///					an alpha other than 0 or 1. 

function infd_set_clear_colour(colour)
{
with (obj_InfD_Control)
	{
	infd_colour = colour;
	}
with (obj_InfD_Surf)
	{
	infd_surf_col = colour;
	}
}


///	@function			infd_set_origin(_x, _y);
///
/// @param	{real}	_x	The new X origin for the surfaces
///
/// @param	{real}	_y	The new Y origin for the surfaces
///
/// @description	This function will change the origin of the surfaces for the Infinite
///					Debris effect. By default this is created at (0, 0) in the room, and 
///					will cover the area defined when it was created. However if your game 
///					does not use the room as a reference point or you only want debris
///					effects over a specific area of the game room, then you may want to 
///					change the position of the debris surfaces using this function

function infd_set_origin(_x, _y)
{
if instance_exists(obj_InfD_Control)
	{
	with (obj_InfD_Control)
		{
		x = _x;
		y = _y;
		var _sz = infd_chunk;
		for (var j = 0; j < infd_grid_h; ++j;)
			{
			for (var i = 0; i < infd_grid_w; ++i;)
				{
				var _inst = infd_grid[# i, j];
				with (_inst)
					{
					x = _x + (i * _sz);
					y = _y + (j * _sz);
					}
				}
			}
		}
	infd_log("infd_set_origin: New origin set - (" + string(_x) + " , " + string(_y) + ")");
	}
else
	{
	infd_log("infd_set_origin: ERROR! Could not set origin as the controller instance does not exist.");
	}
}


///	@function			infd_set_area(w, h);
///
/// @param	{real}	w	The new width of the area to cover
///
/// @param	{real}	h	The new height of the area to cover
///
/// @description	This function can be used to change the area that the surface "catcher"
///					instances cover. Note that by setting these values you will clear all
///					exisiting data from the Infinite Debris surfaces or sprites.

function infd_set_area(w, h)
{
if instance_exists(obj_InfD_Control)
	{
	with (obj_InfD_Surf)
		{
		instance_destroy();
		}
	with (obj_InfD_Control)
		{
		ds_grid_destroy(infd_grid);
		infd_width = w;
		infd_height = h;
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
				}
			}
		}
	infd_log("infd_set_area: New area set - " + string(w) + "w , " + string(h) + "h");
	}
else
	{
	infd_log("infd_set_area: ERROR! Could not set origin as the controller instance does not exist.");
	}
}


///	@function					infd_set_debug(enable);
///
///	@param	{bool}	enable		Set to to true to enable debugging or false to disable it
///
///	@description	This function can be used to enable or disable the debugging option of the 
///					Infinite Debris functions. When enabled, the controller object will draw
///					each of the chunks as coloured rectangles at their position within the 
///					current game room. If the chunk is red, it has no surface yet, and if it
///					is green, then a surface has been allocated.

function infd_set_debug(enable)
{
with (obj_InfD_Control)
	{
	infd_debug = enable;
	}
}


