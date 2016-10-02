var sign_num;           // 移動方向（左方向：負数、右方向:正数）
var move_size;          // 移動幅設定
var move_max_speed;     // 移動最大速度を保持

// 引数取得(移動方向)
dir = argument0;

// 移動方向設定
if (dir == DIR_RIGHT) {
    sign_num = 1;
} else {
    sign_num = -1;
}

// 右方向移動時に左方向へ転換した場合、慣性を打ち消すために移動量を増やす
if (sign_num * hspeed > 0) {
    move_size = 1;
} else {
    move_size = 2;
}

// 移動最大速度を設定
if (keyboard_check(ord("Z"))) {
    // 地上ダッシュ速度の80%に設定
    move_max_speed = PLAYER_RUN_HSPEED * 0.8 * sign_num;
} else {
    // 地上歩行速度に設定
    move_max_speed = PLAYER_WALK_HSPEED * sign_num;
}

// 移動先に何も存在しないことを確認
if (place_free(x + move_max_speed, y)) {
    // 最高速度を超えていないことを確認
    if (abs(hspeed) <= abs(move_max_speed)) {
        // 空中移動量 * 移動量し移動方向を設定
        hspeed += PLAYER_AIR_HSPEED * move_size * sign_num;
    } else {
        // 最高速度を設定
        hspeed = move_max_speed;
    }
} else {
    // オブジェクトまで移動しプレイヤーオブジェクトの移動を止める
    move_contact_solid(180 * argument0, PLAYER_AIR_HSPEED);
    hspeed = 0;
}
