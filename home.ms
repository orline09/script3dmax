rollout spl "Simple home v0.1" width:230 height:180
( --many windows and one door. Maybe it's trap
	button generate1 "Generate home" pos:[64,120] width:104 height:24 --
	spinner level "number of floors" pos:[64,16] width:128 height:16 range:[1,100,2] type:#integer 
	spinner w1 "width" pos:[64,36] width:128 height:16 range:[1,100,3] type:#integer 
	spinner l1 "length" pos:[64,56] width:128 height:16 range:[1,100,3]type:#integer 
	spinner win_heigth "height window" pos:[64,76] width:128 height:16 range:[0,100,4]
	spinner win_width "width window" pos:[64,96] width:128 height:16 range:[0,100,4]
	button btn2 "Clear" pos:[64,150] width:104 height:24 /*   */
	on generate1 pressed do
	(
		for ii=1 to level.value do( --create level 1... to many
			h=ii-1 -- usefull
			q=10 --maybe be usefull
			firstbox = box pos:[0,0,0+q*h] height:10 length:(l1.value*10) width:(w1.value*10) name:("level-" + (ii as string)) --box of level
			dopbox = box pos:[0,0,0.5+q*h] height:9 length:(l1.value*10-1) width:(w1.value*10-1) name:("fucking-trying, but delete in future// lol") 
			convertToMesh dopbox
		    convertToMesh firstbox;
			firstbox - dopbox
			delete dopbox --it's works// create level
			for u=1 to l1.value do
				(
					    if u==1 and ii==1 do (
							b=box pos:[w1.value*5-0.4,l1.value*5-(u-1)*10-5,0] height:6 length:3 width:1 name:("1door")
							convertToMesh b
							firstbox - b
							brt=box pos:[w1.value*5-0.2,l1.value*5-(u-1)*10-5.5,3]  height:0.5 length:1 width:1 name:("1door_handle")
							attachObjects b brt move:false
							attachObjects firstbox b move:false
							continue
							)  
						gll = box pos:[w1.value*5,l1.value*5-(u-1)*10-5,3+q*h] height:win_heigth.value length:win_width.value width:2  name:((ii as string)+"ram_glass")-- create glass
						convertToMesh gll
						firstbox - gll
						delete gll
				)
				for u=1 to l1.value do
				(
						gll = box pos:[-w1.value*5,l1.value*5-(u-1)*10-5,3+q*h] height:win_heigth.value length:win_width.value width:2  name:((ii as string)+"ram_glass")-- create glass
						convertToMesh gll
						firstbox - gll
						delete gll
				)
				for u=1 to w1.value do
				(
					gll = box pos:[w1.value*5-(u-1)*10-5,l1.value*5,3+q*h] height:win_heigth.value length:2 width:win_width.value  name:((ii as string)+"ram_glass")-- create glass
						convertToMesh gll
						firstbox - gll
						delete gll
					)
				for u=1 to w1.value do
				(
					gll = box pos:[w1.value*5-(u-1)*10-5,-l1.value*5,3+q*h] height:win_heigth.value length:2 width:win_width.value name:((ii as string)+"ram_glass")-- create glass
						convertToMesh gll
						firstbox - gll
						delete gll
					)
		
				)
	)
on btn2 pressed do ( 
try (delete $*)catch() 
) 
)
CreateDialog spl