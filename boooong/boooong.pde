///NOT USING ANYMORE USE SERIALRESPONSEASCII INSTEAD

int sen1Pin = A0;
int sen2Pin = A1;
int inByte = 0;         // incoming serial byte


void setup() 
{

  pinMode(sen1Pin, INPUT);
  pinMode(sen2Pin, INPUT);
  Serial.begin(9600);
  //establishContact();
}

void loop()
{
    if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();
  // serial tests
  Serial.print(analogRead(sen1Pin),DEC);
  Serial.print(",");
  Serial.println(analogRead(sen2Pin),DEC);
  delay(50);

}
}
 
//void establishContact() {
//  while (Serial.available() <= 0) {
//    Serial.println("0,0");   // send an initial string
//    delay(50);
//  }
//}
