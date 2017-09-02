;-----------------------------------------------------
;
; HSP3�p�X�}�[�g�t�H�����W���[���umod_smart.as�v
;
; Ver 2.2
;
; By. ���܂���˂�
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
; ���W���[���̏�������
;-----------------------------------------------------
#deffunc smart_init

	;smart_one�p
	one_click_left  = 0
	one_click_right = 0

	;(����)
	;smrat_tap(�^�b�v)
	;smart_touch(�^�b�`)
	;smart_dtap(�_�u���^�b�v)
	;smart_drag(�h���b�O)
	;smart_vswipe,smart_hswipe((�X���C�v)�p
	dim tv,    1, 2, 4
	dim cp,    1, 4
	dim moux,  1, 4
	dim mouy,  1, 4
	dim add_m, 1
/*
	;�^�b�`(������)�p
	dim tv, 2, 4
	dim cp, 4
	dim moux, 4
	dim mouy, 4
	
	;�h���b�O�p
	dim tv, 2, 3
	dim cp, 3
	dim moux, 3
	dim mouy, 3

	;�_�u���^�b�v�p
	dim tv, 2, 4
	dim cp, 4
	dim moux, 4
	dim mouy, 4
	
	;�c�X���C�v�p
	dim tv, 2, 3
	dim cp, 3
	dim moux, 3
	dim mouy, 3

	;���X���C�v�p
	dim tv, 2, 3
	dim cp, 3
	dim moux, 3
	dim mouy, 3
*/
	
	

	return


;-----------------------------------------------------
; smart_mousearea
;
; �w��̗̈���Ƀ}�E�X�J�[�\�������邩�擾
;
; x1 : ����X���W
; y1 : ����Y���W
; x2 : �E��X���W
; y2 : �E��Y���W
;
; �߂�l(0 = �w��̗̈���Ƀ}�E�X�J�[�\�����Ȃ�)
;       (1 = �w��̗̈���Ƀ}�E�X�J�[�\��������)
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
; �^�b�v���̑�����擾���邽�߂̃A�N�V������ǉ����܂��B
;
;
; add_mode           : �ǉ�����A�N�V�������[�h(���Ⴆ�΁A0=�^�b�v, 1=�^�b�`, 2=�h���b�O, 3=�_�u���^�b�v, 4=�c�X���C�v, 5=���X���C�v�@�Ȃ�)
;                      (��smart_get�֐��Ŏw�肵���A�N�V�����ԍ����ǂ̑���̂��̂��𒲂ׂ�̂ɗ��p���Ă�������)
;                      (���A�N�V�������[�h�͏ȗ��\�ł�)
;
; ���ߏI����A�V�X�e���ϐ�(stat)�ɃA�N�V�����ԍ�������܂��B
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
; �w��̃A�N�V�����ԍ�����A�N�V�������[�h���擾���܂��B
;
;
; act_num           : �A�N�V�������[�h���擾�������A�N�V�����ԍ�
;
;
; �߂�l
;   0 �` = �A�N�V�������[�h
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
; �^�b�v���擾
;
;
; act_num           : �A�N�V�������擾����A�N�V�����ԍ�
; tap_key           : stick���߂���擾�����L�[��񂪊i�[���ꂽ�ϐ��B(stick���߂͕K����g���K�[�^�C�v�L�[�w���256��512���w�肷�邱�ƁI)
; tap_button        : �^�b�v���擾����}�E�X�{�^��(256 = ��, 512 = �E)
; x1, y1, x2, y2    : �^�b�v��F�������ʍ��W
; tap_interval      : �w��̎��Ԃ̊Ԃɉ�ʂ��w�ŉ����ė����܂ł��^�b�v�ƔF������(�P�ʁF�~���b)�B�ȗ����́A400�~���b�Ƃ���B
;
;
; �߂�l
;   0 = �^�b�v����Ă��Ȃ�
;   1 = �^�b�v����n�߂�(��ʂɎw������ꂽ)
;   2 = �^�b�v���I�����(��ʂ���w�𗣂��ꂽ)
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
; �^�b�`(������)���擾  (���^�b�`���F�����ꂽ��A���̂܂܎w��������Ă��Ă��^�b�`�ƔF������܂���B)
;
;
; act_num           : �A�N�V�������擾����A�N�V�����ԍ�
; touch_key         : stick���߂���擾�����L�[��񂪊i�[���ꂽ�ϐ��B(stick���߂͕K����g���K�[�^�C�v�L�[�w���256��512���w�肷�邱�ƁI)
; touch_button      : �^�b�`���擾����}�E�X�{�^��(256 = ��, 512 = �E)
; x1, y1, x2, y2    : �^�b�`��F�������ʍ��W
; touch_interval    : �^�b�`�ƔF������܂ł̎���(�P�ʁF�~���b)�B�ȗ����́A1000�~���b�Ƃ���B
;
;
; �߂�l
;   0 = �^�b�`(������)����Ă��Ȃ�
;   1 = �^�b�`(������)���ꂽ(��ʂɎw����������ꂽ)
;   2 = �^�b�`(������)���I�����(��ʂ���w�𗣂��ꂽ)
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
; �h���b�O���擾
;
;
; act_num           : �A�N�V�������擾����A�N�V�����ԍ�
; drag_key          : stick���߂���擾�����L�[��񂪊i�[���ꂽ�ϐ��B(stick���߂͕K����g���K�[�^�C�v�L�[�w���256��512���w�肷�邱�ƁI)
; drag_button       : �h���b�O���擾����}�E�X�{�^��(256 = ��, 512 = �E)
; x1, y1, x2, y2    : �h���b�O��F�������ʍ��W�̈�
; drag_interval     : �h���b�O�ƔF������܂ł̎���(�P�ʁF�~���b)�B�ȗ����́A1000�~���b�Ƃ���B
;
;
; �߂�l
;   0 = �h���b�O����Ă��Ȃ�
;   1 = �h���b�O����Ă���(��ʂɎw����������ꂽ)
;   2 = �h���b�O���I�����ꂽ(��ʂ���w�𗣂��ꂽ)
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
; �_�u���^�b�v���擾
;
;
; act_num             : �A�N�V�������擾����A�N�V�����ԍ�
; double_tap_key      : stick���߂���擾�����L�[��񂪊i�[���ꂽ�ϐ��B(stick���߂͕K����g���K�[�^�C�v�L�[�w���256��512���w�肷�邱�ƁI)
; double_dtap_button  : �_�u���^�b�v���擾����}�E�X�{�^��(256 = ��, 512 = �E)
; x1, y1, x2, y2      : �_�u���^�b�v��F�������ʍ��W
; double_tap_interval : �w��̎��Ԃ̊Ԃɉ�ʂ��w�ŉ����ė����ĉ����܂ł��_�u���^�b�v�ƔF������(�P�ʁF�~���b)�B�ȗ����́A700�~���b�Ƃ���B
;
;
; �߂�l
;   0 = �_�u���^�b�v����Ă��Ȃ�
;   1 = �P��ڂ̃^�b�v�����ꂽ(��ʂɎw������ꂽ)
;   2 = �P��ڂ̃^�b�v���I�����(��ʂ���w�𗣂��ꂽ)
;   3 = �Q��ڂ̃^�b�v(�_�u���^�b�v)�����ꂽ(��ʂɎw������ꂽ)
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
; �c�X���C�v���擾
;
;
; act_num           : �A�N�V�������擾����A�N�V�����ԍ�
; swipe_key         : stick���߂���擾�����L�[��񂪊i�[���ꂽ�ϐ��B(stick���߂͕K����g���K�[�^�C�v�L�[�w���256��512���w�肷�邱�ƁI)
; swipe_button      : �c�X���C�v���擾����}�E�X�{�^��(256 = ��, 512 = �E)
; x1, y1, x2, y2    : �c�X���C�v��F�������ʍ��W
; swipe_interval    : �w��̎��Ԃ̊Ԃɉ�ʂ��w�ŉ����ė����܂ł��c�X���C�v�ƔF������(�P�ʁF�~���b)�B�ȗ����́A600�~���b�Ƃ���B
; min_movement      : �c�X���C�v�ƔF������c�̍ŏ��ړ���
; max_movement      : �c�X���C�v�ƔF������c�̍ő�ړ���
;
;
; �߂�l
;    0 = �X���C�v����Ă��Ȃ�
;    1 = �^�b�v�����ꂽ(��ʂɎw������ꂽ)
;
;    2 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
;    3 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    4 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    5 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    6 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    7 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    8 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    9 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   10 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   11 = �ォ�牺�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)
;
;   -2 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
;   -3 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -4 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -5 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -6 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -7 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -8 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -9 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;  -10 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;  -11 = �������ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)
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
				if move_moment < 0 : move_way = 1	;�ォ�牺
				if move_moment > 0 : move_way = 2	;�������

				if abs_moment >= y1 {
					if abs_moment <= y_point(0) {
						if move_way = 1 : return 2	;�ォ�牺
						if move_way = 2 : return -2	;�������
					}
				}
				if abs_moment > y_point(0) {
					if abs_moment <= y_point(1) {
						if move_way = 1 : return 3	;�ォ�牺
						if move_way = 2 : return -3	;�������
					}
				}
				if abs_moment > y_point(1) {
					if abs_moment <= y_point(2) {
						if move_way = 1 : return 4	;�ォ�牺
						if move_way = 2 : return -4	;�������
					}
				}
				if abs_moment > y_point(2) {
					if abs_moment <= y_point(3) {
						if move_way = 1 : return 5	;�ォ�牺
						if move_way = 2 : return -5	;�������
					}
				}
				if abs_moment > y_point(3) {
					if abs_moment <= y_point(4) {
						if move_way = 1 : return 6	;�ォ�牺
						if move_way = 2 : return -6	;�������
					}
				}
				if abs_moment > y_point(4) {
					if abs_moment <= y_point(5) {
						if move_way = 1 : return 7	;�ォ�牺
						if move_way = 2 : return -7	;�������
					}
				}
				if abs_moment > y_point(5) {
					if abs_moment <= y_point(6) {
						if move_way = 1 : return 8	;�ォ�牺
						if move_way = 2 : return -8	;�������
					}
				}
				if abs_moment > y_point(6) {
					if abs_moment <= y_point(7) {
						if move_way = 1 : return 9	;�ォ�牺
						if move_way = 2 : return -9	;�������
					}
				}
				if abs_moment > y_point(7) {
					if abs_moment <= y_point(8) {
						if move_way = 1 : return 10		;�ォ�牺
						if move_way = 2 : return -10	;�������
					}
				}
				if abs_moment > y_point(8) {
					if abs_moment <= y2 {
						if move_way = 1 : return 11		;�ォ�牺
						if move_way = 2 : return -11	;�������
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
; ���X���C�v���擾
;
;
; act_num           : �A�N�V�������擾����A�N�V�����ԍ�
; swipe_key         : stick���߂���擾�����L�[��񂪊i�[���ꂽ�ϐ��B(stick���߂͕K����g���K�[�^�C�v�L�[�w���256��512���w�肷�邱�ƁI)
; swipe_button      : ���X���C�v���擾����}�E�X�{�^��(256 = ��, 512 = �E)
; x1, y1, x2, y2    : ���X���C�v��F�������ʍ��W
; swipe_interval    : �w��̎��Ԃ̊Ԃɉ�ʂ��w�ŉ����ė����܂ł����X���C�v�ƔF������(�P�ʁF�~���b)�B�ȗ����́A600�~���b�Ƃ���B
; min_movement      : ���X���C�v�ƔF������ŏ��ړ���
; max_movement      : ���X���C�v�ƔF������ő�ړ���
;
;
; �߂�l
;    0 = �X���C�v����Ă��Ȃ�
;    1 = �^�b�v�����ꂽ(��ʂɎw������ꂽ)
;
;    2 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
;    3 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    4 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    5 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    6 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    7 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    8 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;    9 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   10 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   11 = ������E�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)
;
;   -2 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�������w�𕥂���)
;   -3 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -4 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -5 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -6 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -7 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -8 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;   -9 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;  -10 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ)
;  -11 = �E���獶�ɃX���C�v���ꂽ(��ʂ���w�������ꂽ) (�傫���w�𕥂���)
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
				if move_moment < 0 : move_way = 1	;������E
				if move_moment > 0 : move_way = 2	;�E���獶

				if abs_moment >= x1 {
					if abs_moment <= x_point(0) {
						if move_way = 1 : return 2	;������E
						if move_way = 2 : return -2	;�E���獶
					}
				}
				if abs_moment > x_point(0) {
					if abs_moment <= x_point(1) {
						if move_way = 1 : return 3	;������E
						if move_way = 2 : return -3	;�E���獶
					}
				}
				if abs_moment > x_point(1) {
					if abs_moment <= x_point(2) {
						if move_way = 1 : return 4	;������E
						if move_way = 2 : return -4	;�E���獶
					}
				}
				if abs_moment > x_point(2) {
					if abs_moment <= x_point(3) {
						if move_way = 1 : return 5	;������E
						if move_way = 2 : return -5	;�E���獶
					}
				}
				if abs_moment > x_point(3) {
					if abs_moment <= x_point(4) {
						if move_way = 1 : return 6	;������E
						if move_way = 2 : return -6	;�E���獶
					}
				}
				if abs_moment > x_point(4) {
					if abs_moment <= x_point(5) {
						if move_way = 1 : return 7	;������E
						if move_way = 2 : return -7	;�E���獶
					}
				}
				if abs_moment > x_point(5) {
					if abs_moment <= x_point(6) {
						if move_way = 1 : return 8	;������E
						if move_way = 2 : return -8	;�E���獶
					}
				}
				if abs_moment > x_point(6) {
					if abs_moment <= x_point(7) {
						if move_way = 1 : return 9	;������E
						if move_way = 2 : return -9	;�E���獶
					}
				}
				if abs_moment > x_point(7) {
					if abs_moment <= x_point(8) {
						if move_way = 1 : return 10	;������E
						if move_way = 2 : return -10	;�E���獶
					}
				}
				if abs_moment > x_point(8) {
					if abs_moment <= x2 {
						if move_way = 1 : return 11	;�ォ�牺
						if move_way = 2 : return -11	;�������
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
; �^�b�v���ꂽ(��ʂ�������)�u�Ԃ���x�����擾�B(���������Ƃ��͊܂܂ꂸ)
; ���̊֐��̑��݂̈Ӗ���smart_tap����stick���߂͕K����g���K�[�^�C�v�L�[�w���256��512���w��̂��߁A��x�����̃N���b�N�����o�ł��Ȃ����߁B
;
;
; one_key         : stick���߂���擾�����L�[��񂪊i�[���ꂽ�ϐ��B(stick���߂͕K����g���K�[�^�C�v�L�[�w���256��512���w�肷�邱�ƁI)
; one_button      : ��x�����擾����}�E�X�{�^��(256 = ��, 512 = �E)
;
;
; �߂�l
;    0 = �^�b�v����Ă��Ȃ�(�������͉����������Ă���)
;    1 = �^�b�v(��ʂ�������)�����ꂽ
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
