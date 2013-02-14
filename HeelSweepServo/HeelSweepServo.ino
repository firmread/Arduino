// Sweep
// by BARRAGAN <http://barraganstudio.com> 
// This example code is in the public domain.


#include <Servo.h> 
 
Servo myservo;  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 
 
int pos = 0;    // variable to store the servo position 

int counter = 0;
boolean work = true;
boolean notwork = false;

void setup() 
{ 
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object 

  
} 
 
 
void loop() 
{   
  
  if(work){
    for(pos = 0; pos < 180; pos +=3)  // goes from 0 degrees to 180 degrees 
    {                                  // in steps of 1 degree 
      myservo.write(pos);              // tell servo to go to position in variable 'pos' 
      delay(15);                       // waits 15ms for the servo to reach the position 
    } 
    for(pos = 180; pos>=1; pos-=3)     // goes from 180 degrees to 0 degrees 
    {                                
      myservo.write(pos);              // tell servo to go to position in variable 'pos' 
      delay(15);                       // waits 15ms for the servo to reach the position 
    }
    
    counter++;
    
    if(counter>=20){
      notwork = true;
      work = false;
      counter = 0;
    }

  }
  
    
  
  if(notwork){
    delay(30000);
    notwork = false;
    work = true;
    counter = 0;
  }
  
 
 
  
} 
