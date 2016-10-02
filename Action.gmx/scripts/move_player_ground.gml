var sign_num;           // 移動方向（左方向：負数、右方向:正数）
var move_speed;         // 移動速度を保持

// 引数取得(移動方向)
dir = argument0;

// 移動方向設定
if (dir == DIR_RIGHT) {
    sign_num = 1;
} else {
    sign_num = -1;
}

// 移動最大速度を設定
if (keyboard_check(ord("Z"))) {
    // 地上ダッシュ速度に設定
    move_speed = PLAYER_RUN_HSPEED * sign_num;
} else {
    // 地上歩行速度に設定
    move_speed = PLAYER_WALK_HSPEED * sign_num;
}

// 移動先に何も存在しないことを確認
if (place_free(x + move_speed, y)) {
    // 移動速度を設定
    hspeed = move_speed;
} else {
    // オブジェクトまで移動させる
    move_contact_solid(180 * argument0, PLAYER_RUN_HSPEED);
    hspeed = 0;
}
