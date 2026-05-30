# Segway Control by using a mpu6050: just the gyro,  2 FIT0450U engines

Segway Control by using a mpu6050: just the gyro,  2 FIT0450U engines
        an 5V power bank

## Problems
 - reminder/pb: think about drawing power on the power supply 
 - unexplained resonance at 10 Hz, probably due to the gyro
 - delay of 15ms in the model
 - 0.5V dead zone on the motors
 
## Symbolic calculation of a dynamic model in rectilinear displacement
  (only in rectilinear movement, in the corresponding folder)
   
### program 1: calculates the control using straight displacement, without using the engine encoders
 program  : segway_rect_ygorra_H2.m
 Schema of simu: schSegwaySimuH2.slx
 Schema arduino : schSegwayH2Arduino.slx
  
### program 2: calculates the control during rectilinear displacement by using the motor encoders, + rotational servo-system
 program  : segway_rect_ygorra_H2_with_thm. m
 Schema of simu: schSegwaySimuH2_with_thm.slx
 Arduino Schema : schSegwayH2Arduino_with_thm.slx

 ## Tools
- MATLAB
- Simulink
- Arduino
- VS CODE
