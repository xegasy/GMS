var sign_num;           // move direction setting
var move_size;           // move size

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

if (place_free(x + (PLAYER_WALK_HSPEED * sign_num), y)) {
    if (abs(hspeed) <= PLAYER_WALK_HSPEED) {
        hspeed += PLAYER_AIR_HSPEED * move_size * sign_num;
    } else {
        hspeed = PLAYER_WALK_HSPEED * sign_num;
    }
} else {
    move_contact_solid(180 * argument0, PLAYER_AIR_HSPEED);
    hspeed = 0;
}
