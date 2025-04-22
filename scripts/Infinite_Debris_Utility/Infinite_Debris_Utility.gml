/// This script contains Utitlity functions to help use the Infinite Debris engine.
///
///	The functions in this script are:
///	
///		infd_log(val)
///		infd_clear()
///		infd_save()
///		infd_load()
///		infd_make_permanent()
///		infd_draw_debug()
///		


///	@function				infd_log(val);
///
///	@param	{stringreal}	val		The message to log to the output console
///
///	@description			This function is really just a wrapper for the show_debug_message()
///							function, only it adds in the details of the asset as part of the message

function infd_log(val)
{
if !is_string(val)
	{
	val = string(val);
	}
show_debug_message(":::::::::: INFINITE DEBRIS: " + val);
}


///	@function			infd_clear();
///
///	@description		This function will simply clear the surfaces/sprites from the 
///						Inifnite Debris instances in the room.

function infd_clear()
{
with (obj_InfD_Surf)
	{
	if surface_exists(infd_surf)
		{
		surface_free(infd_surf);
		}
	if sprite_exists(infd_spr)
		{
		sprite_delete(infd_spr);
		}
	}
infd_log("infd_clear: All surfaces and sprites have been cleared.");
}


///	@function		infd_save();
///
///	@description	This function can be used to save out all the Infinite Debris surface
///					chunks as PNG files. These can then be loaded back into the game calling
///					the function "infd_load()". Note that if you have a small chunk size and/or 
///					the room is large, then this may stall the game. The save data will be 
///					assigned a value automatically based on the room the save function was called
///					in, and so when you load this will also automatically be checked and the 
///					appropriate data added.

function infd_save()
{
infd_make_permanent();
with (obj_InfD_Control)
	{
	var _val = string(room);
	var _map = ds_map_create();
	_map[? "chunk"] = infd_chunk;
	_map[? "grid_w"] = infd_grid_w;
	_map[? "grid_h"] = infd_grid_h;
	_map[? "perm"] = infd_perm;
	_map[? "colour"] = infd_colour;
	var _json = json_encode(_map);
	var _fname = _val + "_InfdData.dat";
	if file_exists(_fname)
		{
		file_delete(_fname);
		}
	var _file = file_text_open_write(_fname);
	file_text_write_string(_file, _json);
	file_text_close(_file);
	ds_map_destroy(_map);
	var _num = 0;
	for (var j = 0; j < infd_grid_h; ++j;)
		{
		for (var i = 0; i < infd_grid_w; ++i;)
			{
			var _name = _val + "_InfdSpr_" + string(_num) + ".png";
			if file_exists(_name)
				{
				file_delete(_name);
				}
			var _inst = infd_grid[# i, j];
			if instance_exists(_inst)
				{
				if sprite_exists(_inst.infd_spr)
					{
					sprite_save(_inst.infd_spr, 0, _name);
					}
				}
			++_num;
			}
		}
	infd_log("infd_save: Data for room " + _val + " has been saved.");
	}
}


///	@function			infd_load();
///
///	@description		This function can be used to load in a previously saved set of 
///						Infinite Debris sprites for the current room.

function infd_load()
{
with (obj_InfD_Control)
	{
	var _val = string(room);
	var _fname = _val + "_InfdData.dat";
	if file_exists(_fname)
		{
		var _file = file_text_open_read(_fname);
		var _json = file_text_read_string(_file);
		var _map = json_decode(_json);
		file_text_close(_file);
		infd_chunk = _map[? "chunk"]
		infd_grid_w = _map[? "grid_w"];
		infd_grid_h = _map[? "grid_h"];
		infd_perm = _map[? "perm"];
		infd_colour = _map[? "colour"];
		ds_map_destroy(_map);
		with (obj_InfD_Surf)
			{
			instance_destroy();
			}
		ds_grid_destroy(infd_grid);
		infd_grid = ds_grid_create(infd_grid_w, infd_grid_h);
		ds_grid_clear(infd_grid, -1);
		var _num = 0;
		for (var j = 0; j < infd_grid_h; ++j;)
			{
			for (var i = 0; i < infd_grid_w; ++i;)
				{
				infd_grid[# i, j] = instance_create_layer(i * infd_chunk, j * infd_chunk, layer, obj_InfD_Surf);
				infd_grid[# i, j].image_xscale = infd_chunk;
				infd_grid[# i, j].image_yscale = infd_chunk;
				infd_grid[# i, j].infd_surf_col = infd_colour;
				var _name = _val + "_InfdSpr_" + string(_num) + ".png";
				if file_exists(_name)
					{
					infd_grid[# i, j].infd_spr = sprite_add(_name, 0, 0, 0, 0, 0);
					}
				++_num;
				}
			}
		infd_log("infd_load: Data for room " + _val + " has been loaded.");
		}
	else
		{
		infd_log("infd_load: Error! No data file found. Loading aborted.");
		}
	}
}


///	@function		infd_make_permanent();
///
/// @description	This function is for converting all the current surfaces with debris
///					on them into sprites and so make them "permanent" This does NOT 
///					enable permanent surfaces, but instead will simply create sprites 
///					from the current surfaces until the next time some debris is spawned.
///					This is really just for situations like when the player pauses the
///					game so that if it's then minimised or put into the background,
///					the debris won't disappear as the surfaces disappear. This function is
///					also called when saving out a room.
function infd_make_permanent()
{
with (obj_InfD_Surf)
	{
	if surface_exists(infd_surf)
		{
		if sprite_exists(infd_spr)
			{
			sprite_delete(infd_spr);
			}
		var _w = surface_get_width(infd_surf);
		infd_spr = sprite_create_from_surface(infd_surf, 0, 0, _w, _w, false, false, 0, 0);
		surface_free(infd_surf);
		}
	}
infd_log("infd_make_permanent: Surfaces have been converted to permanent sprites.");
}


///	@function			infd_draw_debug();
///
///	@description		This function will draw some debug information to the game room
///						to show the position of each surface chunk as well as whether a
///						surface actually exists at the moment or not or whether a sprite
///						exists or not (empty is red, surface is green, and sprite is 
///						aqua). You can call the function "infd_set_debug()" to enable or 
///						disable debugging.

function infd_draw_debug()
{
if infd_debug
	{
	var _a = draw_get_alpha();
	var _hw = infd_chunk / 2;
	for (var j = 0; j < infd_grid_h; ++j;)
		{
		var _yy = y + (j * infd_chunk);
		for (var i = 0; i < infd_grid_w; ++i;)
			{
			var _xx = x + (i * infd_chunk);
			var _inst = infd_grid[# i, j];
			if instance_exists(_inst)
				{
				if surface_exists(_inst.infd_surf)
					{
					var _c = c_lime;
					}
				else if sprite_exists(_inst.infd_spr)
					{
					var _c = c_aqua;
					}
				else _c = c_red;
				draw_set_alpha(0.5);
				draw_rectangle_colour(_xx + 1, _yy + 1, _xx + infd_chunk, _yy + infd_chunk, _c, _c, _c, _c, true);
				draw_text(_xx + _hw, _yy + _hw, _inst);
				draw_set_alpha(0.1);
				draw_rectangle_colour(_xx + 1, _yy + 1, _xx + infd_chunk, _yy + infd_chunk, _c, _c, _c, _c, false);
				}
			}
		}
	draw_set_alpha(_a);
	draw_text(camera_get_view_x(camera_get_active()) + 8, camera_get_view_y(camera_get_active()) + 8, instance_count);
	}
}
