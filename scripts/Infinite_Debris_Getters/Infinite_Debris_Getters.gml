/// This script contains the different Getter functions that can be used
///	to retrieve information about the Infinite Debris engine.
///
///	The functions in this script are:
///
///		infd_get_grid()
///		infd_get_permanent()
///		infd_get_chunk()
///		infd_get_clear_colour()
///		infd_get_xorigin()
///		infd_get_yorigin()
///		infd_get_width()
///		infd_get_height()
///		infd_get_debug()
///		


///	@function		infd_get_grid();
///
///	@description	This function can be used to get the instance grid of the Inifnite Terrain 
///					controller. Will return a grid ID, and each cell in the grid will correspond
///					to an instance in the room that "catches" isntances to make the Infinite Debris.

function infd_get_grid()
{
with (obj_InfD_Control)
	{
	return infd_grid;
	}
return -1;
}


///	@function		infd_get_permanent();
///
///	@description	This function can be used to get the permanent setting of the Inifnite Terrain 
///					controller. Will return true or false for enabled/disabled, or undefined if
///					there is an issue.

function infd_get_permanent()
{
with (obj_InfD_Control)
	{
	return infd_perm;
	}
return undefined;
}


///	@function		infd_get_chunk();
///
///	@description	This function can be used to get the size of the surface "chunks"
///					that are being used to catch debris on.

function infd_get_chunk()
{
with (obj_InfD_Control)
	{
	return infd_chunk;
	}
return -1;
}


///	@function		infd_get_clear_colour();
///
///	@description	This function can be used to get the surface clear colour of the Inifnite Terrain 
///					controller. Will return a colour value. This value is the colour that all the 
///					surface "chunks" will use to clear themselves and is by default set to a light
///					gray colour. This colour is only important when you have debris that has areas 
///					with an alpha other than 0 or 1. 

function infd_get_clear_colour()
{
with (obj_InfD_Control)
	{
	return infd_colour;
	}
return -1;
}


///	@function		infd_get_xorigin();
///
///	@description	This function can be used to retrieve the current X origin for
///					the controller instance. If you need to change this value then
///					use the "infd_set_origin()" function.

function infd_get_xorigin()
{
with (obj_InfD_Control)
	{
	return x;
	}
return undefined;
}


///	@function		infd_get_yorigin();
///
///	@description	This function can be used to retrieve the current Y origin for
///					the controller instance. If you need to change this value then
///					use the "infd_set_origin()" function.

function infd_get_yorigin()
{
with (obj_InfD_Control)
	{
	return y;
	}
return undefined;
}


///	@function		infd_get_width();
///
///	@description	This function can be used to retrieve the width of the area that is being
///					tiled with surfaces. If you need to change this value then	use the 
///					"infd_set_area()" function.

function infd_get_width()
{
with (obj_InfD_Control)
	{
	return infd_grid_w * infd_chunk;
	}
return -1;
}


///	@function		infd_get_height();
///
///	@description	This function can be used to retrieve the height of the area that is being
///					tiled with surfaces. If you need to change this value then	use the 
///					"infd_set_area()" function.

function infd_get_height()
{
with (obj_InfD_Control)
	{
	return infd_grid_h * infd_chunk;
	}
return -1;
}


///	@function		infd_get_debug();
///
///	@description	This function can be used to get the debug state of the Inifnite Terrain 
///					controller. Will return true or false for enabled/disabled.

function infd_get_debug()
{
with (obj_InfD_Control)
	{
	return infd_debug;
	}
return false;
}





