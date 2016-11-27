/*
 * limbitless_v3
 *
 * Title: Limbitless v3
 * Author: Tyler Petresky <tylerpetresky.com>, Benny Godlin
 * Date: 7-14
 *
 * Desc: Basic code to allow the actuation a servo (closing of
 *       a prosthetic hand) based on sensor.
 *       The hand should open or close analog to sensor reading.
 *       The FSR (force sensitive resistor) is between an A2D pin
 *       and Vcc, the A2D pin is pulled up by 10K-47K resistor.
 */

#include <Servo.h>

// set to 1 if the angle of the servo is reversed: 
#define REVERSE_SERVO 1

// set to 1 to try to detach servo when
//   at rest (new_pos <= MIN_ANG) to save battery power
#define DETACH_SERVO_AT_REST 1

// Servo PWR pin
//#define SERVO_PWR 10

// Digital pin for servo motor
const int servo_pin = 3;
// Analog pin for the muscle sensor or FSR
const int sensor_pin = A2;

/* - UNUSED
// Threshold value that allows the hand to open and close.
// The scaled value of the muscle sensor's value is compared
// to this threshold value.
// Sample 6-year old was 20.0, Adult was 100.0
// float toggle_threshold = 60.0;
*/

// Servo object
Servo servo;

// Its max and min angles:
const int MIN_ANG = 27;  // 36; // 18; // 45;
const int MAX_ANG = 153; // 179; // 135;

// Timer used to allow the muscle to relax before toggling the
// hand. Prevents toggling too quickly.
int servo_timer = 0;

const int step_mS = 10;
const int step_ang = 18; // 9; 3;

// Delay in each loop():
const int loop_delay = 10;
const int detach_delay = 10;

// Time in mS between servo moves:
const int timer_threshold = 50; //100;

bool servo_attached = false;
int old_pos = MIN_ANG;


// Sets up the system. Runs once on startup.
void setup()
{
  // Uncomment this for calibration purposes.
  Serial.begin(9600);
  
  pinMode(sensor_pin, INPUT);
  
#ifdef SERVO_PWR
  pinMode(SERVO_PWR, OUTPUT);
  digitalWrite(SERVO_PWR, HIGH);
#endif
  
  // Assign the servo to it's respective pin
  pinMode(servo_pin, OUTPUT);
  servo.attach(servo_pin);
  servo_attached = true;
  
  // Set default angle of servo as opened
  servo.write(old_pos);

  Serial.println("RST");
}

void loop()
{
  // Raw value of the muscle sensor reading
  float sensor_value = analogRead(sensor_pin);
  
  // Muscle sensor value scaled to min_
  int sensor_scaled = sensor_value * (MAX_ANG / 1024.0);
  if (sensor_value > 1020.0) 
    sensor_scaled = MAX_ANG;
  if (sensor_value < 20.0) 
    sensor_scaled = MIN_ANG;
    
  // Remove these before deployment.
  // Uncomment for calibration purposes.
  // To calibrate, have the person of interest 
  // flex the desired muscle and watch where the
  // value of sensor_scaled peaks. Afterwards,
  // change the value of toggle_threshold accordingly.
  
  // To start movement, the timer should reach at it's max value.
  if (/*sensor_scaled >= toggle_threshold &&*/ servo_timer >= timer_threshold)
  {
#if REVERSE_SERVO
    int new_pos = 180 - sensor_scaled; // should be 0..180
#else
    int new_pos = sensor_scaled; // should be 0..180
#endif
    Serial.print("Sensor:");
    Serial.print(sensor_value);
    Serial.print(", new_pos:");
    Serial.print(new_pos);
    Serial.print(", ServoTime:"); //"\tServoTimer: ");
    Serial.println(servo_timer); 

#if DETACH_SERVO_AT_REST
    // Save power when servo not needed:
    if (new_pos == old_pos) {
      // deactivate servo if angle <= MIN_ANG (hand is open):
#if REVERSE_SERVO
      if (new_pos >= MAX_ANG) {
#else
      if (new_pos <= MIN_ANG) {
#endif        
        delay(detach_delay);
        servo.detach();
        //digitalWrite(servo_pin, LOW);
#ifdef SERVO_PWR        
        digitalWrite(SERVO_PWR, LOW);
#endif        
        servo_attached = false;
        delay(detach_delay);
      }
    }
    // activate servo if angle > MIN_ANG:
    else if (!servo_attached &&
#if REVERSE_SERVO
      (new_pos < MAX_ANG)
#else
      (new_pos > MIN_ANG)
#endif            
    ) {
#ifdef SERVO_PWR        
      digitalWrite(SERVO_PWR, HIGH);      
#endif
      servo.attach(servo_pin);
      servo_attached = true;
      delay(detach_delay);
    }
#endif

    if (servo_attached) {
      //servo.write(new_pos);

      if (new_pos < old_pos) {
        for(int pos = old_pos; pos > new_pos; pos -= step_ang)
        { // Closes the hand by gradually adjusting the written angle.     
          servo.write(pos);
          delay(step_mS);
        }
      } else if (new_pos > old_pos) {
        for(int pos = old_pos; pos < new_pos; pos += step_ang) 
        { // Opens the hand by gradually adjusting the written angle.           
          servo.write(pos);
          delay(step_mS);
        }
      }
      servo.write(new_pos); // reach the new pos
    } // servo_attached

    /*
    int servo_pulse_ms = servo.readMicroseconds();
    Serial.print("pulse:");
    Serial.println(servo_pulse_ms);
    */
    
    old_pos = new_pos;
    // Reset the timer
    servo_timer = 0;
  }
  
  // Don't allow the servo_timer to get too big. Overflow errors
  // crash the Arduino.
  if (servo_timer < timer_threshold)
    servo_timer += loop_delay;
  
  // Delay for the servo. Don't want to overload it.
  delay(loop_delay);
}
