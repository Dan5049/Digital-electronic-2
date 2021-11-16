EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1550 4300 0    50   Input ~ 0
PWM2
Text GLabel 2000 4500 0    50   Input ~ 0
PWM0
Text GLabel 2000 4600 0    50   Input ~ 0
PWM0
Text GLabel 1550 5100 0    50   Input ~ 0
PWM2
Text GLabel 1550 4900 0    50   Input ~ 0
PWM1
Text GLabel 2000 4900 0    50   Input ~ 0
PWM1
Text GLabel 3600 4600 2    50   Input ~ 0
ADC
Text GLabel 3600 4700 2    50   Input ~ 0
ADC
Text GLabel 3600 4800 2    50   Input ~ 0
ADC
Text GLabel 3600 4900 2    50   Input ~ 0
ADC
Text GLabel 4050 4900 2    50   Input ~ 0
ADC
Text GLabel 4050 5100 2    50   Input ~ 0
ADC
Text GLabel 2000 4000 0    50   Input ~ 0
UART
Text GLabel 2000 4100 0    50   Input ~ 0
UART
Text GLabel 3600 5300 2    50   Input ~ 0
I2C
Text GLabel 3600 5400 2    50   Input ~ 0
I2C
Text GLabel 4050 5000 2    50   Input ~ 0
I2C
Text GLabel 4050 5200 2    50   Input ~ 0
I2C
Text GLabel 2000 5300 0    50   Input ~ 0
SPI
Text GLabel 2000 5200 0    50   Input ~ 0
SPI
Text GLabel 1550 5000 0    50   Input ~ 0
SPI
Text GLabel 1550 5200 0    50   Input ~ 0
SPI
Text GLabel 1950 4200 0    50   Input ~ 0
INT
Text GLabel 1550 4400 0    50   Input ~ 0
INT
Wire Wire Line
	2250 4300 1750 4300
Wire Wire Line
	2250 4500 2000 4500
Wire Wire Line
	2250 4600 2000 4600
Wire Wire Line
	2250 4900 2000 4900
Wire Wire Line
	2250 5100 1750 5100
Wire Wire Line
	3250 4600 3600 4600
Wire Wire Line
	3250 4700 3600 4700
Wire Wire Line
	3250 4800 3600 4800
Wire Wire Line
	3250 4900 3600 4900
Wire Wire Line
	3250 5000 3900 5000
Wire Wire Line
	3900 5000 3900 4900
Wire Wire Line
	3900 4900 4050 4900
Wire Wire Line
	3250 5100 3900 5100
Wire Wire Line
	2250 4000 2000 4000
Wire Wire Line
	2250 4100 2000 4100
Wire Wire Line
	3250 5300 3600 5300
$Comp
L MCU_Module:Arduino_UNO_R3 A1
U 1 1 618C071E
P 2750 4600
F 0 "A1" H 2750 5781 50  0000 C CNN
F 1 "Arduino_UNO_R3" H 2750 5690 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3" H 2750 4600 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 2750 4600 50  0001 C CNN
	1    2750 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 5400 3600 5400
Wire Wire Line
	3900 5000 4050 5000
Connection ~ 3900 5000
Wire Wire Line
	3900 5100 3900 5200
Wire Wire Line
	3900 5200 4050 5200
Connection ~ 3900 5100
Wire Wire Line
	3900 5100 4050 5100
Wire Wire Line
	1550 5200 1750 5200
Wire Wire Line
	1750 5200 1750 5100
Connection ~ 1750 5100
Wire Wire Line
	1750 5100 1550 5100
Wire Wire Line
	2000 5200 2250 5200
Wire Wire Line
	2000 5300 2250 5300
Wire Wire Line
	1950 4200 2250 4200
Wire Wire Line
	1550 4400 1750 4400
Wire Wire Line
	1750 4400 1750 4300
Connection ~ 1750 4300
Wire Wire Line
	1750 4300 1550 4300
$Sheet
S 1750 1550 1200 550 
U 618C7E81
F0 "Sheet618C7E80" 50
F1 "file618C7E80.sch" 50
$EndSheet
Wire Wire Line
	1550 5000 1650 5000
Wire Wire Line
	1550 4900 1650 4900
Wire Wire Line
	1650 4900 1650 5000
Connection ~ 1650 5000
Wire Wire Line
	1650 5000 2250 5000
$EndSCHEMATC
