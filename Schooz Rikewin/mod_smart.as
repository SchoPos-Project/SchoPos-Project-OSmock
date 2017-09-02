;-----------------------------------------------------
;
; HSP3用スマートフォンモジュール「mod_smart.as」
;
; Ver 2.2
;
; By. しまくろねこ
;
; http://www.geocities.jp/simakuroneko646/
;
; simakuroneko@gmail.com
;
;-----------------------------------------------------

#module mod_smart

#const SARCH_TIME_MAX 				863999999;235959999
#const DEFAULT_TAP_INTERVAL 		400
#const DEFAULT_TOUCH_INTERVAL 		1000
#const DEFAULT_DRAG_INTERVAL        1000
#const DEFAULT_DOUBLE_TAP_INTERVAL 	700
#const DEFAULT_SWIPE_INTERVAL 		600
#const POINT_SPLIT					8
#const KEY_MOUSE_LEFT 				256
#const KEY_MOUSE_RIGHT 				512


;-----------------------------------------------------
; smart_init
;
; モジュールの初期処理
;-----------------------------------------------------
#deffunc smart_init

	;smart_one用
	one_click_left  = 0
	one_click_right = 0

	;(共通)
	;smrat_tap(タップ)
	;smart_touch(タッチ)
	;smart_dtap(ダブルタップ)
	;smart_drag(ドラッグ)
	;smart_vswipe,smart_hswipe((スワイプ)用
	dim tv,    1, 2, 4
	dim cp,    1, 4
	dim moux,  1, 4
	dim mouy,  1, 4
	dim add_m, 1
/*
	;タッチ(長押し)用
	dim tv, 2, 4
	dim cp, 4
	dim moux, 4
	dim mouy, 4
	
	;ドラッグ用
	dim tv, 2, 3
	dim cp, 3
	dim moux, 3
	dim mouy, 3

	;ダブルタップ用
	dim tv, 2, 4
	dim cp, 4
	dim moux, 4
	dim mouy, 4
	
	;縦スワイプ用
	dim tv, 2, 3
	dim cp, 3
	dim moux, 3
	dim mouy, 3

	;横スワイプ用
	dim tv, 2, 3
	dim cp, 3
	dim moux, 3
	dim mouy, 3
*/
	
	

	return


;-----------------------------------------------------
; smart_mousearea
;
; 指定の領域内にマウスカーソルがあるか取得
;
; x1 : 左上X座標
; y1 : 左上Y座標
; x2 : 右上X座標
; y2 : 右上Y座標
;
; 戻り値(0 = 指定の領域内にマウスカーソルがない)
;       (1 = 指定の領域内にマウスカーソルがある)
;
;=====================================================
; SAMPLE
;	if smart_mousearea(0, 0, 100, 200) = 1 : dialog "OK"
;-----------------------------------------------------
#defcfunc smart_mousearea int x1, int y1, int x2, int y2

	;area_res = ((mousex >= x1) & (mousex <= x2) & (mousey >= y1) & (mousey <= y2))

	area_res = 0
	
	if mousex >= x1 {
		if mousex <= x2 {
			if mousey >= y1 {
				if mousey <= y2 {
					area_res  = 1
				}
			}
		}
	}
	
	return area_res


;-----------------------------------------------------
; smart_add
;
; タップ等の操作を取得するためのアクションを追加します。
;
;
; add_mode           : 追加するアクションモード(※例えば、0=タップ, 1=タッチ, 2=ドラッグ, 3=ダブルタップ, 4=縦スワイプ, 5=横スワイプ　など)
;                      (※smart_get関数で指定したアクション番号がどの操作のものかを調べるのに利用してください)
;                      (※アクションモードは省略可能です)
;
; 命令終了後、システム変数(stat)にアクション番号が入ります。
;
;=====================================================
; SAMPLE
;
;	smart_add 1 : act_number = stat
;
;-----------------------------------------------------
#deffunc smart_add int add_mode

	;----------------- tv
	d1 = length(tv)
	d2 = length2(tv)
	d3 = length3(tv)
	
	dim d_tv, d1, d2, d3
	
	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			repeat d3
				cnt_d3 = cnt 
				d_tv(cnt_d1, cnt_d2, cnt_d3) = tv(cnt_d1, cnt_d2, cnt_d3)
			loop
		loop
	loop

	dim tv, d1 + 1, d2, d3

	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			repeat d3
				cnt_d3 = cnt 
				tv(cnt_d1, cnt_d2, cnt_d3) = d_tv(cnt_d1, cnt_d2, cnt_d3)
			loop
		loop
	loop

	dim d_tv, 1, 1, 1

	;----------------- cp
	d1 = length(cp)
	d2 = length2(cp)
	
	dim d_cp, d1, d2
	
	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			d_cp(cnt_d1, cnt_d2) = cp(cnt_d1, cnt_d2)
		loop
	loop

	dim cp, d1 + 1, d2

	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			cp(cnt_d1, cnt_d2) = d_cp(cnt_d1, cnt_d2)
		loop
	loop

	dim d_cp, 1, 1

	;----------------- moux
	d1 = length(moux)
	d2 = length2(moux)
	
	dim d_moux, d1, d2
	
	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			d_moux(cnt_d1, cnt_d2) = moux(cnt_d1, cnt_d2)
		loop
	loop

	dim moux, d1 + 1, d2

	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			moux(cnt_d1, cnt_d2) = d_moux(cnt_d1, cnt_d2)
		loop
	loop

	dim d_moux, 1, 1

	;----------------- mouy
	d1 = length(mouy)
	d2 = length2(mouy)
	
	dim d_mouy, d1, d2
	
	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			d_mouy(cnt_d1, cnt_d2) = mouy(cnt_d1, cnt_d2)
		loop
	loop

	dim mouy, d1 + 1, d2

	repeat d1
		cnt_d1 = cnt
		repeat d2
			cnt_d2 = cnt
			mouy(cnt_d1, cnt_d2) = d_mouy(cnt_d1, cnt_d2)
		loop
	loop

	dim d_mouy, 1, 1

	;----------------- add_m
	d1 = length(add_m)
	
	dim d_add_m, d1
	
	repeat d1
		cnt_d1 = cnt
		d_add_m(cnt_d1) = add_m(cnt_d1)
	loop

	dim add_m, d1 + 1

	repeat d1
		cnt_d1 = cnt
		add_m(cnt_d1) = d_add_m(cnt_d1)
	loop
	
	re = d1 - 1	
	
	add_m(re) = add_mode

	dim d_add_m, 1

;	mref re, 64

	return re


;-----------------------------------------------------
; smart_mode_get
;
; 指定のアクション番号からアクションモードを取得します。
;
;
; act_num           : アクションモードを取得したいアクション番号
;
;
; 戻り値
;   0 ～ = アクションモード
;
;
;=====================================================
; SAMPLE
;
;   smart_add, 1
;   action_number = stat
;	action_mode = smart_mode_get(action_number)
;
;   title "" + action_mode
;
;-----------------------------------------------------
#defcfunc smart_mode_get int act_num

	d1 = length(add_m) - 1

	if act_num >= d1 : re = -1 : else : re = add_m(act_num)

	return re


;-----------------------------------------------------
; smart_tap
;
; タップを取得
;
;
; act_num           : アクションを取得するアクション番号
; tap_key           : stick命令から取得したキー情報が格納された変数。(stick命令は必ず非トリガータイプキー指定に256か512を指定すること！)
; tap_button        : タップを取得するマウスボタン(256 = 左, 512 = 右)
; x1, y1, x2, y2    : タップを認識する画面座標
; tap_interval      : 指定の時間の間に画面を指で押して離すまでをタップと認識する(単位：ミリ秒)。省略時は、400ミリ秒とする。
;
;
; 戻り値
;   0 = タップされていない
;   1 = タップされ始めた(画面に指をつけられた)
;   2 = タップが終わった(画面から指を離された)
;
;
;=====================================================
; SAMPLE
;
;   stick key, 256
;	if smart_tap(key, 256, 0, 0, 319, 479, 400) = 2 : mes "TAP OK"
;
;-----------------------------------------------------
#defcfunc smart_tap int act_num, int tap_key, int tap_button, int x1, int y1, int x2, int y2, int tap_interval

	t_interval = tap_interval
	if t_interval = 0 : t_interval = DEFAULT_TAP_INTERVAL
	p1 = tap_button / 256 - 1

	if (tap_key & KEY_MOUSE_LEFT) | (tap_key & KEY_MOUSE_RIGHT) {
		if tap_key ! tap_button : return 0
		i          = cp(act_num, p1)
		hour       = gettime(4) * 1000 * 60 * 60
		minute     = gettime(5) * 1000 * 60
		second     = gettime(6) * 1000
		tv(act_num, p1, i) = hour + minute + second + gettime(7)
		moux(act_num, i)   = mousex
		mouy(act_num, i)   = mousey
		
		if i = 0 {
			cp(act_num, p1) = 1
			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0 : else : return 1
		}
		
		if i = 1 {
			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0

			re = 0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0
			
			if tv(act_num, p1, 0) > tv(act_num, p1, 1) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, 1)
			t = tv(act_num, p1, 1) - tv(act_num, p1, 0)
			if (t > t_interval) & (t_interval ! -1) : return 0 : else : return 1
		}
	}

	if tap_key = 0 {
		i  = cp(act_num, p1)
		if i = 1 {
			hour   = gettime(4) * 1000 * 60 * 60
			minute = gettime(5) * 1000 * 60
			second = gettime(6) * 1000
			tv(act_num, p1, i) = hour + minute + second + gettime(7)
			moux(act_num, i)   = mousex
			mouy(act_num, i)   = mousey
			if tv(act_num, p1, 0) > tv(act_num, p1, 1) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, 1)
			t = tv(act_num, p1, 1) - tv(act_num, p1, 0)

			if (t <= t_interval) | (t_interval = -1) {
				
				cp(act_num, p1) = 2
	
				re = 0
				if (moux(act_num, 0) >= x1) {
					if (moux(act_num, 0) <= x2) {
						if (mouy(act_num, 0) >= y1) {
							if (mouy(act_num, 0) <= y2) {
								re = 1
							}
						}
					}
				}
				if re = 0 : return 0
	
				re = 0
				if (moux(act_num, 1) >= x1) {
					if (moux(act_num, 1) <= x2) {
						if (mouy(act_num, 1) >= y1) {
							if (mouy(act_num, 1) <= y2) {
								re = 1
							}
						}
					}
				}
				if re = 0 : return 0 : else : return 2
			}
		}
	}
	
	tv(act_num, p1, 0) = 0
	tv(act_num, p1, 1) = 0
	tv(act_num, p1, 2) = 0
	tv(act_num, p1, 3) = 0
	cp(act_num, p1)    = 0

	return 0
	

;-----------------------------------------------------
; smart_touch
;
; タッチ(長押し)を取得  (※タッチが認識された後、そのまま指が押されていてもタッチと認識されません。)
;
;
; act_num           : アクションを取得するアクション番号
; touch_key         : stick命令から取得したキー情報が格納された変数。(stick命令は必ず非トリガータイプキー指定に256か512を指定すること！)
; touch_button      : タッチを取得するマウスボタン(256 = 左, 512 = 右)
; x1, y1, x2, y2    : タッチを認識する画面座標
; touch_interval    : タッチと認識するまでの時間(単位：ミリ秒)。省略時は、1000ミリ秒とする。
;
;
; 戻り値
;   0 = タッチ(長押し)されていない
;   1 = タッチ(長押し)された(画面に指をつけ続けられた)
;   2 = タッチ(長押し)が終わった(画面から指を離された)
;
;
;=====================================================
; SAMPLE
;
;   stick key, 256
;	if smart_touch(key, 256, 0, 0, 319, 479, 1000) = 1 : mes "TOUCH OK"
;
;-----------------------------------------------------
#defcfunc smart_touch int act_num, int touch_key, int touch_button, int x1, int y1, int x2, int y2, int touch_interval;, int stop_mode

	t_interval = touch_interval
	if t_interval = 0 : t_interval = DEFAULT_TOUCH_INTERVAL
	p1 = touch_button / 256 - 1

	if (touch_key & KEY_MOUSE_LEFT) | (touch_key & KEY_MOUSE_RIGHT) {
		if touch_key ! touch_button : return 0
		
		if cp(act_num, p1) = 2 : return 0

		i      = cp(act_num, p1)
		hour   = gettime(4) * 1000 * 60 * 60
		minute = gettime(5) * 1000 * 60
		second = gettime(6) * 1000
		tv(act_num, p1, i) = hour + minute + second + gettime(7)
		moux(act_num, i)   = mousex
		mouy(act_num, i)   = mousey

		if i = 0 {
			cp(act_num, p1) = 1
			return 0
		}
		
		if i = 1 {

			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0

			if tv(act_num, p1, 0) > tv(act_num, p1, 1) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, 1)
			t = tv(act_num, p1, 1) - tv(act_num, p1, 0)
			if t < t_interval : return 0
			
			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0
	
			re = 0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0

			tv(act_num, p1, 0) = 0
			tv(act_num, p1, 1) = 0
			cp(act_num, p1)    = 2
			return 1

		}
	}

	if touch_key = 0 {
		i  = cp(act_num, p1)
		if i = 2 {

			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							tv(act_num, p1, 0) = 0
							tv(act_num, p1, 1) = 0
							cp(act_num, p1)    = 3
							return 2
						}
					}
				}
			}

;			tv(p1, 0) = 0
;			tv(p1, 1) = 0
;			cp(p1)    = 3
;			return 2
		}			
	}

	tv(act_num, p1, 0) = 0
	tv(act_num, p1, 1) = 0
	tv(act_num, p1, 2) = 0
	tv(act_num, p1, 3) = 0
	cp(act_num, p1) = 0
	return 0


;-----------------------------------------------------
; smart_drag
;
; ドラッグを取得
;
;
; act_num           : アクションを取得するアクション番号
; drag_key          : stick命令から取得したキー情報が格納された変数。(stick命令は必ず非トリガータイプキー指定に256か512を指定すること！)
; drag_button       : ドラッグを取得するマウスボタン(256 = 左, 512 = 右)
; x1, y1, x2, y2    : ドラッグを認識する画面座標領域
; drag_interval     : ドラッグと認識するまでの時間(単位：ミリ秒)。省略時は、1000ミリ秒とする。
;
;
; 戻り値
;   0 = ドラッグされていない
;   1 = ドラッグされている(画面に指をつけ続けられた)
;   2 = ドラッグが終了された(画面から指を離された)
;
;
;=====================================================
; SAMPLE
;
;   repeat
;        redraw 0
;
;        color 255, 0, 0
;        boxf x, y, x + 200, y + 200
;
;        stick key, 256
;        drag = smart_drag(key, 256, x, y, x + 170, y + 50, 1000)
;
;        if drag = 0 {
;             start_x = mousex - x
;             start_y = mousey - y
;	     }
;        if drag = 1 {
;             x = mousex - start_x
;             y = mousey - start_y
;        }
;        if drag = 2 {
;             mes "DRAG FINISH"
;             wait 1000
;        }
;
;        redraw 1
;        wait 1
;   loop
;
;-----------------------------------------------------
#defcfunc smart_drag int act_num, int drag_key, int drag_button, int x1, int y1, int x2, int y2, int drag_interval

	t_interval = drag_interval
	if t_interval = 0 : t_interval = DEFAULT_DRAG_INTERVAL
	p1 = drag_button / 256 - 1

	if (drag_key & KEY_MOUSE_LEFT) | (drag_key & KEY_MOUSE_RIGHT) {
		if drag_key ! drag_button : return 0
		i      = cp(act_num, p1)
		hour   = gettime(4) * 1000 * 60 * 60
		minute = gettime(5) * 1000 * 60
		second = gettime(6) * 1000
		tv(act_num, p1, i) = hour + minute + second + gettime(7)
		moux(act_num, i)   = mousex
		mouy(act_num, i)   = mousey

		if i = 0 {
			cp(act_num, p1) = 1
			return 0
		}
		
		if i = 1 {

			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0

			if tv(act_num, p1, 0) > tv(act_num, p1, 1) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, 1)
			t = tv(act_num, p1, 1) - tv(act_num, p1, 0)
			if t < t_interval : return 0

			moux(act_num, 0) = moux(act_num, 1)
			mouy(act_num, 0) = mouy(act_num, 1)
			
			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0
	
			re = 0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0 : else : return 1
		}
	}

	if drag_key = 0 {
		i  = cp(act_num, p1)
		if i = 1 {
			hour   = gettime(4) * 1000 * 60 * 60
			minute = gettime(5) * 1000 * 60
			second = gettime(6) * 1000
			tv(act_num, p1, i) = hour + minute + second + gettime(7)
			moux(act_num, i)   = mousex
			mouy(act_num, i)   = mousey
			if tv(act_num, p1, 0) > tv(act_num, p1, 1) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, 1)
			t = tv(act_num, p1, 1) - tv(act_num, p1, 0)

			if t >= t_interval {
				
				cp(act_num, p1) = 2
	
				re = 0
				if (moux(act_num, 0) >= x1) {
					if (moux(act_num, 0) <= x2) {
						if (mouy(act_num, 0) >= y1) {
							if (mouy(act_num, 0) <= y2) {
								re = 1
							}
						}
					}
				}
				if re = 0 : return 0
	
				re = 0
				if (moux(act_num, 1) >= x1) {
					if (moux(act_num, 1) <= x2) {
						if (mouy(act_num, 1) >= y1) {
							if (mouy(act_num, 1) <= y2) {
								re = 1
							}
						}
					}
				}
				if re = 0 : return 0 : else : return 2
			}
		}
	}

	tv(act_num, p1, 0) = 0
	tv(act_num, p1, 1) = 0
	tv(act_num, p1, 2) = 0
	tv(act_num, p1, 3) = 0
	cp(act_num, p1) = 0
	return 0


;-----------------------------------------------------
; smart_dtap
;
; ダブルタップを取得
;
;
; act_num             : アクションを取得するアクション番号
; double_tap_key      : stick命令から取得したキー情報が格納された変数。(stick命令は必ず非トリガータイプキー指定に256か512を指定すること！)
; double_dtap_button  : ダブルタップを取得するマウスボタン(256 = 左, 512 = 右)
; x1, y1, x2, y2      : ダブルタップを認識する画面座標
; double_tap_interval : 指定の時間の間に画面を指で押して離して押すまでをダブルタップと認識する(単位：ミリ秒)。省略時は、700ミリ秒とする。
;
;
; 戻り値
;   0 = ダブルタップされていない
;   1 = １回目のタップがされた(画面に指をつけられた)
;   2 = １回目のタップが終わった(画面から指を離された)
;   3 = ２回目のタップ(ダブルタップ)がされた(画面に指をつけられた)
;
;
;=====================================================
; SAMPLE
;
;   stick key, 256
;   if smart_dtap(key, 256, 0, 0, 319, 479, 700) = 3 : mes "DOUBLE TAP OK"
;
;-----------------------------------------------------
#defcfunc smart_dtap int act_num, int double_tap_key, int double_tap_button, int x1, int y1, int x2, int y2, int double_tap_interval

	t_interval = double_tap_interval
	if t_interval = 0 : t_interval = DEFAULT_DOUBLE_TAP_INTERVAL
	p1 = double_tap_button / 256 - 1

	if (double_tap_key & KEY_MOUSE_LEFT) | (double_tap_key & KEY_MOUSE_RIGHT) {
		if double_tap_key ! double_tap_button : return 0
		i      = cp(act_num, p1)
		hour   = gettime(4) * 1000 * 60 * 60
		minute = gettime(5) * 1000 * 60
		second = gettime(6) * 1000
		tv(act_num, p1, i) = hour + minute + second + gettime(7)
		moux(act_num, i)   = mousex
		mouy(act_num, i)   = mousey
		
		if i = 0 {
			cp(act_num, p1) = 1
			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0 : else : return 1
		}
		
		if i = 1 {
			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0

			re = 0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0
			
			if tv(act_num, p1, 0) > tv(act_num, p1, 1) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, 1)
			t = tv(act_num, p1, 1) - tv(act_num, p1, 0)
			if t > t_interval : return 0 : else : return 1
		}

		if i = 2 {
			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0

			re = 0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0
	
			re = 0
			if moux(act_num, 2) >= x1 {
				if moux(act_num, 2) <= x2 {
					if mouy(act_num, 2) >= y1 {
						if mouy(act_num, 2) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0

			if tv(act_num, p1, 0) > tv(act_num, p1, 2) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, 2)
			t = tv(act_num, p1, 2) - tv(act_num, p1, 0)
			if t > t_interval : return 0
			cp(act_num, p1) = 3
			return 3
		}
	
		if i = 3 : return 0
		
	}

	if double_tap_key = 0 {
		i  = cp(act_num, p1)
		if (i = 1) | (i = 2) {
			hour   = gettime(4) * 1000 * 60 * 60
			minute = gettime(5) * 1000 * 60
			second = gettime(6) * 1000
			tv(act_num, p1, i) = hour + minute + second + gettime(7)
			moux(act_num, i)   = mousex
			mouy(act_num, i)   = mousey
			if tv(act_num, p1, 0) > tv(act_num, p1, i) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, i)
			t = tv(act_num, p1, i) - tv(act_num, p1, 0)

			if t <= t_interval {

				cp(act_num, p1) = 2
	
				re = 0
				if (moux(act_num, 0) >= x1) {
					if (moux(act_num, 0) <= x2) {
						if (mouy(act_num, 0) >= y1) {
							if (mouy(act_num, 0) <= y2) {
								re = 1
							}
						}
					}
				}
				;if re = 0 : return 0
				if re = 0 {
					cp(act_num, p1) = 0
					return 0
				}

				re = 0
				if (moux(act_num, i) >= x1) {
					if (moux(act_num, i) <= x2) {
						if (mouy(act_num, i) >= y1) {
							if (mouy(act_num, i) <= y2) {
								re = 1
							}
						}
					}
				}
				if re = 0 : return 0 : else : return 2
			}
		}
	}
	
	tv(act_num, p1, 0) = 0
	tv(act_num, p1, 1) = 0
	tv(act_num, p1, 2) = 0
	tv(act_num, p1, 3) = 0	
	cp(act_num, p1)    = 0

	return 0


;-----------------------------------------------------
; smart_vswipe
;
; 縦スワイプを取得
;
;
; act_num           : アクションを取得するアクション番号
; swipe_key         : stick命令から取得したキー情報が格納された変数。(stick命令は必ず非トリガータイプキー指定に256か512を指定すること！)
; swipe_button      : 縦スワイプを取得するマウスボタン(256 = 左, 512 = 右)
; x1, y1, x2, y2    : 縦スワイプを認識する画面座標
; swipe_interval    : 指定の時間の間に画面を指で押して離すまでを縦スワイプと認識する(単位：ミリ秒)。省略時は、600ミリ秒とする。
; min_movement      : 縦スワイプと認識する縦の最小移動量
; max_movement      : 縦スワイプと認識する縦の最大移動量
;
;
; 戻り値
;    0 = スワイプされていない
;    1 = タップがされた(画面に指をつけられた)
;
;    2 = 上から下にスワイプされた(画面から指が離された) (小さく指を払った)
;    3 = 上から下にスワイプされた(画面から指が離された)
;    4 = 上から下にスワイプされた(画面から指が離された)
;    5 = 上から下にスワイプされた(画面から指が離された)
;    6 = 上から下にスワイプされた(画面から指が離された)
;    7 = 上から下にスワイプされた(画面から指が離された)
;    8 = 上から下にスワイプされた(画面から指が離された)
;    9 = 上から下にスワイプされた(画面から指が離された)
;   10 = 上から下にスワイプされた(画面から指が離された)
;   11 = 上から下にスワイプされた(画面から指が離された) (大きく指を払った)
;
;   -2 = 下から上にスワイプされた(画面から指が離された) (小さく指を払った)
;   -3 = 下から上にスワイプされた(画面から指が離された)
;   -4 = 下から上にスワイプされた(画面から指が離された)
;   -5 = 下から上にスワイプされた(画面から指が離された)
;   -6 = 下から上にスワイプされた(画面から指が離された)
;   -7 = 下から上にスワイプされた(画面から指が離された)
;   -8 = 下から上にスワイプされた(画面から指が離された)
;   -9 = 下から上にスワイプされた(画面から指が離された)
;  -10 = 下から上にスワイプされた(画面から指が離された)
;  -11 = 下から上にスワイプされた(画面から指が離された) (大きく指を払った)
;
;=====================================================
; SAMPLE
;
;   stick key, 256
;	if smart_vswipe(key, 256, 0, 0, 319, 479, 400, 10, 479) = 2 : mes "VERTICAL SWIPE OK"
;
;-----------------------------------------------------
#defcfunc smart_vswipe int act_num, int swipe_key, int swipe_button, int x1, int y1, int x2, int y2, int swipe_interval, int min_movement, int max_movement

	t_interval = swipe_interval
	if t_interval = 0 : t_interval = DEFAULT_SWIPE_INTERVAL
	p1 = swipe_button / 256 - 1

	if (swipe_key & KEY_MOUSE_LEFT) | (swipe_key & KEY_MOUSE_RIGHT) {
		if swipe_key ! swipe_button : return 0
		i      = cp(act_num, p1)
		hour   = gettime(4) * 1000 * 60 * 60
		minute = gettime(5) * 1000 * 60
		second = gettime(6) * 1000
		tv(act_num, p1, i) = hour + minute + second + gettime(7)
		moux(act_num, i)   = mousex
		mouy(act_num, i)   = mousey
		
		if i = 0 {
			cp(act_num, p1) = 1
			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0 : else : return 1
		}
		
		if i = 1 {
			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0

			re = 0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0
			
			if tv(act_num, p1, 0) > tv(act_num, p1, 1) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, 1)
			t = tv(act_num, p1, 1) - tv(act_num, p1, 0)
			if (t > t_interval) & (t_interval ! -1) : return 0 : else : return 1
		}
	}

	if swipe_key = 0 {
		i  = cp(act_num, p1)
		if i = 1 {
			hour   = gettime(4) * 1000 * 60 * 60
			minute = gettime(5) * 1000 * 60
			second = gettime(6) * 1000
			tv(act_num, p1, i) = hour + minute + second + gettime(7)
			moux(act_num, i)   = mousex
			mouy(act_num, i)   = mousey
			if tv(act_num, p1, 0) > tv(act_num, p1, 1) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, 1)
			t = tv(act_num, p1, 1) - tv(act_num, p1, 0)

			if (t <= t_interval) | (t_interval = -1) {
				
				cp(act_num, p1) = 2
	
				re = 0
				if (moux(act_num, 0) >= x1) {
					if (moux(act_num, 0) <= x2) {
						if (mouy(act_num, 0) >= y1) {
							if (mouy(act_num, 0) <= y2) {
								re = 1
							}
						}
					}
				}
				if re = 0 : return 0
	
				re = 0
				if (moux(act_num, 1) >= x1) {
					if (moux(act_num, 1) <= x2) {
						if (mouy(act_num, 1) >= y1) {
							if (mouy(act_num, 1) <= y2) {
								re = 1
							}
						}
					}
				}
				if re = 0 : return 0; : else : return 2

				move_way    = 0
				move_moment = 0
				move_moment = mouy(act_num, 0) - mouy(act_num, 1)
				abs_moment  = abs(move_moment)

				dim y_point, POINT_SPLIT
				
				y_point(0) = y1 + (abs(y1 - y2) / 10)
				repeat POINT_SPLIT
					y_point(cnt + 1) = y_point(cnt) + (abs(y1 - y2) / 10)
				loop

				re = 0
				if abs_moment >= min_movement {
					if abs_moment <= max_movement {
						re = 1
					}
				}
				if re = 0 : return 0
				
				if move_moment = 0 : return 0
				if move_moment < 0 : move_way = 1	;上から下
				if move_moment > 0 : move_way = 2	;下から上

				if abs_moment >= y1 {
					if abs_moment <= y_point(0) {
						if move_way = 1 : return 2	;上から下
						if move_way = 2 : return -2	;下から上
					}
				}
				if abs_moment > y_point(0) {
					if abs_moment <= y_point(1) {
						if move_way = 1 : return 3	;上から下
						if move_way = 2 : return -3	;下から上
					}
				}
				if abs_moment > y_point(1) {
					if abs_moment <= y_point(2) {
						if move_way = 1 : return 4	;上から下
						if move_way = 2 : return -4	;下から上
					}
				}
				if abs_moment > y_point(2) {
					if abs_moment <= y_point(3) {
						if move_way = 1 : return 5	;上から下
						if move_way = 2 : return -5	;下から上
					}
				}
				if abs_moment > y_point(3) {
					if abs_moment <= y_point(4) {
						if move_way = 1 : return 6	;上から下
						if move_way = 2 : return -6	;下から上
					}
				}
				if abs_moment > y_point(4) {
					if abs_moment <= y_point(5) {
						if move_way = 1 : return 7	;上から下
						if move_way = 2 : return -7	;下から上
					}
				}
				if abs_moment > y_point(5) {
					if abs_moment <= y_point(6) {
						if move_way = 1 : return 8	;上から下
						if move_way = 2 : return -8	;下から上
					}
				}
				if abs_moment > y_point(6) {
					if abs_moment <= y_point(7) {
						if move_way = 1 : return 9	;上から下
						if move_way = 2 : return -9	;下から上
					}
				}
				if abs_moment > y_point(7) {
					if abs_moment <= y_point(8) {
						if move_way = 1 : return 10		;上から下
						if move_way = 2 : return -10	;下から上
					}
				}
				if abs_moment > y_point(8) {
					if abs_moment <= y2 {
						if move_way = 1 : return 11		;上から下
						if move_way = 2 : return -11	;下から上
					}
				}

			}
		}
	}
	
	tv(act_num, p1, 0) = 0
	tv(act_num, p1, 1) = 0
	tv(act_num, p1, 2) = 0
	tv(act_num, p1, 3) = 0
	cp(act_num, p1)    = 0

	return 0


;-----------------------------------------------------
; smart_hswipe
;
; 横スワイプを取得
;
;
; act_num           : アクションを取得するアクション番号
; swipe_key         : stick命令から取得したキー情報が格納された変数。(stick命令は必ず非トリガータイプキー指定に256か512を指定すること！)
; swipe_button      : 横スワイプを取得するマウスボタン(256 = 左, 512 = 右)
; x1, y1, x2, y2    : 横スワイプを認識する画面座標
; swipe_interval    : 指定の時間の間に画面を指で押して離すまでを横スワイプと認識する(単位：ミリ秒)。省略時は、600ミリ秒とする。
; min_movement      : 横スワイプと認識する最小移動量
; max_movement      : 横スワイプと認識する最大移動量
;
;
; 戻り値
;    0 = スワイプされていない
;    1 = タップがされた(画面に指をつけられた)
;
;    2 = 左から右にスワイプされた(画面から指が離された) (小さく指を払った)
;    3 = 左から右にスワイプされた(画面から指が離された)
;    4 = 左から右にスワイプされた(画面から指が離された)
;    5 = 左から右にスワイプされた(画面から指が離された)
;    6 = 左から右にスワイプされた(画面から指が離された)
;    7 = 左から右にスワイプされた(画面から指が離された)
;    8 = 左から右にスワイプされた(画面から指が離された)
;    9 = 左から右にスワイプされた(画面から指が離された)
;   10 = 左から右にスワイプされた(画面から指が離された)
;   11 = 左から右にスワイプされた(画面から指が離された) (大きく指を払った)
;
;   -2 = 右から左にスワイプされた(画面から指が離された) (小さく指を払った)
;   -3 = 右から左にスワイプされた(画面から指が離された)
;   -4 = 右から左にスワイプされた(画面から指が離された)
;   -5 = 右から左にスワイプされた(画面から指が離された)
;   -6 = 右から左にスワイプされた(画面から指が離された)
;   -7 = 右から左にスワイプされた(画面から指が離された)
;   -8 = 右から左にスワイプされた(画面から指が離された)
;   -9 = 右から左にスワイプされた(画面から指が離された)
;  -10 = 右から左にスワイプされた(画面から指が離された)
;  -11 = 右から左にスワイプされた(画面から指が離された) (大きく指を払った)
;
;=====================================================
; SAMPLE
;
;   stick key, 256
;	if smart_hswipe(key, 256, 0, 0, 319, 479, 400, 10, 319) = 2 : mes "HORIZON SWIPE OK"
;
;-----------------------------------------------------
#defcfunc smart_hswipe int act_num, int swipe_key, int swipe_button, int x1, int y1, int x2, int y2, int swipe_interval, int min_movement, int max_movement

	t_interval = swipe_interval
	if t_interval = 0 : t_interval = DEFAULT_SWIPE_INTERVAL
	p1 = swipe_button / 256 - 1

	if (swipe_key & KEY_MOUSE_LEFT) | (swipe_key & KEY_MOUSE_RIGHT) {
		if swipe_key ! swipe_button : return 0
		i      = cp(act_num, p1)
		hour   = gettime(4) * 1000 * 60 * 60
		minute = gettime(5) * 1000 * 60
		second = gettime(6) * 1000
		tv(act_num, p1, i) = hour + minute + second + gettime(7)
		moux(act_num, i)   = mousex
		mouy(act_num, i)   = mousey
		
		if i = 0 {
			cp(act_num, p1) = 1
			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0 : else : return 1
		}
		
		if i = 1 {
			re = 0
			if moux(act_num, 0) >= x1 {
				if moux(act_num, 0) <= x2 {
					if mouy(act_num, 0) >= y1 {
						if mouy(act_num, 0) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0

			re = 0
			if moux(act_num, 1) >= x1 {
				if moux(act_num, 1) <= x2 {
					if mouy(act_num, 1) >= y1 {
						if mouy(act_num, 1) <= y2 {
							re = 1
						}
					}
				}
			}
			if re = 0 : return 0
			
			if tv(act_num, p1, 0) > tv(act_num, p1, 1) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, 1)
			t = tv(act_num, p1, 1) - tv(act_num, p1, 0)
			if (t > t_interval) & (t_interval ! -1) : return 0 : else : return 1
		}
	}

	if swipe_key = 0 {
		i  = cp(act_num, p1)
		if i = 1 {
			hour   = gettime(4) * 1000 * 60 * 60
			minute = gettime(5) * 1000 * 60
			second = gettime(6) * 1000
			tv(act_num, p1, i) = hour + minute + second + gettime(7)
			moux(act_num, i)   = mousex
			mouy(act_num, i)   = mousey
			if tv(act_num, p1, 0) > tv(act_num, p1, 1) : tv(act_num, p1, 0) = SARCH_TIME_MAX - tv(act_num, p1, 0) + tv(act_num, p1, 1)
			t = tv(act_num, p1, 1) - tv(act_num, p1, 0)

			if (t <= t_interval) | (t_interval = -1) {
				
				cp(act_num, p1) = 2
	
				re = 0
				if (moux(act_num, 0) >= x1) {
					if (moux(act_num, 0) <= x2) {
						if (mouy(act_num, 0) >= y1) {
							if (mouy(act_num, 0) <= y2) {
								re = 1
							}
						}
					}
				}
				if re = 0 : return 0
	
				re = 0
				if (moux(act_num, 1) >= x1) {
					if (moux(act_num, 1) <= x2) {
						if (mouy(act_num, 1) >= y1) {
							if (mouy(act_num, 1) <= y2) {
								re = 1
							}
						}
					}
				}
				if re = 0 : return 0; : else : return 2

				move_way    = 0
				move_moment = 0
				move_moment = moux(act_num, 0) - moux(act_num, 1)
				abs_moment  = abs(move_moment)

				dim x_point, POINT_SPLIT
				
				x_point(0)  = x1 + (abs(x1 - x2) / 10)
				repeat POINT_SPLIT
					x_point(cnt + 1) = x_point(cnt) + (abs(x1 - x2) / 10)
				loop

				re = 0
				if abs_moment >= min_movement {
					if abs_moment <= max_movement {
						re = 1
					}
				}
				if re = 0 : return 0
				
				if move_moment = 0 : return 0
				if move_moment < 0 : move_way = 1	;左から右
				if move_moment > 0 : move_way = 2	;右から左

				if abs_moment >= x1 {
					if abs_moment <= x_point(0) {
						if move_way = 1 : return 2	;左から右
						if move_way = 2 : return -2	;右から左
					}
				}
				if abs_moment > x_point(0) {
					if abs_moment <= x_point(1) {
						if move_way = 1 : return 3	;左から右
						if move_way = 2 : return -3	;右から左
					}
				}
				if abs_moment > x_point(1) {
					if abs_moment <= x_point(2) {
						if move_way = 1 : return 4	;左から右
						if move_way = 2 : return -4	;右から左
					}
				}
				if abs_moment > x_point(2) {
					if abs_moment <= x_point(3) {
						if move_way = 1 : return 5	;左から右
						if move_way = 2 : return -5	;右から左
					}
				}
				if abs_moment > x_point(3) {
					if abs_moment <= x_point(4) {
						if move_way = 1 : return 6	;左から右
						if move_way = 2 : return -6	;右から左
					}
				}
				if abs_moment > x_point(4) {
					if abs_moment <= x_point(5) {
						if move_way = 1 : return 7	;左から右
						if move_way = 2 : return -7	;右から左
					}
				}
				if abs_moment > x_point(5) {
					if abs_moment <= x_point(6) {
						if move_way = 1 : return 8	;左から右
						if move_way = 2 : return -8	;右から左
					}
				}
				if abs_moment > x_point(6) {
					if abs_moment <= x_point(7) {
						if move_way = 1 : return 9	;左から右
						if move_way = 2 : return -9	;右から左
					}
				}
				if abs_moment > x_point(7) {
					if abs_moment <= x_point(8) {
						if move_way = 1 : return 10	;左から右
						if move_way = 2 : return -10	;右から左
					}
				}
				if abs_moment > x_point(8) {
					if abs_moment <= x2 {
						if move_way = 1 : return 11	;上から下
						if move_way = 2 : return -11	;下から上
					}
				}

			}
		}
	}
	
	tv(act_num, p1, 0) = 0
	tv(act_num, p1, 1) = 0
	tv(act_num, p1, 2) = 0
	tv(act_num, p1, 3) = 0
	cp(act_num, p1)    = 0

	return 0


;-----------------------------------------------------
; smart_one
;
; タップされた(画面を押した)瞬間を一度だけ取得。(※離したときは含まれず)
; この関数の存在の意味＝smart_tap等でstick命令は必ず非トリガータイプキー指定に256か512を指定のため、一度だけのクリックを検出できないため。
;
;
; one_key         : stick命令から取得したキー情報が格納された変数。(stick命令は必ず非トリガータイプキー指定に256か512を指定すること！)
; one_button      : 一度だけ取得するマウスボタン(256 = 左, 512 = 右)
;
;
; 戻り値
;    0 = タップされていない(もしくは押し続けられている)
;    1 = タップ(画面を押した)がされた
;
;=====================================================
; SAMPLE
;
;*main
;
;   stick key, 256
;	if smart_one(key, 256) = 1 {
;		c++
;		mes "MOUSE RIGHT BUTTON ONLY ONE = " + c
;	}
;	wait 1
;	goto *main
;
;-----------------------------------------------------
#defcfunc smart_one int one_key, int one_button

	r = 0
	
	if one_key = 0 {
		one_click_left  = 0
		one_click_right = 0
		return 0
	}
	
	c = one_button \ 256
	
	if c > 0 {
		one_click_left  = 0
		one_click_right = 0
		return 0
	}

	if one_key & KEY_MOUSE_LEFT {
		if one_button & KEY_MOUSE_LEFT {
			r = (one_click_left = 0)
			one_click_left = 1
		}
	} else {
		if one_key & KEY_MOUSE_RIGHT {
			if one_button & KEY_MOUSE_RIGHT {
				r = (one_click_right = 0)
				one_click_right = 1
			}
		}
	}

	return r

#global
