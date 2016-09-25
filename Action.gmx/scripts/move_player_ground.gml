var sign_num;           // move direction setting

dir = argument0;
if (dir == DIR_RIGHT) {
    sign_num = 1;
} else {
    sign_num = -1;
}

if (place_free(x + (PLAYER_HSPEED * sign_num), y)) {
    if (keyboard_check(ord("Z"))) {
        hspeed = PLAYER_HSPEED * sign_num;
    } else {
        hspeed = PLAYER_WALK_HSPEED * sign_num;
    }
} else {
    move_contact_solid(180 * argument0, PLAYER_HSPEED);
}
