/// @description  add_decal(sprite index,image index,image angle,x,y);
/// @param sprite index
/// @param image index
/// @param image angle
/// @param x
/// @param y
function add_decal(argument0, argument1, argument2, argument3, argument4) {
	dList[dIndex,0] = argument0;
	dList[dIndex,1] = argument1;        
	dList[dIndex,2] = argument2;
	dList[dIndex,3] = argument3;
	dList[dIndex,4] = argument4

	dIndex++;
	
	show_debug_message(dIndex);

	if dIndex >= MAX_DECAL_SIZE {
		show_debug_message("MAX DECAL REACHED!")
		dIndex = 0;
	}



}