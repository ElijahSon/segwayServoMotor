//#include <Arduino.h> // unused, student controller is not specifc to arduino cards
#include "student_controller.h"
#include <stdio.h>
//#define TEST_WITH_VISUAL_STUDIO_CODE
//---------------------------------------------------------------
// STUDENT WORK :
// YOU CAN FREELY MODIFY THE CONTENTS (BUT NOT THE DECLARATIONS)
// OF THE 3 FOLLOWING FUNCTIONS
// AND ALSO THE STRUCTURE TYPE : struct_control
// DO NOT USE GLOBAL VARIABLES OTHER THAN s
//---------------------------------------------------------------
//1 - Structure containing control coeffs, states, ...
typedef struct
{
    uint8_T id; // controller number
    int count;
    float Tech; // sample time in seconds
// add the fields you want in this structure type 
} struct_control;
#define NB_MAX_CONTROLLER 5
struct_control student_controller[NB_MAX_CONTROLLER];
//2 - controller fields initialization
void student_init_control(struct_control *s, float Tech,int id)
{
    // here you have to init state controllers coeffs and state
    s->count = -10; // just an example, init number of control steps
    s->Tech=Tech;
    s->id =id; // id is the controller number, and can be used to program different controllers
}
//3 - controller output updating at each sample step
float student_update_control(struct_control *s, float consigne, float mesure)
{
    float command;
    // here you have to compute the new control command described in s
    printf("salut \n");
    s->count++; // just an example, increment number of control steps..
    command = s->count ;
    return command;
}
//4 - controller termination (freeing ressources , ...)
void student_finish_control(struct_control *s)
{
    // here you have to release the ressources used by controller s;
}
//---------------------------------------------------------------
// END OF STUDENT WORK
// MATLAB WRAPPER TO STUDENT FUNCTIONS: DO NOT MODIFY 
//---------------------------------------------------------------

extern "C" void matlab_setup_control(float sample_time_second, uint8_T id)
{
    student_init_control(&student_controller[id], sample_time_second,id);
}
extern "C" float matlab_update_control(float consigne, float mesure, uint8_T id)
{
    return student_update_control(&student_controller[id], consigne, mesure);
}
extern "C" void matlab_finish_control(uint8_T id)
{
    student_finish_control(&student_controller[id]);
}

#ifdef TEST_WITH_VISUAL_STUDIO_CODE
// unused by matlab
void setup()
{
    // You can use Serial2 instead of Serial 
    // With Usb ttl Serial Adapter WHITE WIRE connected to PIN 16 (tx2)of due
    Serial.begin(115200);

}

void loop()
{
    while (1)
    {
        Serial.print("a vous de savoir ce que vous voulez afficher");
        Serial.println("");
        delay(500);
    }
    // unused
}
#endif