
_main:

;Assignment1.c,8 :: 		void main() {
;Assignment1.c,10 :: 		TRISB=0x00;
	CLRF       TRISB+0
;Assignment1.c,11 :: 		TRISC= 0x00;
	CLRF       TRISC+0
;Assignment1.c,12 :: 		portc.f3=0xff;
	BSF        PORTC+0, 3
;Assignment1.c,13 :: 		cnt=0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;Assignment1.c,14 :: 		temp=0;
	CLRF       _temp+0
	CLRF       _temp+1
;Assignment1.c,15 :: 		valADC = 0;
	CLRF       _valADC+0
	CLRF       _valADC+1
;Assignment1.c,16 :: 		while(1)
L_main0:
;Assignment1.c,20 :: 		if(portd.f5==1)
	BTFSS      PORTD+0, 5
	GOTO       L_main2
;Assignment1.c,22 :: 		call(cnt);
	MOVF       _cnt+0, 0
	MOVWF      FARG_call_x+0
	MOVF       _cnt+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,23 :: 		if(portd.f2==1   )
	BTFSS      PORTD+0, 2
	GOTO       L_main3
;Assignment1.c,25 :: 		if(portd.f2==1 )
	BTFSS      PORTD+0, 2
	GOTO       L_main4
;Assignment1.c,27 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;Assignment1.c,28 :: 		call(cnt);
	MOVF       _cnt+0, 0
	MOVWF      FARG_call_x+0
	MOVF       _cnt+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,29 :: 		}
L_main4:
;Assignment1.c,30 :: 		}
L_main3:
;Assignment1.c,33 :: 		if(portd.f3==1  )
	BTFSS      PORTD+0, 3
	GOTO       L_main5
;Assignment1.c,36 :: 		if(portd.f3==1   )
	BTFSS      PORTD+0, 3
	GOTO       L_main6
;Assignment1.c,38 :: 		cnt--;
	MOVLW      1
	SUBWF      _cnt+0, 1
	BTFSS      STATUS+0, 0
	DECF       _cnt+1, 1
;Assignment1.c,39 :: 		call(cnt);
	MOVF       _cnt+0, 0
	MOVWF      FARG_call_x+0
	MOVF       _cnt+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,41 :: 		}
L_main6:
;Assignment1.c,42 :: 		}
L_main5:
;Assignment1.c,43 :: 		}
L_main2:
;Assignment1.c,45 :: 		if(portd.f5==0)
	BTFSC      PORTD+0, 5
	GOTO       L_main7
;Assignment1.c,46 :: 		{    call(temp);
	MOVF       _temp+0, 0
	MOVWF      FARG_call_x+0
	MOVF       _temp+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,47 :: 		if(portd.f2==1   )
	BTFSS      PORTD+0, 2
	GOTO       L_main8
;Assignment1.c,49 :: 		if(portd.f2==1 )
	BTFSS      PORTD+0, 2
	GOTO       L_main9
;Assignment1.c,51 :: 		temp++;
	INCF       _temp+0, 1
	BTFSC      STATUS+0, 2
	INCF       _temp+1, 1
;Assignment1.c,52 :: 		call(temp);
	MOVF       _temp+0, 0
	MOVWF      FARG_call_x+0
	MOVF       _temp+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,53 :: 		}
L_main9:
;Assignment1.c,54 :: 		}
L_main8:
;Assignment1.c,57 :: 		if(portd.f3==1  )
	BTFSS      PORTD+0, 3
	GOTO       L_main10
;Assignment1.c,60 :: 		if(portd.f3==1  )
	BTFSS      PORTD+0, 3
	GOTO       L_main11
;Assignment1.c,62 :: 		temp--;
	MOVLW      1
	SUBWF      _temp+0, 1
	BTFSS      STATUS+0, 0
	DECF       _temp+1, 1
;Assignment1.c,63 :: 		call(temp);
	MOVF       _temp+0, 0
	MOVWF      FARG_call_x+0
	MOVF       _temp+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,64 :: 		}
L_main11:
;Assignment1.c,65 :: 		}
L_main10:
;Assignment1.c,67 :: 		}
L_main7:
;Assignment1.c,69 :: 		if(cnt>0  && cnt == temp )
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cnt+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVF       _cnt+0, 0
	SUBLW      0
L__main33:
	BTFSC      STATUS+0, 0
	GOTO       L_main14
	MOVF       _cnt+1, 0
	XORWF      _temp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVF       _temp+0, 0
	XORWF      _cnt+0, 0
L__main34:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
L__main31:
;Assignment1.c,70 :: 		ledBlinking(cnt);
	MOVF       _cnt+0, 0
	MOVWF      FARG_ledBlinking_x+0
	MOVF       _cnt+1, 0
	MOVWF      FARG_ledBlinking_x+1
	CALL       _ledBlinking+0
L_main14:
;Assignment1.c,71 :: 		}
	GOTO       L_main0
;Assignment1.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_call:

;Assignment1.c,76 :: 		void call(int x)
;Assignment1.c,79 :: 		int  leftDigit= x/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_call_x+0, 0
	MOVWF      R0+0
	MOVF       FARG_call_x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      call_leftDigit_L0+0
	MOVF       R0+1, 0
	MOVWF      call_leftDigit_L0+1
;Assignment1.c,80 :: 		int rigthDigit=x%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_call_x+0, 0
	MOVWF      R0+0
	MOVF       FARG_call_x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      call_rigthDigit_L0+0
	MOVF       R0+1, 0
	MOVWF      call_rigthDigit_L0+1
;Assignment1.c,81 :: 		int i=0;
	CLRF       call_i_L0+0
	CLRF       call_i_L0+1
;Assignment1.c,82 :: 		for( i=0;i<=8;i++)
	CLRF       call_i_L0+0
	CLRF       call_i_L0+1
L_call15:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      call_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__call36
	MOVF       call_i_L0+0, 0
	SUBLW      8
L__call36:
	BTFSS      STATUS+0, 0
	GOTO       L_call16
;Assignment1.c,84 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;Assignment1.c,85 :: 		portb= array[leftDigit];
	MOVF       call_leftDigit_L0+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Assignment1.c,86 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_call18:
	DECFSZ     R13+0, 1
	GOTO       L_call18
	DECFSZ     R12+0, 1
	GOTO       L_call18
	NOP
;Assignment1.c,87 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;Assignment1.c,89 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;Assignment1.c,90 :: 		portb = array[rigthDigit];
	MOVF       call_rigthDigit_L0+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Assignment1.c,91 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_call19:
	DECFSZ     R13+0, 1
	GOTO       L_call19
	DECFSZ     R12+0, 1
	GOTO       L_call19
	NOP
;Assignment1.c,92 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;Assignment1.c,82 :: 		for( i=0;i<=8;i++)
	INCF       call_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       call_i_L0+1, 1
;Assignment1.c,93 :: 		}
	GOTO       L_call15
L_call16:
;Assignment1.c,95 :: 		}
L_end_call:
	RETURN
; end of _call

_ledBlinking:

;Assignment1.c,97 :: 		void ledBlinking(int x)
;Assignment1.c,100 :: 		while(1)
L_ledBlinking20:
;Assignment1.c,102 :: 		portc.f3=0x00;
	BCF        PORTC+0, 3
;Assignment1.c,103 :: 		call(x);
	MOVF       FARG_ledBlinking_x+0, 0
	MOVWF      FARG_call_x+0
	MOVF       FARG_ledBlinking_x+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,104 :: 		for(i=1;i<=100;i+=10)
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_ledBlinking22:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ledBlinking38
	MOVF       _i+0, 0
	SUBLW      100
L__ledBlinking38:
	BTFSS      STATUS+0, 0
	GOTO       L_ledBlinking23
;Assignment1.c,106 :: 		portc.f4=0xff;
	BSF        PORTC+0, 4
;Assignment1.c,107 :: 		call(x);
	MOVF       FARG_ledBlinking_x+0, 0
	MOVWF      FARG_call_x+0
	MOVF       FARG_ledBlinking_x+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,104 :: 		for(i=1;i<=100;i+=10)
	MOVLW      10
	ADDWF      _i+0, 1
	BTFSC      STATUS+0, 0
	INCF       _i+1, 1
;Assignment1.c,108 :: 		}
	GOTO       L_ledBlinking22
L_ledBlinking23:
;Assignment1.c,110 :: 		portc.f4=0x00;
	BCF        PORTC+0, 4
;Assignment1.c,112 :: 		call(x);
	MOVF       FARG_ledBlinking_x+0, 0
	MOVWF      FARG_call_x+0
	MOVF       FARG_ledBlinking_x+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,113 :: 		for(i=1;i<=100;i+=10)
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_ledBlinking25:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ledBlinking39
	MOVF       _i+0, 0
	SUBLW      100
L__ledBlinking39:
	BTFSS      STATUS+0, 0
	GOTO       L_ledBlinking26
;Assignment1.c,115 :: 		portc.f5=0xff;
	BSF        PORTC+0, 5
;Assignment1.c,117 :: 		call(x);
	MOVF       FARG_ledBlinking_x+0, 0
	MOVWF      FARG_call_x+0
	MOVF       FARG_ledBlinking_x+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,113 :: 		for(i=1;i<=100;i+=10)
	MOVLW      10
	ADDWF      _i+0, 1
	BTFSC      STATUS+0, 0
	INCF       _i+1, 1
;Assignment1.c,118 :: 		}
	GOTO       L_ledBlinking25
L_ledBlinking26:
;Assignment1.c,120 :: 		portc.f5=0x00;
	BCF        PORTC+0, 5
;Assignment1.c,121 :: 		call(x);
	MOVF       FARG_ledBlinking_x+0, 0
	MOVWF      FARG_call_x+0
	MOVF       FARG_ledBlinking_x+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,123 :: 		for( i=1;i<=100;i+=10)
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_ledBlinking28:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ledBlinking40
	MOVF       _i+0, 0
	SUBLW      100
L__ledBlinking40:
	BTFSS      STATUS+0, 0
	GOTO       L_ledBlinking29
;Assignment1.c,125 :: 		portc.f3=0xff;
	BSF        PORTC+0, 3
;Assignment1.c,127 :: 		call(x);
	MOVF       FARG_ledBlinking_x+0, 0
	MOVWF      FARG_call_x+0
	MOVF       FARG_ledBlinking_x+1, 0
	MOVWF      FARG_call_x+1
	CALL       _call+0
;Assignment1.c,123 :: 		for( i=1;i<=100;i+=10)
	MOVLW      10
	ADDWF      _i+0, 1
	BTFSC      STATUS+0, 0
	INCF       _i+1, 1
;Assignment1.c,128 :: 		}
	GOTO       L_ledBlinking28
L_ledBlinking29:
;Assignment1.c,130 :: 		}
	GOTO       L_ledBlinking20
;Assignment1.c,131 :: 		}
L_end_ledBlinking:
	RETURN
; end of _ledBlinking
