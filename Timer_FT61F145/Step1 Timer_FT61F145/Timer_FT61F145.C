#include	"SYSCFG.h"

void hardwareConfig(void);
void timer2_Init(void);

#define		OUT_SWG_PIN				PB2
#define		OUT_HIGH_PIN			PB1
#define		OUT_MED_PIN				PB0
#define		OUT_LOW_PIN				PA0

unsigned char n50uSCount;
unsigned int mS = 0;
unsigned char sec = 0;

void interrupt ISR(void)
{
//	static unsigned int IR_State = 0;
//	static unsigned int IR_State_Last = 0;
//	static unsigned char IR_Count = 0;
//	static unsigned char period = 0;
//	static unsigned char dataFinish = 0;	
	
	if(T2UIE && T2UIF) //50uS               	
	{
		T2UIF = 1;
        OUT_SWG_PIN = !OUT_SWG_PIN;
		if(n50uSCount < 20)	//20*50 = 1000 uS (1mS)
		{
			n50uSCount++;
		}
		else
		{
			//msFlag = 1;	
            OUT_HIGH_PIN = !OUT_HIGH_PIN;	//1mSec
            if(mS < 1000)
            {
				mS++;
            }
            else 
            {
				OUT_MED_PIN = !OUT_MED_PIN;	//1 Sec
				if(sec < 10)
                {
					sec++;
                }
                else
                {
					OUT_LOW_PIN = !OUT_LOW_PIN;	//10 Sec
					sec = 0;
                }
                
				mS = 0;
            }
		}		
	}
}
void main(void)
{
	hardwareConfig();
    timer2_Init();
    
	//delay_ms(500);
	while(1)
    {
 
    }
}

void timer2_Init(void)
{
	PCKEN |= 0B00000100;
    CKOCON = 0B00100000;
    TCKSRC = 0B00010000;

    TIM2CR1 =0B10000101;
            
    TIM2IER =0B00000001;
    
    TIM2ARRH =0x03;
    TIM2ARRL =0x1B;
    
    GIE =1;
}

void hardwareConfig(void) 
{
	OSCCON 	= 0B01110001;
	INTCON 	= 0B01000000;  		
    
	PORTA 	= 0B11111111;		
	TRISA 	= 0x14;
	
	PORTB 	= 0B11111111;		
	TRISB 	= 0x78;
	
	PORTC 	= 0B11111111; 	
	TRISC 	= 0B11111101;
	
	WPDA 	= 0B00000000;     
	WPDB 	= 0B00000000;     
	WPDC 	= 0B00000000;     
    
    WPUA 	= 0B10010000;     
	WPUB 	= 0B11100000;     
	WPUC 	= 0B11111101;     
    
    PSRC0 	= 0B11111111;  
    PSRC1 	= 0B11111111;    
    
    PSINK0 	= 0B11111111;  
    PSINK1 	= 0B11111111; 
    PSINK2 	= 0B11111111;
	
    ANSELA 	= 0B00000000;   
}