
_main:

;RotateBitPIC16FF87.c,4 :: 		int main(){
;RotateBitPIC16FF87.c,5 :: 		TRISD = 0x00; //Declarate Output PORTD
	CLRF       TRISD+0
;RotateBitPIC16FF87.c,6 :: 		TRISA0_bit = 0X01; //Declarate bit 0 from PORTA
	BSF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;RotateBitPIC16FF87.c,7 :: 		PORTD = 0x01; // Set PORTD whit 0x01 value
	MOVLW      1
	MOVWF      PORTD+0
;RotateBitPIC16FF87.c,8 :: 		ANSEL = 0x00; //Analog Select Register for digital input
	CLRF       ANSEL+0
;RotateBitPIC16FF87.c,11 :: 		while(1){
L_main0:
;RotateBitPIC16FF87.c,17 :: 		if(RA0_bit == 0){
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main2
;RotateBitPIC16FF87.c,20 :: 		for(i = 0; i < 8; i++){
	CLRF       _i+0
L_main3:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;RotateBitPIC16FF87.c,21 :: 		if(RA0_bit == 0){
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main6
;RotateBitPIC16FF87.c,22 :: 		temp = (PORTD & 0x01) << 7; // Extraer RD0
	MOVLW      1
	ANDWF      PORTD+0, 0
	MOVWF      R1+0
	MOVLW      7
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      R2+0
	MOVF       R0+0, 0
L__main24:
	BTFSC      STATUS+0, 2
	GOTO       L__main25
	RLF        R2+0, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__main24
L__main25:
	MOVF       R2+0, 0
	MOVWF      _temp+0
;RotateBitPIC16FF87.c,23 :: 		PORTD = (PORTD >> 1) | temp; // Desplazar a la derecha e insertar el bit RD0 en RD7
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R2+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTD+0
;RotateBitPIC16FF87.c,24 :: 		Delay_ms(90); // Retardo de 300 ms para observar la rotación}else{
	MOVLW      234
	MOVWF      R12+0
	MOVLW      195
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
;RotateBitPIC16FF87.c,25 :: 		}else{
	GOTO       L_main8
L_main6:
;RotateBitPIC16FF87.c,26 :: 		PORTD = 0xFF;
	MOVLW      255
	MOVWF      PORTD+0
;RotateBitPIC16FF87.c,27 :: 		Delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
;RotateBitPIC16FF87.c,28 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;RotateBitPIC16FF87.c,29 :: 		Delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
;RotateBitPIC16FF87.c,30 :: 		}
L_main8:
;RotateBitPIC16FF87.c,20 :: 		for(i = 0; i < 8; i++){
	INCF       _i+0, 1
;RotateBitPIC16FF87.c,31 :: 		}
	GOTO       L_main3
L_main4:
;RotateBitPIC16FF87.c,32 :: 		for( i = 0; i < 8; i++){
	CLRF       _i+0
L_main11:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;RotateBitPIC16FF87.c,33 :: 		if(RA0_bit == 0){
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main14
;RotateBitPIC16FF87.c,34 :: 		temp = (PORTD & 0x80) >> 8; // Extraer RD7
	CLRF       _temp+0
;RotateBitPIC16FF87.c,35 :: 		PORTD = (PORTD << 1) | temp; // Desplazar a la izquierda e insertar el bit RD7 en RD0
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;RotateBitPIC16FF87.c,36 :: 		Delay_ms(90); // Retardo de 300 ms para observar la rotación
	MOVLW      234
	MOVWF      R12+0
	MOVLW      195
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
;RotateBitPIC16FF87.c,37 :: 		}else{
	GOTO       L_main16
L_main14:
;RotateBitPIC16FF87.c,38 :: 		PORTD = 0xFF;
	MOVLW      255
	MOVWF      PORTD+0
;RotateBitPIC16FF87.c,39 :: 		Delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
;RotateBitPIC16FF87.c,40 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;RotateBitPIC16FF87.c,41 :: 		Delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
;RotateBitPIC16FF87.c,42 :: 		}
L_main16:
;RotateBitPIC16FF87.c,32 :: 		for( i = 0; i < 8; i++){
	INCF       _i+0, 1
;RotateBitPIC16FF87.c,43 :: 		}
	GOTO       L_main11
L_main12:
;RotateBitPIC16FF87.c,44 :: 		Delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
;RotateBitPIC16FF87.c,45 :: 		}else{
	GOTO       L_main20
L_main2:
;RotateBitPIC16FF87.c,46 :: 		PORTD = 0xFF;
	MOVLW      255
	MOVWF      PORTD+0
;RotateBitPIC16FF87.c,47 :: 		Delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
;RotateBitPIC16FF87.c,48 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;RotateBitPIC16FF87.c,49 :: 		Delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
;RotateBitPIC16FF87.c,50 :: 		}
L_main20:
;RotateBitPIC16FF87.c,51 :: 		}
	GOTO       L_main0
;RotateBitPIC16FF87.c,52 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
