
char data = 0;  
 int maxLevel=100;
 int level=100;
 int distValue=150;
const int switchPin=7;
const int trigPin1 = 11;
const int echoPin1 = 12;
const int led1=10;
const int trigPin2 = 3;
const int echoPin2 = 2;
const int led2=5;
boolean lastButton=LOW;
boolean currentButton=LOW;   
boolean power=false;
boolean mode=true;  
   // defines variables

long duration1;
int distance1;
long duration2;
int distance2;
String buff="";


boolean antiBounce(boolean last){
  
  boolean current=digitalRead(switchPin);
  
    if(last!=current){
        delay(5); 
        current==digitalRead(switchPin);
      }
      return current;
    
 
  
  }


  void powerOFF(){
    digitalWrite(led1,LOW);
    digitalWrite(led2,LOW);
    }

void ultra(int trigPin,int echoPin,int led,int distance,long duration,String dist,int level){
  
  // Clears the trigPin
digitalWrite(trigPin, LOW);
delayMicroseconds(2);
// Sets the trigPin on HIGH state for 10 micro seconds
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
// Reads the echoPin, returns the sound wave travel time in microseconds
duration = pulseIn(echoPin, HIGH);
// Calculating the distance
distance= duration*0.034/2;
// Prints the distance on the Serial Monitor
Serial.print(dist);
Serial.println(distance);
if(distance <=distValue){

 level= map(distance, 0, distValue,maxLevel,0);
  analogWrite(led,level);

  
  delay(50);
 
  }else{
    
  digitalWrite(led,LOW);
  delay(50);

  }
  
  }

int cases(String da){
buff=""; 
  if(da.equals("0,")){
     power=false;
      powerOFF();
      return;
    }
  
  else if(da.equals("1,"
  )){
     power=true;
     return;
    }
    else if(da[0]=='L'){

       
         maxLevel=da.substring(1,da.length() - 1 ).toInt();
         Serial.print("level is set to: ");
         Serial.println(level);
       return; 
     }
     else if(da[0]=='D'){
      distValue=da.substring(1,da.length() - 1 ).toInt();
        Serial.print("Distance is set to: ");
        Serial.println(distValue);
       return; 
      }  
     else if(da[0]=='V'){
       Serial.println(da.substring(1,da.length() - 1 ));
      
      }

 
  }
void setup() {
pinMode(switchPin, INPUT); // Sets the trigPin as an Output
pinMode(trigPin1, OUTPUT); // Sets the trigPin as an Output
pinMode(echoPin1, INPUT); // Sets the echoPin as an Input
 pinMode(led1, OUTPUT);
 digitalWrite(led1,LOW);
 pinMode(trigPin2, OUTPUT); // Sets the trigPin as an Output
pinMode(echoPin2, INPUT); // Sets the echoPin as an Input
 pinMode(led2, OUTPUT);
 digitalWrite(led2,LOW);
Serial.begin(9600); // Starts the serial communication

}

void loop() {



currentButton=antiBounce(lastButton);
//Serial.println(currentButton);
if(lastButton==LOW && currentButton==HIGH ){  
power=!power;
}

lastButton=currentButton;


if(Serial.available() > 0)  // Send data only when you receive data:
    {
      delay(10);
  data = Serial.read();      //Read the incoming data and store it into variable data
  
  buff+=data;
    
  if(data==','){
    cases(buff);
    buff="";
  }
 }                     



   
if(power){  

 ultra(trigPin2,echoPin2,led2,distance2,duration2,"distance2:",level);
 ultra(trigPin1,echoPin1,led1,distance1,duration1,"distance1:",level);

  }else{
    
    powerOFF();
    }
}
