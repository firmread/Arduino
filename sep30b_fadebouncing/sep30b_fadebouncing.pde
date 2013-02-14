//Concept of PWM = Pulse Width Modulation
//0-255 no. for analog in,,,

int bright = 0;
int fade = 1;

void setup(){
  pinMode(11,OUTPUT);
}

void loop(){
  analogWrite(11,bright);
  bright += fade;
  if (bright == 0 || bright == 255){
    fade = -fade;
  }
  delay(10);
}
