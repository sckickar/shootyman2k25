with(other){
    if(state == "landed"){
        switch(type){
            case 1:
            case 2:
                other.current_weapon_index = type;
                other.current_weapon = other.weapons[| other.current_weapon_index];
                other.current_weapon[? "current_ammo"] = other.current_weapon[? "max_ammo"];
                other.current_ammo = other.current_weapon[? "current_ammo"];
                other.max_ammo = other.current_weapon[? "max_ammo"];
            break;
        }
        instance_destroy();
    }
}