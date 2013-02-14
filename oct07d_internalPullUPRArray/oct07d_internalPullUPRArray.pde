int ledPin = 13;
int inputPin = 2;
int ledPin2 = 12;
int inputPin2 = 3;
int ledPin3 = 11;
int inputPin3 = 4;
int ledPin4 = 10;
int inputPin4 = 5;

void setup(){
  Serial.begin(9600);  
  pinMode(ledPin,OUTPUT);
  pinMode(inputPin,INPUT);
  digitalWrite(inputPin,HIGH);

  pinMode(ledPin2,OUTPUT);
  pinMode(inputPin2,INPUT);
  digitalWrite(inputPin2,HIGH);

  pinMode(ledPin3,OUTPUT);
  pinMode(inputPin3,INPUT);
  digitalWrite(inputPin3,HIGH);

  pinMode(ledPin4,OUTPUT);
  pinMode(inputPin4,INPUT);
  digitalWrite(inputPin4,HIGH);

  
}

void loop(){

//1
  int val = digitalRead(inputPin);
  if(val == HIGH){
    digitalWrite(ledPin,HIGH);
  }
  else{
    digitalWrite(ledPin,LOW);
  }
//2
    int val2 = digitalRead(inputPin2);
  if(val2 == HIGH){
    digitalWrite(ledPin2,HIGH);
  }
  else{
    digitalWrite(ledPin2,LOW);
  }
//3
    int val3 = digitalRead(inputPin3);
  if(val3 == HIGH){
    digitalWrite(ledPin3,HIGH);
  }
  else{
    digitalWrite(ledPin3,LOW);
  }
//4
    int val4 = digitalRead(inputPin4);
  if(val4 == HIGH){
    digitalWrite(ledPin4,HIGH);
  }
  else{
    digitalWrite(ledPin4,LOW);
  }
  
  
  Serial.println("val = " + val + val2);

}
