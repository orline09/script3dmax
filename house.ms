rollout spl "Simple home v0.1" width:230 height:100 
(
	button generate1 "Generate home" pos:[64,40] width:104 height:24 --
	spinner level "number of floors" pos:[64,16] width:128 height:16 range:[1,100,2] type:#integer 
	button btn2 "Clear" pos:[64,68] width:104 height:24 /*   */
	on generate1 pressed do
	(
		firstbox = box name:("levehone")
		firstbox.lengthsegs = 10
        firstbox.widthsegs = 10
		firstbox.heightsegs = 10
		firstbox.mapCoords = true
		--b=box pos: [12,0,0] scale: [0.1,0.3,0.5] name:("door")
		--brt=box pos: [13,2,4.5] scale: [0.05,0.1,0.05] name:("door_handle")
		levelhome=#()
		
		dd=#() --array of window and ram
		gl=#()
		append gl (box pos: [0,0,0] scale:[0.1,0.4,0.4] color:blue name:("ram_glass")) -- create glass
		append gl (box pos:[1.1,0,8.75] scale:[0.05,0.4,0.05] name:("ram1"))
		append gl (box pos:[1.1,0,0] scale:[0.05,0.4,0.05] name:("ram2"))
	    append gl (box pos:[1.1,4.75,0] scale:[0.05,0.05,0.4] name:("ram3"))
	    append gl (box pos:[1.1,-4.75,0] scale:[0.05,0.05,0.4] name:("ram4"))
		append gl (box pos:[1.1,0,0] scale:[0.05,0.05,0.4] name:("ram5"))
		append gl (box pos:[1.1,0,8.75/2] scale:[0.05,0.4,0.05] name:("ram6"))
			for i=2 to 7 do 
			(
				attachObjects gl[1] gl[i] move:false
				
			)
		p=#()
		maxOps.CloneNodes gl expandHierarchy:true  actualNodeList:&gl newNodes:&p
		append dd gl
		append dd p
		maxOps.CloneNodes gl expandHierarchy:true  actualNodeList:&gl newNodes:&p
		append dd p
		maxOps.CloneNodes gl expandHierarchy:true  actualNodeList:&gl newNodes:&p
		append dd p
		rr=dd[4]
		ff=group dd[1] select:false
		move ff [0,12,7]
		rot=eulerangles 0 0 90
		rotate ff rot
		ungroup ff
		ff=group dd[2] select:false
		move ff [0,-12,7]
		rot=eulerangles 0 0 270
		rotate ff rot
		ungroup ff
		ff=group dd[3] select:false
		move ff [-12,0,7]
		rot=eulerangles 0 0 180
		rotate ff rot 
		ungroup ff
		ff=group dd[4] select:false
		move ff [12,0,7]
		ungroup ff
		--ff=group $* select:false name:("q")
		--maxOps.CloneNodes ff expandhierarchy:true actualNodeList:&gl newNodes:&p
		--ungroup ff
		for ii=2 to level.value do(
		 ff=group $* select:false
		 maxOps.CloneNodes ff expandhierarchy:true actualNodeList:&gl newNodes:&p
		 ungroup
		 ff=group p select:false
		 move ff[0,0,20]
		 ungroup ff
		)
		try (delete &rr) catch()
		
		/*for ii=2 to level do
		(
			maxOps.CloneNodes ff expandhierarchy:true actualNodeList:&gl newNodes:&p
			move p [0,0,50]
		)*/

	)
on btn2 pressed do ( 
try (delete $*)catch() 
) 
)
CreateDialog spl