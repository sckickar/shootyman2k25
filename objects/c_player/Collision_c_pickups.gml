with(other){
	if(state == "landed"){
		switch(type){
			case 1:
				other.current_weapon_index = type;
				other.current_weapon[? "current_ammo"] = other.current_weapon[? "max_ammo"];
			break;
			case 2:
				other.current_weapon_index = type;
				other.current_weapon[? "current_ammo"] = other.current_weapon[? "max_ammo"];
			break;
		}
		;
		instance_destroy();
	}
}