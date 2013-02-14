#include <Charliplexing.h> //Imports the library, which needs to be

byte line = 0;       //Row counter
char buffer[10];
int value;

int delaytime = 100;
int slow = 2;

int sen1Pin = A4;
int sen2Pin = A5;

int waterState1 = 0;
int waterState2 = 0;

int watercalibrate = 3;

void setup() 
{
  LedSign::Init();  //Initializes the screen
  pinMode(sen1Pin, INPUT);
  pinMode(sen2Pin, INPUT);
  Serial.begin(9600);
}

void loop()
{
  // serial tests
  Serial.print(analogRead(sen1Pin),DEC);
  Serial.print(" , ");
  Serial.println(analogRead(sen2Pin),DEC);
  //delay(delaytime);
  
  waterState1 = analogRead(sen1Pin);
  waterState2 = analogRead(sen2Pin);
  
//  if(waterState1 < watercalibrate && waterState2 < watercalibrate) {
//    steadywave();
//  }
  if (waterState1 > watercalibrate){
    // && waterState2 < watercalibrate
    fragmentleft();
  }
  else if ( waterState2 > watercalibrate){
    // waterState1 < watercalibrate &&
    fragmentright();
  }
  else {
    steadywave();	
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

void steadywave(){
        delay(delaytime);
	DisplayBitMap(4369);
	DisplayBitMap(15291);
	DisplayBitMap(12014);
	DisplayBitMap(1092);
	DisplayBitMap(0);
	DisplayBitMap(4369);
	DisplayBitMap(15291);
	DisplayBitMap(12014);
	DisplayBitMap(1092);
	delay(delaytime);
	DisplayBitMap(0);
	DisplayBitMap(4369);
	DisplayBitMap(15291);
	DisplayBitMap(12014);
	DisplayBitMap(1092);
	DisplayBitMap(0);
	DisplayBitMap(4369);
	DisplayBitMap(15291);
	DisplayBitMap(12014);
	delay(delaytime);
	DisplayBitMap(1092);
	DisplayBitMap(0);
	DisplayBitMap(4369);
	DisplayBitMap(15291);
	DisplayBitMap(3822);
	DisplayBitMap(1092);
	DisplayBitMap(0);
	DisplayBitMap(4369);
	DisplayBitMap(15291);
	delay(delaytime);
	DisplayBitMap(3822);
	DisplayBitMap(1092);
	DisplayBitMap(0);
	DisplayBitMap(4369);
	DisplayBitMap(15291);
	DisplayBitMap(12014);
	DisplayBitMap(1092);
	DisplayBitMap(0);
	DisplayBitMap(4369);
	delay(delaytime);
	DisplayBitMap(15291);
	DisplayBitMap(3822);
	DisplayBitMap(1092);
	DisplayBitMap(0);
	DisplayBitMap(4369);
	DisplayBitMap(15291);
	DisplayBitMap(12014);
	DisplayBitMap(1092);
	DisplayBitMap(0);

}

void fragmentleft(){

	delay(delaytime*slow);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(3);
	DisplayBitMap(2);
	delay(delaytime*slow);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(7);
	DisplayBitMap(12);
	DisplayBitMap(8);
	delay(delaytime*slow);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(7);
	DisplayBitMap(8);
	DisplayBitMap(16);
	DisplayBitMap(16);
	delay(delaytime*slow);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(7);
	DisplayBitMap(8);
	DisplayBitMap(16);
	DisplayBitMap(32);
	DisplayBitMap(64);
	DisplayBitMap(64);
	delay(delaytime*slow);
	DisplayBitMap(255);
	DisplayBitMap(384);
	DisplayBitMap(768);
	DisplayBitMap(1536);
	DisplayBitMap(3072);
	DisplayBitMap(3072);
	DisplayBitMap(3072);
	DisplayBitMap(3072);
	DisplayBitMap(3072);
	delay(delaytime*slow);
	DisplayBitMap(3840);
	DisplayBitMap(7168);
	DisplayBitMap(6144);
	DisplayBitMap(6144);
	DisplayBitMap(6144);
	DisplayBitMap(6144);
	DisplayBitMap(12288);
	DisplayBitMap(12288);
	DisplayBitMap(12288);

}


void fragmentright(){
	delay(delaytime*slow);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(8192);
	DisplayBitMap(4096);
	delay(delaytime*slow);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(12288);
	DisplayBitMap(2048);
	DisplayBitMap(2048);
	delay(delaytime*slow);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(12288);
	DisplayBitMap(2048);
	DisplayBitMap(1024);
	DisplayBitMap(1024);
	delay(delaytime*slow);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(14336);
	DisplayBitMap(1024);
	DisplayBitMap(512);
	DisplayBitMap(256);
	DisplayBitMap(256);
	DisplayBitMap(256);
	delay(delaytime*slow);
	DisplayBitMap(12288);
	DisplayBitMap(3072);
	DisplayBitMap(1536);
	DisplayBitMap(768);
	DisplayBitMap(384);
	DisplayBitMap(128);
	DisplayBitMap(128);
	DisplayBitMap(128);
	DisplayBitMap(128);
	delay(delaytime*slow);
	DisplayBitMap(384);
	DisplayBitMap(64);
	DisplayBitMap(96);
	DisplayBitMap(32);
	DisplayBitMap(48);
	DisplayBitMap(48);
	DisplayBitMap(48);
	DisplayBitMap(48);
	DisplayBitMap(96);
	delay(delaytime*slow);
	DisplayBitMap(14);
	DisplayBitMap(7);
	DisplayBitMap(3);
	DisplayBitMap(3);
	DisplayBitMap(3);
	DisplayBitMap(3);
	DisplayBitMap(3);
	DisplayBitMap(7);
	DisplayBitMap(6);
}
