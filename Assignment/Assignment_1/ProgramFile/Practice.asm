
_main:

;Practice.c,1 :: 		void main() {
;Practice.c,2 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Practice.c,3 :: 		TRISD =0x00;
	CLRF       TRISD+0
;Practice.c,4 :: 		portd.f3=0x00;
	BCF        PORTD+0, 3
;Practice.c,5 :: 		portb = 0x00;
	CLRF       PORTB+0
;Practice.c,6 :: 		while(1)
L_main0:
;Practice.c,8 :: 		if(portd.f3 ==1)
	BTFSS      PORTD+0, 3
	GOTO       L_main2
;Practice.c,10 :: 		portb.f0 = 0xff;
	BSF        PORTB+0, 0
;Practice.c,11 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;Practice.c,13 :: 		portb.f0 = 0x00;
	BCF        PORTB+0, 0
;Practice.c,14 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
;Practice.c,16 :: 		portb.f1 = 0xff;
	BSF        PORTB+0, 1
;Practice.c,17 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;Practice.c,19 :: 		portb.f1 = 0x00;
	BCF        PORTB+0, 1
;Practice.c,20 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
;Practice.c,22 :: 		portb.f2 = 0xff;
	BSF        PORTB+0, 2
;Practice.c,23 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
;Practice.c,24 :: 		portb.f2 = 0x00;
	BCF        PORTB+0, 2
;Practice.c,25 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
;Practice.c,28 :: 		}
L_main2:
;Practice.c,30 :: 		}
	GOTO       L_main0
;Practice.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
