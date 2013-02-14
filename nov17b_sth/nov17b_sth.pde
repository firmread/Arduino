#include <Charliplexing.h> //Imports the library, which needs to be

byte line = 0;       //Row counter
char buffer[10];
int value;

int delaytime = 100;

int sen1Pin = A4;
int sen2Pin = A5;

void setup() 
{
  LedSign::Init();  //Initializes the screen
  pinMode(sen1Pin, INPUT);
  pinMode(sen2Pin, INPUT);
}

void loop()
{
        
  //top ready
  if(analogRead(sen1Pin) < 1023) {
	//delay(delaytime);
	DisplayBitMap(16383);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);

        delay(delaytime);
	DisplayBitMap(16383);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(3309);
	DisplayBitMap(13074);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(2149);
	DisplayBitMap(9608);
	DisplayBitMap(4626);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(2116);
	DisplayBitMap(41);
	DisplayBitMap(9600);
	DisplayBitMap(4626);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(2117);
	DisplayBitMap(9512);
	DisplayBitMap(128);
	DisplayBitMap(4626);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(64);
	DisplayBitMap(10529);
	DisplayBitMap(1036);
	DisplayBitMap(4736);
	DisplayBitMap(16);
	DisplayBitMap(2);
	DisplayBitMap(0);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(64);
	DisplayBitMap(32);
	DisplayBitMap(10497);
	DisplayBitMap(1160);
	DisplayBitMap(4612);
	DisplayBitMap(0);
	DisplayBitMap(18);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(64);
	DisplayBitMap(32);
	DisplayBitMap(10497);
	DisplayBitMap(1160);
	DisplayBitMap(4612);
	DisplayBitMap(18);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(64);
	DisplayBitMap(10272);
	DisplayBitMap(385);
	DisplayBitMap(1036);
	DisplayBitMap(4608);
	DisplayBitMap(18);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(64);
	DisplayBitMap(10528);
	DisplayBitMap(1161);
	DisplayBitMap(4612);
	DisplayBitMap(18);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(2112);
	DisplayBitMap(9504);
	DisplayBitMap(4233);
	DisplayBitMap(534);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(2368);
	DisplayBitMap(13480);
	DisplayBitMap(535);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(2368);
	DisplayBitMap(14015);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(16383);
        delay(delaytime);
  }
 
  else if(analogRead(sen2Pin) < 1023) {
        
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(16383);  
		delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(2368);
	DisplayBitMap(14015);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(2368);
	DisplayBitMap(13480);
	DisplayBitMap(535);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(2112);
	DisplayBitMap(9504);
	DisplayBitMap(4233);
	DisplayBitMap(534);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(64);
	DisplayBitMap(10528);
	DisplayBitMap(1161);
	DisplayBitMap(4612);
	DisplayBitMap(18);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(64);
	DisplayBitMap(10272);
	DisplayBitMap(385);
	DisplayBitMap(1036);
	DisplayBitMap(4608);
	DisplayBitMap(18);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(64);
	DisplayBitMap(32);
	DisplayBitMap(10497);
	DisplayBitMap(1160);
	DisplayBitMap(4612);
	DisplayBitMap(18);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(64);
	DisplayBitMap(32);
	DisplayBitMap(10497);
	DisplayBitMap(1160);
	DisplayBitMap(4612);
	DisplayBitMap(0);
	DisplayBitMap(18);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(64);
	DisplayBitMap(10529);
	DisplayBitMap(1036);
	DisplayBitMap(4736);
	DisplayBitMap(16);
	DisplayBitMap(2);
	DisplayBitMap(0);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(2117);
	DisplayBitMap(9512);
	DisplayBitMap(128);
	DisplayBitMap(4626);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(2116);
	DisplayBitMap(41);
	DisplayBitMap(9600);
	DisplayBitMap(4626);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(2149);
	DisplayBitMap(9608);
	DisplayBitMap(4626);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(3309);
	DisplayBitMap(13074);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
        delay(delaytime);
	DisplayBitMap(16383);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	delay(delaytime);
	DisplayBitMap(16383);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
        delay(delaytime);
  }
}

void DisplayBitMap(int lineint)
{
  //int data[9] = {95, 247, 123, 511, 255, 1, 5, 31, 15};
  
  //for(line = 0; line < 9; line++) {
  for (byte led=0; led<14; ++led) {
    if (lineint & (1<<led)) {
      LedSign::Set(led, line, 1);
    } else {
      LedSign::Set(led, line, 0);
    }
  }
    
  line++;
  if(line >= 9) line = 0;
}
