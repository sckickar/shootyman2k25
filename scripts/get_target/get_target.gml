function get_target() {
	if(!instance_exists(target)){
	    target = -1;
	}

	if (target = -1){
	    if(instance_exists(c_player)){
	        target = instance_nearest(x, y, c_player);
	    }
	}
}
