object = argument[0]
with(object){
	var grav = grv
	var downUp = keyboard_check_pressed(vk_up)
	var downLeft = keyboard_check(vk_left)
	var downRight = keyboard_check(vk_right)
	var downDown = keyboard_check(vk_down)
	var move = downRight - downLeft
	var collx = place_meeting(x+move*spd,y,oWall)
	var colly = place_meeting(x,y+yvel,oWall)
	if(downLeft||downRight){
		xvel = spd*move
	}
	if(colly){
		yvel = 0
		while(!place_meeting(x,y+1,oWall))y++
	}
	if(collx){
		xvel = 0
		if(yvel>0)grv /= 4
	}
	if(((collx && yvel>0 && wallJumpTimer<=0)||place_meeting(x,y+1,oWall)) && downUp){
		
		if(collx && yvel>0 && wallJumpTimer<=0){wallJumpTimer = 15;yvel=0}
		yvel-=jumpHeight
	}
	wallJumpTimer--
	x+=xvel
	y+=yvel
	xvel = 0
	yvel+=grv
	grv = grav
	wallJumpTimer = max(0,wallJumpTimer)
}