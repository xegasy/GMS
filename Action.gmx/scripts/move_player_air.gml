var sign_num;           // move direction setting

dir = argument0;
if (dir == DIR_RIGHT) {
    sign_num = 1;
} else {
    sign_num = -1;
}

if (place_free(x + (PLAYER_HSPEED * sign_num), y)) {
    if (abs(hspeed) <= PLAYER_HSPEED) {
        hspeed += PLAYER_AIR_HSPEED * sign_num;
    } else {
        hspeed = PLAYER_HSPEED * sign_num;
    }
} else {
    move_contact_solid(180 * argument0, PLAYER_AIR_HSPEED);
}
