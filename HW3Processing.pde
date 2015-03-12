/* Created by: Dawn Christine P. Corpuz
 CIE 150 Homework 3
 */

import processing.serial.*;

Serial myPort;  
int  val; 
float distance;  

void setup() 
{
  size(400, 220);
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  if ( myPort.available() > 3) {     
  if ( myPort.read() == 0xaa) {
    val =  (myPort.read()<< 8) | (myPort.read()) ;
      }
       myPort.clear();
     }
  distance=(val/2000.0)*346.4;

  background(235, 150, 130);    

  fill(70, 210, 207);
  textFont(createFont("Lobster Two", 25));
  text("Duration:", 30, 80);
  text("Distance:", 30, 150);
  
  fill(250);
  textFont(createFont("Bebas Neue", 50));
  text( val/2 + " us", 125, 85);
  text( distance +" mm", 125, 155);
}

/* Arduino Code

int vcc = 8;
int trig = 9;
int echo = 10;
int gnd1 = 11;
int gnd2 = 12;
int dur = 1;
int dis;
int to = 25000;

void setup() {
  Serial.begin(9600);
  pinMode(vcc,OUTPUT);
  pinMode(trig,OUTPUT);
  pinMode(echo,INPUT);
  pinMode(gnd1,OUTPUT);
  pinMode(gnd2,OUTPUT);
  digitalWrite(vcc,HIGH);
  digitalWrite(gnd1,LOW);
  digitalWrite(gnd2,LOW);
  digitalWrite(trig,0);
}

void loop(){
  digitalWrite(trig,0);
  delay(100); 
  digitalWrite(trig,HIGH);
  delayMicroseconds(10);
  digitalWrite(trig,LOW);
  dur = pulseIn(echo,1,to); 
  
  Serial.write(0xaa);
  Serial.write((dur >> 8) & 0xff);
  Serial.write(dur & 0xff);
  

}
*/

