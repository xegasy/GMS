var sign_num;           // move direction setting
var move_size;          // move size
var move_max_speed;     // move max speed

dir = argument0;
if (dir == DIR_RIGHT) {
    sign_num = 1;
} else {
    sign_num = -1;
}

if (sign_num * hspeed > 0) {
    move_size = 1;
} else {
    move_size = 2;
}

if (keyboard_check(ord("Z"))) {
    move_max_speed = PLAYER_WALK_HSPEED * 1.5 * sign_num;
} else {
    move_max_speed = PLAYER_WALK_HSPEED * sign_num;
}

if (place_free(x + move_max_speed, y)) {
    if (abs(hspeed) <= abs(move_max_speed)) {
        hspeed += PLAYER_AIR_HSPEED * move_size * sign_num;
    } else {
        hspeed = move_max_speed;
    }
} else {
    move_contact_solid(180 * argument0, PLAYER_AIR_HSPEED);
    hspeed = 0;
}
