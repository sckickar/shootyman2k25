	/* >>>>>>>>>>>>>>>>>>>>>>>>>>>> INFINITE DEBRIS <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

	This asset is designed to give you "infinite debris" effects in your games. It
	essentially creates multiple surfaces to "catch" instances and then draw them
	forever more, giving the effect of permanent decals or debris around your game's
	levels. It has been optimised so that only those surfaces that are required are
	created, and also has an option to make them "permanent", ie: turn the catcher
	surfaces into sprites, so that if the game is mininised or put in the background
	the debris won't disappear (surfaces are valatile and can be removed from memory 
	at any time).

	To use this asset, first remove all folders that are marked "DEMO". IMPORTANT! Do 
	NOT remove the sprite "spr_InfD_Mask" as this is an essential part of the asset!
	You will then need call the function "infd_create()" at the start of the room where 
	you want the effect, which will create the object "obj_InfD_Control". This 
	controller will then create a "tile" map (stored in a DS grid) of surface instances 
	- "obj_InfD_Surf" - ready to catch the debris and decals that you want to put on 
	them. The asset also contains a parent object "obj_InfD_Parent". You MUST assign 
	this parent to all objects that you want to be caught by the surfaces to make 
	your debris.

	It is important to note that instances will be drawn to the surface in the order 
	in which they are DESTROYED, and so visual depth is NOT preserved. if an instance 
	at a lowevr depth is destroyed and then an instance at a higher depth, the higher 
	depth instance will drawn to the surface OVER the lower depth one, even though they 
	appeared differently when drawing them regularly. This cannot be helped, and in 
	general when working with something like this it shouldn't be an issue, as you 
	want debris to be drawn over what came before.

	Also note that you can override the Collision event in the parent object (where 
	the instance is detroyed and caught by the surfaces) with your own code, as long 
	as you call the function "infd_instance_destroy" at some point. This function permits 
	you to add optional arguments for sprite, scale, colour, etc... so if an instance 
	doesn't use the default instance variables it can still be caught and rendered 
	correctly to the debris surfaces.

	Finally, sprites that have areas with an alpha other than 0 or 1 may appear slightly 
	different after being drawn to the surface (the demo includes an example of this). 
	This is due to the way surfaces and alpha work, and I have not tried to fix this 
	as it would require some form of premultiplaction of the alpha, which would seriously 
	affect performance when using large amount of debris instances. You can mitigate 
	this issue by setting an appropriate surface clear colour however, and functions are
	supplied to help you do just that.

	As always, I have tried to make the functions as easy to use as possible, and I 
	recommend that you go through each of them and read the descriptions to fully
	understand what they do before you use this asset. 

	Thanks for buying and I hope you have fun with my asset!

	Mark Alexander
	(Nocturne Games)

	*/










