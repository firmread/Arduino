int apin = 0;

void setup(){
  Serial.begin(9600);
}
void loop(){
  Serial.println(analogRead(apin));
  delay(500);
} 
