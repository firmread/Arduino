int led = 5;                  //LED connected at pin 2
int PushButton = 4;           //PushButton connected to pin 3
int debounce = 10;            //Length of time to debounce switch in ms
int ButtonValue;              //
int LastButtonValue = LOW;
int c=0 ;

int state = LOW;

void setup(){
  
  Serial.begin(9600);         // initialize the serial driver
  pinMode(led,OUTPUT);        // sets the LED pin as output
  pinMode(PushButton,INPUT);   // sets PushButton pin as input
  
  
}
  
void loop() {
  ButtonValue = digitalRead(PushButton);    
  Serial.println(ButtonValue);
  if(ButtonValue !=LastButtonValue){
    delay(debounce);          // wait long enough to know that the input is read
    ButtonValue = digitalRead(PushButton);
    if(ButtonValue == 1) {
      c+=1;
      if(c==5){
        flash(200);flash(200);flash(200);flash(200);flash(200);
//        digitalWrite (led,HIGH);
//        delay(500);
//        digitalWrite (led,LOW);
//        delay(500);
        c=0;
      }
      else{
        digitalWrite (led,LOW);
      }
    }
  }
  LastButtonValue = ButtonValue;
}


void flash(int duration){
  digitalWrite(led,HIGH);
  delay(duration);
  digitalWrite(led,LOW);
  delay(duration);
}
