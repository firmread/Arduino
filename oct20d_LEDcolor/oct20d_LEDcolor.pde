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
  delay(50);
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
      R = brightness;
      G = next;
      B = complement;
    break;
    case 1:    //yellow
      R = prev;
      G = brightness;
      B = complement;
    break;
    case 2:    //green
      R = complement;
      G = brightness;
      B = next;
    break; 
    case 3:    //cyan
      R = complement;
      G = prev;
      B = brightness;
    break;
    case 4:    //blue
      R = next;
      G = complement;
      B = brightness;
    break; 
    case 5:    //magenta
      default:
      R = brightness;
      G = complement;
      B = prev;
    break;
  }
}
