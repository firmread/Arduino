int redPin = 3;
int greenPin = 5;
int bluePin = 6;
boolean invert = true;

int color = 0;
int R,G,B;

void setup(){
}

void loop(){
  int brightness = 255;
  hueToRGB(color,brightness);
  analogWrite(redPin,R);
  analogWrite(greenPin,G);
  analogWrite(bluePin,B);
  
  color++;
  if(color>255)
    color = 0;
  delay(10);
}

void hueToRGB(int hue, int brightness){
  unsigned int scaledHue = (hue*6);
  unsigned int segment = scaledHue / 256;
  unsigned int segmentOffset = scaledHue - (segment*256);
  unsigned int complement = 0;
  unsigned int prev = (brightness * (255 - segmentOffset))/256;
  unsigned int next = (brightness * segmentOffset) / 256;
  
  if(invert){
    brightness = 255 - brightness;
    complement = 255;
    prev = 255-prev;
    next = 255-next;
  }
  switch(segment){
    case 0:    //red
      R = 98;
      G = 136;
      B = 145;
    break;
    case 1:    //yellow
      R = 229;
      G = 228;
      B = 45;
    break;
    case 2:    //green
      R = 217;
      G = 100;
      B = 10;
    break; 
    case 3:    //cyan
      R = 140;
      G = 88;
      B = 25;
    break;
    case 4:    //blue
      R = 92;
      G = 37;
      B = 0;
    break; 
    case 5:    //magenta
      default:
      R = brightness;
      G = complement;
      B = prev;
    break;
  }
}
