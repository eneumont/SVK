/// @description every frame
// You can write your code in this editor

//if(sprite_index != spr_character_death){

//if(player_health == 0){
//	sprite_index = spr_character_death;
//	audio_play_sound(snd_player_death, 5, false);
//}

on_ground = (place_meeting(x, y + 1, oPlatform) && y_vel = 0);

//walk
/*if(sprite_index != spr_character_dash){
	x_vel = 0;
	grv = .5;
}*/

if (keyboard_check(ord("A")) && (!used_dash || x_vel = 0)){
	x_vel = -walk_vel;	
	image_xscale = -1;
	if(on_ground && step_can_play){
		//audio_play_sound(snd_step, 10, false);
		step_can_play = false;
		alarm[3] = room_speed * .35;
	}
}

if (keyboard_check(ord("D")) && (!used_dash || x_vel = 0)){
	x_vel = walk_vel;	
	image_xscale = 1;
	if(on_ground && step_can_play){
		//audio_play_sound(snd_step, 10, false);
		step_can_play = false;
		alarm[3] = room_speed * .35;
	}
}

//dash
if (keyboard_check_pressed(vk_space) && !used_dash) {
	//sprite_index = spr_character_dash;
	image_index = 0;
	if (keyboard_check(ord("D"))){
		x_vel = dash_vel;
		y_vel = 0;
		alarm[0] = room_speed * .20;
		grv = 0;
	}
	if (keyboard_check(ord("A"))){
		x_vel = -dash_vel;
		alarm[0] = room_speed * .20;
		grv = 0;
		y_vel = 0;
	}
	if (keyboard_check(ord("W"))){
		y_vel = -dash_vel;
		alarm[0] = room_speed * .20;
		grv = 0;
	}
	if (keyboard_check(ord("S"))){
		y_vel = dash_vel;
		alarm[0] = room_speed * .20;
		grv = 0;
	}
	//screenshake(room_speed * .20, 3, 0.2);
	//audio_play_sound(snd_dash, 10, false);
	used_dash = true;
}

if (on_ground){
	used_dash = false;
}

//jump

if(on_ground && keyboard_check_pressed((ord("W")))){
 y_vel += jump_vel;
 //sprite_index = spr_character_jump;
 image_index = 0;
}


//horizontal collision
if (place_meeting(x + x_vel, y, oPlatform)){
	x_dir = sign(x_vel);
	while (!place_meeting(x + x_dir, y, oPlatform)) {
		x += x_dir;
	}
	x_vel = 0;
}

x += x_vel;

//gravity
y_vel += grv;

//vertical collision
if (place_meeting(x,y + y_vel, oPlatform)){
	y_dir = sign(y_vel);
	while (!place_meeting(x, y + y_dir, oPlatform)) {
		y += y_dir;
	}
	y_vel = 0;
}

y += y_vel;

//animation
/*if(sprite_index != spr_character_dash && 
sprite_index != spr_character_jump && 
sprite_index != spr_character_death && 
sprite_index != spr_character_spawn){
	sprite_index = (x_vel != 0) ? spr_character_walk : spr_character_idle;
}*/

