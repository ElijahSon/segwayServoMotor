#include <Arduino.h>
#include "rtwtypes.h"
//#define TEST_WITH_VISUAL_STUDIO_CODE
#define SERIAL_COMMAND_MASK 0x3F
#define SERIAL_CONTROL_BYTE_DATA 0x80
#define SERIAL_READ_DATA 4
#define SERIAL_IDLE 0
union byte4_serial {
  // unsigned
  uint8_t ui_8[4];
  uint16_t ui_16[2];
  uint32_t ui_32;
  // signed
  int8_t i_8[4];
  int16_t i_16[2];
  int32_t i_32;
  // float
  float f;
};
typedef struct
{
  uint8_t id;
  float last_measure;
  int32_t count_measure;
  int32_t count; 
  uint8_t nbSerialData;  
  int serialState;
  byte4_serial data;
  uint8_t current;
} structSerial;
#define NB_MAX_SERIAL 4

structSerial serials[NB_MAX_SERIAL];
extern "C" void setupSerialMeasure(uint8_T id, uint32_T baudRate)
{
  if (id >= NB_MAX_SERIAL)
  {
    return;
  }
  serials[id].id = id; // unusable
  serials[id].last_measure = 0.0;
  serials[id].serialState = SERIAL_IDLE;
  serials[id].count=-1;
  serials[id].count_measure=-1;
  
  switch (id)
  {
  case 0:
    Serial.begin(baudRate);
    break;
  case 1:
    Serial1.begin(baudRate);
    break;
  case 2:
    Serial2.begin(baudRate);
    break;
  case 3:
    Serial3.begin(baudRate);
    break;
  }
}
extern "C" void finishSerialMeasure(uint8_T id){
  // nothing to do for instance
}
extern "C" float getSerialMeasure(uint8_T id)
{
  structSerial *s = &(serials[id]);
  s->count++;
  uint8_t inChar, bits;
  int value;
  switch (s->id)
  { // read next value
  case 0:
    value = Serial.read();
    break;
  case 1:
    value = Serial1.read();
    break;
  case 2:
    value = Serial2.read();
    break;
  case 3:
    value = Serial3.read();
    break;
    default :value=-1;
  }                  // while (value > = 0)
  while (value >= 0) // data is ok if value >=0
  {
    inChar = lowByte(value);
    if ((inChar & SERIAL_CONTROL_BYTE_DATA) != 0)
    { // data read command on bit 6-0
      s->nbSerialData = ((inChar & SERIAL_COMMAND_MASK) >> 4);
      s->current = 0;
      s->serialState = SERIAL_READ_DATA;
      // init MSB'S of each data byte with low bits of command
      bits = inChar & 0x0F;
      for (int i = 0; i < s->nbSerialData; i++)
      {
        s->data.ui_8[i] = (bits & 0x01) << 7;
        bits = bits >> 1;
      }
    }
    else if (s->serialState == SERIAL_READ_DATA)
    { // read nbdata data
      s->data.ui_8[s->current] |= inChar;
      s->current++;
      if (s->current == s->nbSerialData)
      {
        if (s->nbSerialData == 2)
        {
          s->last_measure = (float)(s->data.i_16[0]);

        }
        else if (s->nbSerialData == 4)
        {
          s->last_measure = s->data.f;
        }
        s->count_measure=s->count;
        s->serialState = SERIAL_IDLE;
      }
    }
    // read next value
    switch (s->id)
    {
    case 0:
      value = Serial.read();
      break;
    case 1:
      value = Serial1.read();
      break;
    case 2:
      value = Serial2.read();
      break;
    case 3:
      value = Serial3.read();
      break;
    }
  } // while (value > = 0)
  return (s->last_measure);
}

#ifdef TEST_WITH_VISUAL_STUDIO_CODE
void setup()
{
  setupSerialMeasure(2, 115200);
  Serial.begin(115200);

}

void loop()
{
  int32_t last_count=0 ;
  while (1)
  {
    getSerialMeasure(2);
    if (serials[2].count_measure!=last_count) {
      last_count=serials[2].count_measure;
      Serial.print("count:");Serial.print(serials[2].count_measure);
      Serial.print("value:");Serial.println(serials[2].last_measure);
    } 
    delay(10);
  }
}
#endif