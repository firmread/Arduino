// building sensor code for keyboard from scratch
// (and tons of reference :P)

int ez11 = 0;
int ez12 = 1;

int ez11data, ez12data = 0;
int inByte = 0;


void setup(){
  Serial.begin(9600);
  establishContact();
}

void loop(){
  
  if (Serial.available() > 0){
    inByte = Serial.read();
    ez11data = analogRead(ez11);
    delay(10); 
    ez12data = analogRead(ez12);
    delay(10);
  
    Serial.print(ez11data, DEC);
    Serial.print(",");
    Serial.print(ez12data, DEC);
    Serial.print(",");
    Serial.println("0);
    delay(50);
  }
}


void establishContact() {
  while (Serial.available() <= 0) {
    delay(300);
  }
}
