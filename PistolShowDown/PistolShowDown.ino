#include <Bounce.h>

int sensorPinRight = 0;
int sensorPinLeft = 1;
int button1Pin = 1;
bool targeted = false;
bool targetLeft = false;
bool targetRight = false;
int lightValue = 0;
bool shoot = false;
int i;


Bounce button1 = Bounce(button1Pin, 5);

void setup() {
  Serial.begin(9600);
  i = random(0, 2);
  delay(500);
  ChooseTarget(i);
  pinMode(sensorPinRight, INPUT);
  pinMode(sensorPinLeft, INPUT);
  pinMode(button1Pin, INPUT_PULLUP);
  pinMode(2, OUTPUT);
}

void GameLogic() {
  
  IsInSight(i);
  IsButtonPressed();

}

void loop() {
  Serial.println(analogRead(i));
    Serial.println(i); 
  delay(150);
  GameLogic();
  button1.update();
}

static void Shoot() {
  usbMIDI.sendControlChange(1, 127, 3);
  //Serial.println("Target is dead");

  if(targetLeft == true){
    targetLeft = false; 
    }
  else if(targetRight == true){
    targetRight = false; 
    }
    i = random(0,2); 
    delay(2000); 
    ChooseTarget(i);
}

void IsInSight(int i) {
  if (analogRead(i) > 300) {
    Serial.println("target is in position");
    targeted = true;
  }
  else {
    targeted = false;
  }
}

void ChooseTarget(int input) {
  
  if (targetRight || targetLeft) {
    return;
  }
  // Play Sound in Right Speaker
  if (input == 0) {
    usbMIDI.sendControlChange(3,0,3); 
    targetRight = true;
  }
  else if (input == 1) {
    // Play Sound In Left Side
    usbMIDI.sendControlChange(4,0,4); 
    targetLeft = true;
  }
}

void IsButtonPressed() {
  if (button1.fallingEdge()) {
    digitalWrite(2, 1);
    shoot = true;
    Serial.println("button pressed");
    usbMIDI.sendControlChange(1, 127, 9);
  }

  if (button1.risingEdge()) {
    digitalWrite(2, 0);
    shoot = false;
    Serial.println("button released");
  }

  if (targeted && shoot) {
    Shoot();
  }
}
