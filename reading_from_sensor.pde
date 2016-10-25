import processing.serial.*;

Serial mySerialPort;       // Create object from Serial class
String serialPortData;     // Data received from the serial port
int valueOfSensor;

int time;
int wait = 5000;

void setup(){
  size(600,800);
  background(255);
  String portName = Serial.list()[2];  //change the 0 to a 1 or 2 etc. to match your port
  mySerialPort = new Serial(this, portName, 9600); 
  valueOfSensor = 0;
  
  time = millis();
}

void draw(){
  
  
  if ( mySerialPort.available() > 0) 
  {  // If data is available,
    serialPortData = mySerialPort.readStringUntil('\n');         // read it and store it in val
  } 
  
  println(serialPortData);
  
  if(millis() - time >= wait){
     if(serialPortData != null){
       valueOfSensor = int(trim(serialPortData));
       //println(valueOfSensor);
     }
 
      if(valueOfSensor < 350){
          ellipse(56, 46, valueOfSensor, valueOfSensor);
          //redraw();
       }
    }else{
  }
}