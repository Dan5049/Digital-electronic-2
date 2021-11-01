EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_UNO_R3 A?
U 1 1 617988E7
P 3950 4050
F 0 "A?" H 3950 5231 50  0000 C CNN
F 1 "Arduino_UNO_R3" H 3950 5140 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3" H 3950 4050 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 3950 4050 50  0001 C CNN
	1    3950 4050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 61799A9C
P 2200 5350
F 0 "SW?" H 2200 5635 50  0000 C CNN
F 1 "SW_Push" H 2200 5544 50  0000 C CNN
F 2 "" H 2200 5550 50  0001 C CNN
F 3 "~" H 2200 5550 50  0001 C CNN
	1    2200 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 6179A0BC
P 3250 5450
F 0 "D?" V 3289 5332 50  0000 R CNN
F 1 "LED" V 3198 5332 50  0000 R CNN
F 2 "" H 3250 5450 50  0001 C CNN
F 3 "~" H 3250 5450 50  0001 C CNN
	1    3250 5450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6179A891
P 3250 5000
F 0 "R?" H 3180 4954 50  0000 R CNN
F 1 "1k" H 3180 5045 50  0000 R CNN
F 2 "" V 3180 5000 50  0001 C CNN
F 3 "~" H 3250 5000 50  0001 C CNN
	1    3250 5000
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 6179F586
P 2150 4950
F 0 "SW?" H 2150 5235 50  0000 C CNN
F 1 "SW_Push" H 2150 5144 50  0000 C CNN
F 2 "" H 2150 5150 50  0001 C CNN
F 3 "~" H 2150 5150 50  0001 C CNN
	1    2150 4950
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 6179F7B1
P 2150 4550
F 0 "SW?" H 2150 4835 50  0000 C CNN
F 1 "SW_Push" H 2150 4744 50  0000 C CNN
F 2 "" H 2150 4750 50  0001 C CNN
F 3 "~" H 2150 4750 50  0001 C CNN
	1    2150 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6179FB8E
P 3950 5950
F 0 "#PWR?" H 3950 5700 50  0001 C CNN
F 1 "GND" H 3955 5777 50  0000 C CNN
F 2 "" H 3950 5950 50  0001 C CNN
F 3 "" H 3950 5950 50  0001 C CNN
	1    3950 5950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 617A03D8
P 4150 2750
F 0 "#PWR?" H 4150 2600 50  0001 C CNN
F 1 "VCC" H 4165 2923 50  0000 C CNN
F 2 "" H 4150 2750 50  0001 C CNN
F 3 "" H 4150 2750 50  0001 C CNN
	1    4150 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3050 4150 2750
Wire Wire Line
	3850 5150 3850 5300
Wire Wire Line
	3850 5300 3950 5300
Wire Wire Line
	4050 5300 4050 5150
Wire Wire Line
	3950 5150 3950 5300
Connection ~ 3950 5300
Wire Wire Line
	3950 5300 4050 5300
Wire Wire Line
	3950 5300 3950 5700
Wire Wire Line
	3450 4750 3250 4750
Wire Wire Line
	3250 4750 3250 4850
Wire Wire Line
	3250 5150 3250 5300
Wire Wire Line
	3250 5600 3250 5700
Wire Wire Line
	3250 5700 3950 5700
Connection ~ 3950 5700
Wire Wire Line
	3950 5700 3950 5950
Wire Wire Line
	3450 4650 2950 4650
Wire Wire Line
	2950 4650 2950 5350
Wire Wire Line
	2950 5350 2400 5350
Wire Wire Line
	3450 4550 2700 4550
Wire Wire Line
	2700 4550 2700 4950
Wire Wire Line
	2700 4950 2350 4950
Wire Wire Line
	3450 4450 2550 4450
Wire Wire Line
	2550 4450 2550 4550
Wire Wire Line
	2550 4550 2350 4550
Wire Wire Line
	3250 5700 1850 5700
Wire Wire Line
	1850 5700 1850 5350
Wire Wire Line
	1850 4550 1950 4550
Connection ~ 3250 5700
Wire Wire Line
	1950 4950 1850 4950
Connection ~ 1850 4950
Wire Wire Line
	1850 4950 1850 4550
Wire Wire Line
	2000 5350 1850 5350
Connection ~ 1850 5350
Wire Wire Line
	1850 5350 1850 4950
$Comp
L Display_Character:LM16255K U?
U 1 1 617A40CF
P 2200 2450
F 0 "U?" V 2250 1550 50  0000 R CNN
F 1 "HD44780" V 2150 1550 50  0000 R CNN
F 2 "Display:LM16255" H 2200 1650 50  0001 C CNN
F 3 "http://pdf.datasheetcatalog.com/datasheet/Sharp/mXvtrzw.pdf" H 2300 2350 50  0001 C CNN
	1    2200 2450
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 617A5D0E
P 1400 2400
F 0 "#PWR?" H 1400 2250 50  0001 C CNN
F 1 "VCC" H 1415 2573 50  0000 C CNN
F 2 "" H 1400 2400 50  0001 C CNN
F 3 "" H 1400 2400 50  0001 C CNN
	1    1400 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2450 1400 2450
Wire Wire Line
	1400 2450 1400 2400
$Comp
L power:GND #PWR?
U 1 1 617A67FB
P 1800 2950
F 0 "#PWR?" H 1800 2700 50  0001 C CNN
F 1 "GND" H 1805 2777 50  0000 C CNN
F 2 "" H 1800 2950 50  0001 C CNN
F 3 "" H 1800 2950 50  0001 C CNN
	1    1800 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 617A75A6
P 3050 2550
F 0 "#PWR?" H 3050 2300 50  0001 C CNN
F 1 "GND" H 3055 2377 50  0000 C CNN
F 2 "" H 3050 2550 50  0001 C CNN
F 3 "" H 3050 2550 50  0001 C CNN
	1    3050 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2950 1800 2850
Wire Wire Line
	3050 2550 3050 2450
Wire Wire Line
	3050 2450 2900 2450
Wire Wire Line
	3450 4150 2700 4150
Wire Wire Line
	2700 4150 2700 2850
Wire Wire Line
	3450 4050 2600 4050
Wire Wire Line
	2600 4050 2600 2850
Wire Wire Line
	3450 3950 2500 3950
Wire Wire Line
	2500 3950 2500 2850
Wire Wire Line
	3450 3850 2400 3850
Wire Wire Line
	2400 3850 2400 2850
Wire Wire Line
	1700 2850 1700 3650
Wire Wire Line
	1700 3650 3450 3650
Wire Wire Line
	3450 3750 1900 3750
Wire Wire Line
	1900 3750 1900 2850
NoConn ~ 2000 2050
NoConn ~ 2000 2850
NoConn ~ 2100 2850
NoConn ~ 2200 2850
NoConn ~ 2300 2850
$EndSCHEMATC