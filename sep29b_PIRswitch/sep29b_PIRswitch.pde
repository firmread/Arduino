int led = 5;                  //LED connected at pin 2
int PushButton = 4;           //PushButton connected to pin 3
int debounce = 500;            //Length of time to debounce switch in ms
int ButtonValue;              //
int LastButtonValue = LOW;

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
    if(ButtonValue == 1){
//      state = !state;
      digitalWrite (led,LOW);// toggle the LED!
    }
    else{
      digitalWrite(led,HIGH);
    }
    LastButtonValue = ButtonValue;
  }
}
