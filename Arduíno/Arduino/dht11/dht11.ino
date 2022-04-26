#include <DHT.h>
#include <DHT_U.h>

#include <Adafruit_Sensor.h>

#include <DHT.h>
#include <DHT_U.h>

#include "DHT.h"
 
#define DHTPIN A1 // pino que estamos conectado
#define DHTTYPE DHT11 // DHT 11
 
// Conecte pino 1 do sensor (esquerda) ao +5V
// Conecte pino 2 do sensor ao pino de dados definido em seu Arduino
// Conecte pino 4 do sensor ao GND
// Conecte o resistor de 10K entre pin 2 (dados) 
// e ao pino 1 (VCC) do sensor


DHT dht(DHTPIN, DHTTYPE);
int pinosensor=A1;
void setup() 
{
  pinMode(pinosensor,INPUT);
  Serial.begin(9600);
  Serial.println("DHTxx test!");
  dht.begin();
}
 
void loop() 
{
  // A leitura da temperatura e umidade pode levar 250ms!
  // O atraso do sensor pode chegar a 2 segundos.
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  // testa se retorno é valido, caso contrário algo está errado.
  if (isnan(t) || isnan(h)) 
  {
    Serial.println("Failed to read from DHT");
  } 
  else
  {
    //Serial.print("Umidade: ");
    Serial.print(h);
    Serial.print(";");
   // Serial.print("Temperatura: ");
    Serial.print(t);
    Serial.print(";");
   //Serial.println();
  }
int sensorPin=A0;
int sensorValue=0;

int sensorLM35 = A5;
float valorLM35 = analogRead(sensorLM35);
delay(100);
valorLM35 = analogRead(sensorLM35);
float temperatura = valorLM35*0.00488;
temperatura*=100;

//void loop(){
  sensorValue = analogRead(sensorPin);
  Serial.print(sensorValue);
  Serial.print(";");
  Serial.print(temperatura);
  Serial.print(";");


if (digitalRead(pinosensor)== LOW)
{
Serial.println("1");
}

else
{
Serial.println("0");
}

delay(1000);

  
  }  
//}
