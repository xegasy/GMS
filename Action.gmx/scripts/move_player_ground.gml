var sign_num;           // move direction setting
var move_speed;         // move speed

dir = argument0;
if (dir == DIR_RIGHT) {
    sign_num = 1;
} else {
    sign_num = -1;
}

if (keyboard_check(ord("Z"))) {
    move_speed = PLAYER_RUN_HSPEED * sign_num;
} else {
    move_speed = PLAYER_WALK_HSPEED * sign_num;
}

if (place_free(x + move_speed, y)) {
    hspeed = move_speed;
} else {
    move_contact_solid(180 * argument0, PLAYER_RUN_HSPEED);
}
