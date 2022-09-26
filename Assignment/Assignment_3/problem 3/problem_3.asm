
_StartSignal:

;problem_3.c,17 :: 		void StartSignal()
;problem_3.c,19 :: 		TRISD.F0 = 0;
	BCF        TRISD+0, 0
;problem_3.c,20 :: 		PORTD.F0 = 0;
	BCF        PORTD+0, 0
;problem_3.c,21 :: 		delay_ms(18);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      191
	MOVWF      R13+0
L_StartSignal0:
	DECFSZ     R13+0, 1
	GOTO       L_StartSignal0
	DECFSZ     R12+0, 1
	GOTO       L_StartSignal0
	NOP
	NOP
;problem_3.c,22 :: 		PORTD.F0 = 1;
	BSF        PORTD+0, 0
;problem_3.c,23 :: 		delay_us(30);
	MOVLW      19
	MOVWF      R13+0
L_StartSignal1:
	DECFSZ     R13+0, 1
	GOTO       L_StartSignal1
	NOP
	NOP
;problem_3.c,24 :: 		TRISD.F0 = 1;
	BSF        TRISD+0, 0
;problem_3.c,25 :: 		}
L_end_StartSignal:
	RETURN
; end of _StartSignal

_CheckResponse:

;problem_3.c,27 :: 		void CheckResponse()
;problem_3.c,29 :: 		Check = 0;
	CLRF       _Check+0
;problem_3.c,30 :: 		delay_us(40);
	MOVLW      26
	MOVWF      R13+0
L_CheckResponse2:
	DECFSZ     R13+0, 1
	GOTO       L_CheckResponse2
	NOP
;problem_3.c,31 :: 		if (PORTD.F0 == 0)
	BTFSC      PORTD+0, 0
	GOTO       L_CheckResponse3
;problem_3.c,33 :: 		delay_us(80);
	MOVLW      53
	MOVWF      R13+0
L_CheckResponse4:
	DECFSZ     R13+0, 1
	GOTO       L_CheckResponse4
;problem_3.c,34 :: 		if (PORTD.F0 == 1) Check = 1;
	BTFSS      PORTD+0, 0
	GOTO       L_CheckResponse5
	MOVLW      1
	MOVWF      _Check+0
L_CheckResponse5:
;problem_3.c,35 :: 		delay_us(40);
	MOVLW      26
	MOVWF      R13+0
L_CheckResponse6:
	DECFSZ     R13+0, 1
	GOTO       L_CheckResponse6
	NOP
;problem_3.c,36 :: 		}
L_CheckResponse3:
;problem_3.c,37 :: 		}
L_end_CheckResponse:
	RETURN
; end of _CheckResponse

_ReadData:

;problem_3.c,39 :: 		char ReadData()
;problem_3.c,42 :: 		for(j = 0; j < 8; j++)
	CLRF       R3+0
L_ReadData7:
	MOVLW      8
	SUBWF      R3+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ReadData8
;problem_3.c,44 :: 		while(!PORTD.F0);
L_ReadData10:
	BTFSC      PORTD+0, 0
	GOTO       L_ReadData11
	GOTO       L_ReadData10
L_ReadData11:
;problem_3.c,45 :: 		delay_us(30);
	MOVLW      19
	MOVWF      R13+0
L_ReadData12:
	DECFSZ     R13+0, 1
	GOTO       L_ReadData12
	NOP
	NOP
;problem_3.c,46 :: 		if(PORTD.F0 == 0)
	BTFSC      PORTD+0, 0
	GOTO       L_ReadData13
;problem_3.c,47 :: 		i&= ~(1<<(7 - j));
	MOVF       R3+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__ReadData29:
	BTFSC      STATUS+0, 2
	GOTO       L__ReadData30
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__ReadData29
L__ReadData30:
	COMF       R0+0, 1
	MOVF       R0+0, 0
	ANDWF      R2+0, 1
	GOTO       L_ReadData14
L_ReadData13:
;problem_3.c,50 :: 		i|= (1 << (7 - j));
	MOVF       R3+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__ReadData31:
	BTFSC      STATUS+0, 2
	GOTO       L__ReadData32
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__ReadData31
L__ReadData32:
	MOVF       R0+0, 0
	IORWF      R2+0, 1
;problem_3.c,52 :: 		while(PORTD.F0);
L_ReadData15:
	BTFSS      PORTD+0, 0
	GOTO       L_ReadData16
	GOTO       L_ReadData15
L_ReadData16:
;problem_3.c,53 :: 		}
L_ReadData14:
;problem_3.c,42 :: 		for(j = 0; j < 8; j++)
	INCF       R3+0, 1
;problem_3.c,54 :: 		}
	GOTO       L_ReadData7
L_ReadData8:
;problem_3.c,55 :: 		return i;
	MOVF       R2+0, 0
	MOVWF      R0+0
;problem_3.c,56 :: 		}
L_end_ReadData:
	RETURN
; end of _ReadData

_main:

;problem_3.c,61 :: 		void main()
;problem_3.c,63 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;problem_3.c,64 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;problem_3.c,65 :: 		trisd.f6 = 0x00;
	BCF        TRISD+0, 6
;problem_3.c,67 :: 		trisd.f7 = 0xff;
	BSF        TRISD+0, 7
;problem_3.c,68 :: 		portd  = 0;
	CLRF       PORTD+0
;problem_3.c,70 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;problem_3.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;problem_3.c,72 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;problem_3.c,75 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;problem_3.c,76 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;problem_3.c,77 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;problem_3.c,78 :: 		while(1)
L_main17:
;problem_3.c,81 :: 		StartSignal();
	CALL       _StartSignal+0
;problem_3.c,82 :: 		CheckResponse();
	CALL       _CheckResponse+0
;problem_3.c,83 :: 		if(Check == 1)
	MOVF       _Check+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;problem_3.c,85 :: 		RH_byte1 = ReadData();
	CALL       _ReadData+0
	MOVF       R0+0, 0
	MOVWF      _RH_byte1+0
;problem_3.c,86 :: 		RH_byte2 = ReadData();
	CALL       _ReadData+0
	MOVF       R0+0, 0
	MOVWF      _RH_byte2+0
;problem_3.c,87 :: 		T_byte1 = ReadData();
	CALL       _ReadData+0
	MOVF       R0+0, 0
	MOVWF      _T_byte1+0
;problem_3.c,88 :: 		T_byte2 = ReadData();
	CALL       _ReadData+0
	MOVF       R0+0, 0
	MOVWF      _T_byte2+0
;problem_3.c,89 :: 		Sum = ReadData();
	CALL       _ReadData+0
	MOVF       R0+0, 0
	MOVWF      _Sum+0
	CLRF       _Sum+1
;problem_3.c,90 :: 		if(Sum == ((RH_byte1+RH_byte2+T_byte1+T_byte2) & 0XFF))
	MOVF       _RH_byte2+0, 0
	ADDWF      _RH_byte1+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       _T_byte1+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       _T_byte2+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      255
	ANDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	MOVLW      0
	ANDWF      R2+1, 1
	MOVF       _Sum+1, 0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVF       R2+0, 0
	XORWF      _Sum+0, 0
L__main34:
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;problem_3.c,92 :: 		Temp = T_byte1;
	MOVF       _T_byte1+0, 0
	MOVWF      _Temp+0
	CLRF       _Temp+1
;problem_3.c,93 :: 		RH = RH_byte1;
	MOVF       _RH_byte1+0, 0
	MOVWF      _RH+0
	CLRF       _RH+1
;problem_3.c,94 :: 		Lcd_Out(1, 2, "Temp: C");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_problem_3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem_3.c,95 :: 		Lcd_Out(2, 2, "Humidity: %");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_problem_3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem_3.c,96 :: 		LCD_Chr(1, 12, 48 + ((Temp / 10) % 10));
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _Temp+0, 0
	MOVWF      R0+0
	MOVF       _Temp+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;problem_3.c,97 :: 		LCD_Chr(1, 13, 48 + (Temp % 10));
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _Temp+0, 0
	MOVWF      R0+0
	MOVF       _Temp+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;problem_3.c,98 :: 		LCD_Chr(2, 12, 48 + ((RH / 10) % 10));
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _RH+0, 0
	MOVWF      R0+0
	MOVF       _RH+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;problem_3.c,99 :: 		LCD_Chr(2, 13, 48 + (RH % 10));
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _RH+0, 0
	MOVWF      R0+0
	MOVF       _RH+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;problem_3.c,100 :: 		}
	GOTO       L_main21
L_main20:
;problem_3.c,103 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;problem_3.c,104 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;problem_3.c,105 :: 		Lcd_Out(1, 1, "Check sum error");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_problem_3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem_3.c,106 :: 		}
L_main21:
;problem_3.c,107 :: 		}
	GOTO       L_main22
L_main19:
;problem_3.c,110 :: 		Lcd_Out(1, 3, "No response");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_problem_3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem_3.c,111 :: 		Lcd_Out(2, 1, "from the sensor");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_problem_3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem_3.c,112 :: 		}
L_main22:
;problem_3.c,115 :: 		if( portd.f7 >= 1 ) {
	CLRF       R1+0
	BTFSC      PORTD+0, 7
	INCF       R1+0, 1
	MOVLW      1
	SUBWF      R1+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main23
;problem_3.c,116 :: 		portd.f6 = 1;
	BSF        PORTD+0, 6
;problem_3.c,118 :: 		}
	GOTO       L_main24
L_main23:
;problem_3.c,120 :: 		portd.f6 = 0;
	BCF        PORTD+0, 6
;problem_3.c,122 :: 		}
L_main24:
;problem_3.c,124 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
;problem_3.c,125 :: 		}
	GOTO       L_main17
;problem_3.c,126 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
