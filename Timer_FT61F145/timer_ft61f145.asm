//Deviec:FT61F14X
//-----------------------Variable---------------------------------
		_n50uSCount		EQU		75H
		_mS		EQU		72H
		_sec		EQU		74H
		_temp		EQU		70H
//-----------------------Variable END---------------------------------

		ORG		0000H
		MOVLP 	0H 			//0000 	0180
		LJUMP 	44H 			//0001 	3844
		ORG		0004H
		BSR 	7EH, 0H 			//0004 	247E
		MOVLP 	0H 			//0005 	0180

		//;Timer_FT61F145.C: 23: if(T2UIE && T2UIF)
		MOVLB 	6H 			//0006 	1026
		BTSC 	DH, 0H 			//0007 	280D
		BTSS 	EH, 0H 			//0008 	2C0E
		LJUMP 	42H 			//0009 	3842

		//;Timer_FT61F145.C: 24: {
		//;Timer_FT61F145.C: 25: T2UIF = 0;
		BCR 	EH, 0H 			//000A 	200E

		//;Timer_FT61F145.C: 26: PB2 = !PB2;
		LDWI 	4H 			//000B 	0004
		MOVLB 	0H 			//000C 	1020
		XORWR 	DH, 1H 		//000D 	168D

		//;Timer_FT61F145.C: 27: if(n50uSCount < 20)
		LDWI 	14H 			//000E 	0014
		SUBWR 	75H, 0H 		//000F 	1275
		BTSC 	3H, 0H 			//0010 	2803
		LJUMP 	14H 			//0011 	3814

		//;Timer_FT61F145.C: 28: {
		//;Timer_FT61F145.C: 29: n50uSCount++;
		INCR 	75H, 1H 		//0012 	1AF5

		//;Timer_FT61F145.C: 30: }
		LJUMP 	2FH 			//0013 	382F

		//;Timer_FT61F145.C: 31: else
		//;Timer_FT61F145.C: 32: {
		//;Timer_FT61F145.C: 34: PB1 = !PB1;
		LDWI 	2H 			//0014 	0002
		XORWR 	DH, 1H 		//0015 	168D

		//;Timer_FT61F145.C: 35: if(mS < 1000)
		LDWI 	3H 			//0016 	0003
		SUBWR 	73H, 0H 		//0017 	1273
		LDWI 	E8H 			//0018 	00E8
		BTSC 	3H, 2H 			//0019 	2903
		SUBWR 	72H, 0H 		//001A 	1272
		BTSC 	3H, 0H 			//001B 	2803
		LJUMP 	21H 			//001C 	3821

		//;Timer_FT61F145.C: 36: {
		//;Timer_FT61F145.C: 37: mS++;
		INCR 	72H, 1H 		//001D 	1AF2
		BTSC 	3H, 2H 			//001E 	2903
		INCR 	73H, 1H 		//001F 	1AF3

		//;Timer_FT61F145.C: 38: }
		LJUMP 	2EH 			//0020 	382E

		//;Timer_FT61F145.C: 39: else
		//;Timer_FT61F145.C: 40: {
		//;Timer_FT61F145.C: 41: PB0 = !PB0;
		LDWI 	1H 			//0021 	0001
		XORWR 	DH, 1H 		//0022 	168D

		//;Timer_FT61F145.C: 42: if(sec < 10)
		LDWI 	AH 			//0023 	000A
		SUBWR 	74H, 0H 		//0024 	1274
		BTSC 	3H, 0H 			//0025 	2803
		LJUMP 	29H 			//0026 	3829

		//;Timer_FT61F145.C: 43: {
		//;Timer_FT61F145.C: 44: sec++;
		INCR 	74H, 1H 		//0027 	1AF4

		//;Timer_FT61F145.C: 45: }
		LJUMP 	2CH 			//0028 	382C

		//;Timer_FT61F145.C: 46: else
		//;Timer_FT61F145.C: 47: {
		//;Timer_FT61F145.C: 48: PA0 = !PA0;
		LDWI 	1H 			//0029 	0001
		XORWR 	CH, 1H 		//002A 	168C

		//;Timer_FT61F145.C: 49: sec = 0;
		CLRF 	74H 			//002B 	11F4

		//;Timer_FT61F145.C: 50: }
		//;Timer_FT61F145.C: 52: mS = 0;
		CLRF 	72H 			//002C 	11F2
		CLRF 	73H 			//002D 	11F3

		//;Timer_FT61F145.C: 53: }
		//;Timer_FT61F145.C: 54: n50uSCount = 0;
		CLRF 	75H 			//002E 	11F5

		//;Timer_FT61F145.C: 55: }
		//;Timer_FT61F145.C: 57: temp = ((TIM2ARRH << 8) | TIM2ARRL);
		MOVLB 	6H 			//002F 	1026
		LDR 	19H, 0H 			//0030 	1819
		STR 	71H 			//0031 	10F1
		CLRF 	70H 			//0032 	11F0
		LDR 	1AH, 0H 			//0033 	181A
		IORWR 	70H, 1H 		//0034 	14F0

		//;Timer_FT61F145.C: 58: temp = 0x02F3 - temp;
		LDWI 	F3H 			//0035 	00F3
		STR 	76H 			//0036 	10F6
		LDWI 	2H 			//0037 	0002
		STR 	77H 			//0038 	10F7
		LDR 	70H, 0H 			//0039 	1870
		SUBWR 	76H, 0H 		//003A 	1276
		STR 	70H 			//003B 	10F0
		LDR 	71H, 0H 			//003C 	1871
		SUBWFB 	77H, 0H 		//003D 	0B77
		STR 	71H 			//003E 	10F1

		//;Timer_FT61F145.C: 59: TIM2ARRH = (temp >> 8) & 0xFF;
		STR 	19H 			//003F 	1099

		//;Timer_FT61F145.C: 60: TIM2ARRL = temp & 0xFF;
		LDR 	70H, 0H 			//0040 	1870
		STR 	1AH 			//0041 	109A
		BCR 	7EH, 0H 			//0042 	207E
		RETI 					//0043 	1009
		MOVLP 	0H 			//0044 	0180
		LJUMP 	46H 			//0045 	3846
		CLRF 	70H 			//0046 	11F0
		CLRF 	71H 			//0047 	11F1
		CLRF 	72H 			//0048 	11F2
		CLRF 	73H 			//0049 	11F3
		CLRF 	74H 			//004A 	11F4
		CLRF 	75H 			//004B 	11F5
		BCR 	7EH, 0H 			//004C 	207E
		MOVLB 	0H 			//004D 	1020
		LJUMP 	4FH 			//004E 	384F

		//;Timer_FT61F145.C: 65: hardwareConfig();
		LCALL 	54H 			//004F 	3054
		MOVLP 	0H 			//0050 	0180

		//;Timer_FT61F145.C: 66: timer2_Init();
		LCALL 	80H 			//0051 	3080
		MOVLP 	0H 			//0052 	0180

		//;Timer_FT61F145.C: 69: while(1)
		//;Timer_FT61F145.C: 70: {
		LJUMP 	53H 			//0053 	3853

		//;Timer_FT61F145.C: 96: OSCCON = 0B01110001;
		LDWI 	71H 			//0054 	0071
		MOVLB 	1H 			//0055 	1021
		STR 	19H 			//0056 	1099

		//;Timer_FT61F145.C: 97: INTCON = 0B01000000;
		LDWI 	40H 			//0057 	0040
		STR 	BH 			//0058 	108B

		//;Timer_FT61F145.C: 99: PORTA = 0B11111111;
		LDWI 	FFH 			//0059 	00FF
		MOVLB 	0H 			//005A 	1020
		STR 	CH 			//005B 	108C

		//;Timer_FT61F145.C: 100: TRISA = 0x14;
		LDWI 	14H 			//005C 	0014
		MOVLB 	1H 			//005D 	1021
		STR 	CH 			//005E 	108C

		//;Timer_FT61F145.C: 102: PORTB = 0B11111111;
		LDWI 	FFH 			//005F 	00FF
		MOVLB 	0H 			//0060 	1020
		STR 	DH 			//0061 	108D

		//;Timer_FT61F145.C: 103: TRISB = 0x78;
		LDWI 	78H 			//0062 	0078
		MOVLB 	1H 			//0063 	1021
		STR 	DH 			//0064 	108D

		//;Timer_FT61F145.C: 105: PORTC = 0B11111111;
		LDWI 	FFH 			//0065 	00FF
		MOVLB 	0H 			//0066 	1020
		STR 	EH 			//0067 	108E

		//;Timer_FT61F145.C: 106: TRISC = 0B11111101;
		LDWI 	FDH 			//0068 	00FD
		MOVLB 	1H 			//0069 	1021
		STR 	EH 			//006A 	108E

		//;Timer_FT61F145.C: 108: WPDA = 0B00000000;
		MOVLB 	4H 			//006B 	1024
		CLRF 	CH 			//006C 	118C

		//;Timer_FT61F145.C: 109: WPDB = 0B00000000;
		CLRF 	DH 			//006D 	118D

		//;Timer_FT61F145.C: 110: WPDC = 0B00000000;
		CLRF 	EH 			//006E 	118E

		//;Timer_FT61F145.C: 112: WPUA = 0B10010000;
		LDWI 	90H 			//006F 	0090
		MOVLB 	3H 			//0070 	1023
		STR 	CH 			//0071 	108C

		//;Timer_FT61F145.C: 113: WPUB = 0B11100000;
		LDWI 	E0H 			//0072 	00E0
		STR 	DH 			//0073 	108D

		//;Timer_FT61F145.C: 114: WPUC = 0B11111101;
		LDWI 	FDH 			//0074 	00FD
		STR 	EH 			//0075 	108E

		//;Timer_FT61F145.C: 116: PSRC0 = 0B11111111;
		LDWI 	FFH 			//0076 	00FF
		MOVLB 	2H 			//0077 	1022
		STR 	1AH 			//0078 	109A

		//;Timer_FT61F145.C: 117: PSRC1 = 0B11111111;
		STR 	1BH 			//0079 	109B

		//;Timer_FT61F145.C: 119: PSINK0 = 0B11111111;
		MOVLB 	3H 			//007A 	1023
		STR 	1AH 			//007B 	109A

		//;Timer_FT61F145.C: 120: PSINK1 = 0B11111111;
		STR 	1BH 			//007C 	109B

		//;Timer_FT61F145.C: 121: PSINK2 = 0B11111111;
		STR 	1CH 			//007D 	109C

		//;Timer_FT61F145.C: 123: ANSELA = 0B00000000;
		CLRF 	17H 			//007E 	1197
		RET 					//007F 	1008

		//;Timer_FT61F145.C: 77: PCKEN |= 0B00000100;
		MOVLB 	1H 			//0080 	1021
		BSR 	1AH, 2H 			//0081 	251A

		//;Timer_FT61F145.C: 78: CKOCON = 0B00100000;
		LDWI 	20H 			//0082 	0020
		STR 	15H 			//0083 	1095

		//;Timer_FT61F145.C: 79: TCKSRC = 0B00010000;
		LDWI 	10H 			//0084 	0010
		MOVLB 	6H 			//0085 	1026
		STR 	1FH 			//0086 	109F

		//;Timer_FT61F145.C: 81: TIM2CR1 =0B10000101;
		LDWI 	85H 			//0087 	0085
		STR 	CH 			//0088 	108C

		//;Timer_FT61F145.C: 83: TIM2IER =0B00000001;
		LDWI 	1H 			//0089 	0001
		STR 	DH 			//008A 	108D

		//;Timer_FT61F145.C: 88: TIM2ARRH =0x02;
		LDWI 	2H 			//008B 	0002
		ORG		008CH
		STR 	19H 			//008C 	1099

		//;Timer_FT61F145.C: 89: TIM2ARRL =0xF3;
		LDWI 	F3H 			//008D 	00F3
		STR 	1AH 			//008E 	109A

		//;Timer_FT61F145.C: 91: GIE =1;
		BSR 	BH, 7H 			//008F 	278B
		RET 					//0090 	1008
			END
