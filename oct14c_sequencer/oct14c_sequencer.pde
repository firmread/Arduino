const int ledPin = 10; 
const int inputPin = 2;

const int ledPin01 = 11; 
const int inputPin01 = 3;

const int ledPin02 = 12; 
const int inputPin02 = 4;

const int ledPin03 = 13; 
const int inputPin03 = 5;

const int pinArray[] = {3, 5, 6, 9};
int count = 0;
int timer = 15;


void setup (){
 Serial.begin(9600);
 pinMode(ledPin, OUTPUT);  
 pinMode(inputPin, INPUT);  
 digitalWrite(inputPin, HIGH);

 Serial.begin(9600);
 pinMode(ledPin01, OUTPUT);  
 pinMode(inputPin01, INPUT);  
 digitalWrite(inputPin01, HIGH);  

 Serial.begin(9600);
 pinMode(ledPin02, OUTPUT);  
 pinMode(inputPin02, INPUT);  
 digitalWrite(inputPin02, HIGH);  

 Serial.begin(9600);
 pinMode(ledPin03, OUTPUT);  
 pinMode(inputPin03, INPUT);  
 digitalWrite(inputPin03, HIGH);    

 // we make all the declarations at once
 for (count=0;count<4;count++) {
   pinMode(pinArray[count], OUTPUT);
 }

}

void loop(){

  //1
 int val = digitalRead(inputPin);
 if(val == LOW)
 {
   digitalWrite(ledPin, HIGH); 
 }
 else
 {
   digitalWrite(ledPin, LOW);
 }

  //2
 int val01 = digitalRead(inputPin01);
 Serial.println(val01);
 if(val01 == LOW) 
 {
   digitalWrite(ledPin, HIGH); 
   digitalWrite(ledPin01, HIGH); 

 }
 else
 {
   digitalWrite(ledPin, LOW);     
   digitalWrite(ledPin01, LOW);

 }


  //3
 int val02 = digitalRead(inputPin02);
 Serial.println(val02);
 if(val02 == LOW)
 {
    digitalWrite(ledPin, HIGH);
    delay(300);
    digitalWrite(ledPin, LOW);
    delay(300);
    digitalWrite(ledPin01, HIGH);
    delay(300);    
    digitalWrite(ledPin01, LOW);
    delay(300);
    digitalWrite(ledPin02, HIGH);
    delay(300);
    digitalWrite(ledPin02, LOW);
    delay(300);
    digitalWrite(ledPin03, HIGH);
    delay(300);
    digitalWrite(ledPin03, LOW);
    delay(300);

    digitalWrite(ledPin02, HIGH);
    delay(300);     
    digitalWrite(ledPin02, LOW);
    delay(300);   
    digitalWrite(ledPin01, HIGH);
    delay(300);     
    digitalWrite(ledPin01, LOW);
    delay(300);  
    digitalWrite(ledPin, HIGH);
    delay(300);     
    digitalWrite(ledPin, LOW);
    delay(300);         

 }


  //4
 int val03 = digitalRead(inputPin03);
 Serial.println(val03);
 if(val03 == LOW)
 {
    digitalWrite(ledPin, HIGH);
    digitalWrite(ledPin03, HIGH); 
    delay(300); 
    digitalWrite(ledPin, LOW);
    digitalWrite(ledPin03, LOW);   
    delay(300); 

    digitalWrite(ledPin01, HIGH);
    digitalWrite(ledPin02, HIGH);     
    delay(300);     
    digitalWrite(ledPin01, LOW);
    digitalWrite(ledPin02, LOW);     
    delay(300);    

    digitalWrite(ledPin, HIGH);
    digitalWrite(ledPin03, HIGH); 
    delay(300); 
    digitalWrite(ledPin, LOW);
    digitalWrite(ledPin03, LOW);   
    delay(300);   

    digitalWrite(ledPin01, HIGH);
    digitalWrite(ledPin02, HIGH);     
    delay(300);     
    digitalWrite(ledPin01, LOW);
    digitalWrite(ledPin02, LOW);     
    delay(300);     

    digitalWrite(ledPin, HIGH);
    digitalWrite(ledPin03, HIGH); 
    delay(300); 
    digitalWrite(ledPin, LOW);
    digitalWrite(ledPin03, LOW);   
    delay(300);     
 }

//  //5th
//  while(int val04 = digitalRead(inputPin + inputPin01)){
//  if(val04 == LOW)
//  {
//    digitalWrite(ledPin02, HIGH); 
//    digitalWrite(ledPin02, LOW); 
//    delay(1000);   
//    
//    digitalWrite(ledPin03, HIGH); 
//    digitalWrite(ledPin03, LOW); 
//    delay(1000);   
//          
//  }
//  }



//  //5th
//  int val04 = digitalRead(inputPin && inputPin01);
//  if(val04 == LOW)
//  {
//    digitalWrite(ledPin02, HIGH); 
//    digitalWrite(ledPin02, LOW); 
//    delay(1000);   
//    
//    digitalWrite(ledPin03, HIGH); 
//    digitalWrite(ledPin03, LOW); 
//    delay(1000);   
//          
//
//  }


}
