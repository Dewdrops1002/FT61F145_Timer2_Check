//Deviec:FT61F14X
//-----------------------Variable---------------------------------
		_n50uSCount		EQU		73H
		_mS		EQU		70H
		_sec		EQU		72H
//-----------------------Variable END---------------------------------

		ORG		0000H
		MOVLP 	0H 			//0000 	0180
		LJUMP 	30H 			//0001 	3830
		ORG		0004H
		BSR 	7EH, 0H 			//0004 	247E
		MOVLP 	0H 			//0005 	0180

		//;Timer_FT61F145.C: 23: if(T2UIE && T2UIF)
		MOVLB 	6H 			//0006 	1026
		BTSC 	DH, 0H 			//0007 	280D
		BTSS 	EH, 0H 			//0008 	2C0E
		LJUMP 	2EH 			//0009 	382E

		//;Timer_FT61F145.C: 24: {
		//;Timer_FT61F145.C: 25: T2UIF = 1;
		BSR 	EH, 0H 			//000A 	240E

		//;Timer_FT61F145.C: 26: PB2 = !PB2;
		LDWI 	4H 			//000B 	0004
		MOVLB 	0H 			//000C 	1020
		XORWR 	DH, 1H 		//000D 	168D

		//;Timer_FT61F145.C: 27: if(n50uSCount < 20)
		LDWI 	14H 			//000E 	0014
		SUBWR 	73H, 0H 		//000F 	1273
		BTSC 	3H, 0H 			//0010 	2803
		LJUMP 	14H 			//0011 	3814

		//;Timer_FT61F145.C: 28: {
		//;Timer_FT61F145.C: 29: n50uSCount++;
		INCR 	73H, 1H 		//0012 	1AF3

		//;Timer_FT61F145.C: 30: }
		LJUMP 	2EH 			//0013 	382E

		//;Timer_FT61F145.C: 31: else
		//;Timer_FT61F145.C: 32: {
		//;Timer_FT61F145.C: 34: PB1 = !PB1;
		LDWI 	2H 			//0014 	0002
		XORWR 	DH, 1H 		//0015 	168D

		//;Timer_FT61F145.C: 35: if(mS < 1000)
		LDWI 	3H 			//0016 	0003
		SUBWR 	71H, 0H 		//0017 	1271
		LDWI 	E8H 			//0018 	00E8
		BTSC 	3H, 2H 			//0019 	2903
		SUBWR 	70H, 0H 		//001A 	1270
		BTSC 	3H, 0H 			//001B 	2803
		LJUMP 	21H 			//001C 	3821

		//;Timer_FT61F145.C: 36: {
		//;Timer_FT61F145.C: 37: mS++;
		INCR 	70H, 1H 		//001D 	1AF0
		BTSC 	3H, 2H 			//001E 	2903
		INCR 	71H, 1H 		//001F 	1AF1

		//;Timer_FT61F145.C: 38: }
		LJUMP 	2EH 			//0020 	382E

		//;Timer_FT61F145.C: 39: else
		//;Timer_FT61F145.C: 40: {
		//;Timer_FT61F145.C: 41: PB0 = !PB0;
		LDWI 	1H 			//0021 	0001
		XORWR 	DH, 1H 		//0022 	168D

		//;Timer_FT61F145.C: 42: if(sec < 10)
		LDWI 	AH 			//0023 	000A
		SUBWR 	72H, 0H 		//0024 	1272
		BTSC 	3H, 0H 			//0025 	2803
		LJUMP 	29H 			//0026 	3829

		//;Timer_FT61F145.C: 43: {
		//;Timer_FT61F145.C: 44: sec++;
		INCR 	72H, 1H 		//0027 	1AF2

		//;Timer_FT61F145.C: 45: }
		LJUMP 	2CH 			//0028 	382C

		//;Timer_FT61F145.C: 46: else
		//;Timer_FT61F145.C: 47: {
		//;Timer_FT61F145.C: 48: PA0 = !PA0;
		LDWI 	1H 			//0029 	0001
		XORWR 	CH, 1H 		//002A 	168C

		//;Timer_FT61F145.C: 49: sec = 0;
		CLRF 	72H 			//002B 	11F2

		//;Timer_FT61F145.C: 50: }
		//;Timer_FT61F145.C: 52: mS = 0;
		CLRF 	70H 			//002C 	11F0
		CLRF 	71H 			//002D 	11F1
		BCR 	7EH, 0H 			//002E 	207E
		RETI 					//002F 	1009
		MOVLP 	0H 			//0030 	0180
		LJUMP 	32H 			//0031 	3832
		CLRF 	70H 			//0032 	11F0
		CLRF 	71H 			//0033 	11F1
		CLRF 	72H 			//0034 	11F2
		CLRF 	73H 			//0035 	11F3
		BCR 	7EH, 0H 			//0036 	207E
		MOVLB 	0H 			//0037 	1020
		LJUMP 	39H 			//0038 	3839

		//;Timer_FT61F145.C: 59: hardwareConfig();
		LCALL 	3EH 			//0039 	303E
		MOVLP 	0H 			//003A 	0180

		//;Timer_FT61F145.C: 60: timer2_Init();
		LCALL 	6AH 			//003B 	306A
		MOVLP 	0H 			//003C 	0180

		//;Timer_FT61F145.C: 63: while(1)
		//;Timer_FT61F145.C: 64: {
		LJUMP 	3DH 			//003D 	383D

		//;Timer_FT61F145.C: 87: OSCCON = 0B01110001;
		LDWI 	71H 			//003E 	0071
		MOVLB 	1H 			//003F 	1021
		STR 	19H 			//0040 	1099

		//;Timer_FT61F145.C: 88: INTCON = 0B01000000;
		LDWI 	40H 			//0041 	0040
		STR 	BH 			//0042 	108B

		//;Timer_FT61F145.C: 90: PORTA = 0B11111111;
		LDWI 	FFH 			//0043 	00FF
		MOVLB 	0H 			//0044 	1020
		STR 	CH 			//0045 	108C

		//;Timer_FT61F145.C: 91: TRISA = 0x14;
		LDWI 	14H 			//0046 	0014
		MOVLB 	1H 			//0047 	1021
		STR 	CH 			//0048 	108C

		//;Timer_FT61F145.C: 93: PORTB = 0B11111111;
		LDWI 	FFH 			//0049 	00FF
		MOVLB 	0H 			//004A 	1020
		STR 	DH 			//004B 	108D

		//;Timer_FT61F145.C: 94: TRISB = 0x78;
		LDWI 	78H 			//004C 	0078
		MOVLB 	1H 			//004D 	1021
		STR 	DH 			//004E 	108D

		//;Timer_FT61F145.C: 96: PORTC = 0B11111111;
		LDWI 	FFH 			//004F 	00FF
		MOVLB 	0H 			//0050 	1020
		STR 	EH 			//0051 	108E

		//;Timer_FT61F145.C: 97: TRISC = 0B11111101;
		LDWI 	FDH 			//0052 	00FD
		MOVLB 	1H 			//0053 	1021
		STR 	EH 			//0054 	108E

		//;Timer_FT61F145.C: 99: WPDA = 0B00000000;
		MOVLB 	4H 			//0055 	1024
		CLRF 	CH 			//0056 	118C

		//;Timer_FT61F145.C: 100: WPDB = 0B00000000;
		CLRF 	DH 			//0057 	118D

		//;Timer_FT61F145.C: 101: WPDC = 0B00000000;
		CLRF 	EH 			//0058 	118E

		//;Timer_FT61F145.C: 103: WPUA = 0B10010000;
		LDWI 	90H 			//0059 	0090
		MOVLB 	3H 			//005A 	1023
		STR 	CH 			//005B 	108C

		//;Timer_FT61F145.C: 104: WPUB = 0B11100000;
		LDWI 	E0H 			//005C 	00E0
		STR 	DH 			//005D 	108D

		//;Timer_FT61F145.C: 105: WPUC = 0B11111101;
		LDWI 	FDH 			//005E 	00FD
		STR 	EH 			//005F 	108E

		//;Timer_FT61F145.C: 107: PSRC0 = 0B11111111;
		LDWI 	FFH 			//0060 	00FF
		MOVLB 	2H 			//0061 	1022
		STR 	1AH 			//0062 	109A

		//;Timer_FT61F145.C: 108: PSRC1 = 0B11111111;
		STR 	1BH 			//0063 	109B

		//;Timer_FT61F145.C: 110: PSINK0 = 0B11111111;
		MOVLB 	3H 			//0064 	1023
		STR 	1AH 			//0065 	109A

		//;Timer_FT61F145.C: 111: PSINK1 = 0B11111111;
		STR 	1BH 			//0066 	109B

		//;Timer_FT61F145.C: 112: PSINK2 = 0B11111111;
		STR 	1CH 			//0067 	109C

		//;Timer_FT61F145.C: 114: ANSELA = 0B00000000;
		CLRF 	17H 			//0068 	1197
		RET 					//0069 	1008

		//;Timer_FT61F145.C: 71: PCKEN |= 0B00000100;
		MOVLB 	1H 			//006A 	1021
		BSR 	1AH, 2H 			//006B 	251A

		//;Timer_FT61F145.C: 72: CKOCON = 0B00100000;
		LDWI 	20H 			//006C 	0020
		STR 	15H 			//006D 	1095

		//;Timer_FT61F145.C: 73: TCKSRC = 0B00010000;
		LDWI 	10H 			//006E 	0010
		MOVLB 	6H 			//006F 	1026
		STR 	1FH 			//0070 	109F

		//;Timer_FT61F145.C: 75: TIM2CR1 =0B10000101;
		LDWI 	85H 			//0071 	0085
		STR 	CH 			//0072 	108C

		//;Timer_FT61F145.C: 77: TIM2IER =0B00000001;
		LDWI 	1H 			//0073 	0001
		ORG		0074H
		STR 	DH 			//0074 	108D

		//;Timer_FT61F145.C: 79: TIM2ARRH =0x03;
		LDWI 	3H 			//0075 	0003
		STR 	19H 			//0076 	1099

		//;Timer_FT61F145.C: 80: TIM2ARRL =0x1B;
		LDWI 	1BH 			//0077 	001B
		STR 	1AH 			//0078 	109A

		//;Timer_FT61F145.C: 82: GIE =1;
		BSR 	BH, 7H 			//0079 	278B
		RET 					//007A 	1008
			END
