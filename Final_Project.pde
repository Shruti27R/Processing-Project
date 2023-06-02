
import processing.serial.*;

Serial arduinoPort; 
String message = "";
Integer sensorVal = 0;
void setup() {
  size(800,600); //size of canvas
  
  String[] ports = Serial.list();
  printArray(ports);
  // my Arduino is port #3
  String portName = ports[3];
  arduinoPort = new Serial(this, portName, 9600);
  arduinoPort.bufferUntil(10);
  stroke(0);
  fill(0);
}

void draw() {
  background(255);
  float c = map(sensorVal, 0, width, 0, 400);
  float d = map(sensorVal, 0, width, 40,500);
  noStroke();
  //center circle
  fill(c, 255, 0);
  ellipse(width/2, height/2, d, d);
  
  //corner circles
  fill(255, c, 0);
 ellipse (100, 100, d, d);
  ellipse (700, 500, d, d);
  ellipse (100, 500, d, d);
  ellipse (700, 100, d, d);
  
}

void serialEvent(Serial port) {
  message = port.readStringUntil(10);
  
  try {
    message = trim(message);
    sensorVal = Integer.parseInt(message);
  } catch (Exception ex) {
    
    println("message = " + message);
    println(ex);
  }
}
