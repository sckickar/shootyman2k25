/// @description  general_add_decal(sprite index,image index,image angle,x,y);
/// @param sprite index
/// @param image index
/// @param image angle
/// @param x
/// @param y
function general_add_decal(argument0, argument1, argument2, argument3, argument4) {
	gdList[gdIndex,0] = argument0;
	gdList[gdIndex,1] = argument1;        
	gdList[gdIndex,2] = argument2;
	gdList[gdIndex,3] = argument3;
	gdList[gdIndex,4] = argument4;

	gdIndex++;

	gdIndex = clamp(gdIndex, 0, 200);



}
