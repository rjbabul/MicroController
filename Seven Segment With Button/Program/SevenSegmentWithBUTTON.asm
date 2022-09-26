
_main:

;SevenSegmentWithBUTTON.c,4 :: 		void main() {
;SevenSegmentWithBUTTON.c,5 :: 		TRISB =0x00;
	CLRF       TRISB+0
;SevenSegmentWithBUTTON.c,6 :: 		portb = 0xff;
	MOVLW      255
	MOVWF      PORTB+0
;SevenSegmentWithBUTTON.c,7 :: 		TRISD = 0xff;
	MOVLW      255
	MOVWF      TRISD+0
;SevenSegmentWithBUTTON.c,8 :: 		while(1){
L_main0:
;SevenSegmentWithBUTTON.c,9 :: 		portb = array[cnt];
	MOVF       _cnt+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;SevenSegmentWithBUTTON.c,10 :: 		if(portd.f5==1)
	BTFSS      PORTD+0, 5
	GOTO       L_main2
;SevenSegmentWithBUTTON.c,12 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;SevenSegmentWithBUTTON.c,13 :: 		if(cnt<9) cnt++;
	MOVLW      128
	XORWF      _cnt+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      9
	SUBWF      _cnt+0, 0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
	GOTO       L_main5
L_main4:
;SevenSegmentWithBUTTON.c,14 :: 		else cnt=0;
	CLRF       _cnt+0
	CLRF       _cnt+1
L_main5:
;SevenSegmentWithBUTTON.c,15 :: 		}
L_main2:
;SevenSegmentWithBUTTON.c,16 :: 		if(portd.f6==1)
	BTFSS      PORTD+0, 6
	GOTO       L_main6
;SevenSegmentWithBUTTON.c,18 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;SevenSegmentWithBUTTON.c,19 :: 		if(cnt>0) cnt--;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cnt+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       _cnt+0, 0
	SUBLW      0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
	MOVLW      1
	SUBWF      _cnt+0, 1
	BTFSS      STATUS+0, 0
	DECF       _cnt+1, 1
	GOTO       L_main9
L_main8:
;SevenSegmentWithBUTTON.c,20 :: 		else cnt =9;
	MOVLW      9
	MOVWF      _cnt+0
	MOVLW      0
	MOVWF      _cnt+1
L_main9:
;SevenSegmentWithBUTTON.c,21 :: 		}
L_main6:
;SevenSegmentWithBUTTON.c,23 :: 		}
	GOTO       L_main0
;SevenSegmentWithBUTTON.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
