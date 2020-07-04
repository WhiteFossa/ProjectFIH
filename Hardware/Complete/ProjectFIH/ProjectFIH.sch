EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A0 46811 33110
encoding utf-8
Sheet 1 1
Title "Project FIH"
Date "2020-07-01"
Rev "1"
Comp "by White Fossa"
Comment1 "AGPL"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Amplifier_Operational:LM358 U1
U 1 1 5EFC7447
P 2900 2500
F 0 "U1" H 2900 2133 50  0000 C CNN
F 1 "LM158" H 2900 2224 50  0000 C CNN
F 2 "" H 2900 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 2900 2500 50  0001 C CNN
	1    2900 2500
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:LM358 U1
U 3 1 5EFC827B
P 1300 1100
F 0 "U1" H 1258 1146 50  0000 L CNN
F 1 "LM158" H 1258 1055 50  0000 L CNN
F 2 "" H 1300 1100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 1300 1100 50  0001 C CNN
	3    1300 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5EFCC330
P 2400 2100
F 0 "R2" H 2470 2146 50  0000 L CNN
F 1 "16k" H 2470 2055 50  0000 L CNN
F 2 "" V 2330 2100 50  0001 C CNN
F 3 "~" H 2400 2100 50  0001 C CNN
	1    2400 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5EFCC8C6
P 3400 2800
F 0 "R3" H 3470 2846 50  0000 L CNN
F 1 "10k" H 3470 2755 50  0000 L CNN
F 2 "" V 3330 2800 50  0001 C CNN
F 3 "~" H 3400 2800 50  0001 C CNN
	1    3400 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5EFCCDFD
P 3400 3200
F 0 "R4" H 3470 3246 50  0000 L CNN
F 1 "130k" H 3470 3155 50  0000 L CNN
F 2 "" V 3330 3200 50  0001 C CNN
F 3 "~" H 3400 3200 50  0001 C CNN
	1    3400 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2500 3400 2500
Wire Wire Line
	3400 2500 3400 2650
Wire Wire Line
	3400 2950 3400 3000
Wire Wire Line
	2600 2400 2400 2400
Wire Wire Line
	2400 2400 2400 2250
Wire Wire Line
	2400 2400 2400 3000
Wire Wire Line
	2400 3000 3400 3000
Connection ~ 2400 2400
Connection ~ 3400 3000
Wire Wire Line
	3400 3000 3400 3050
Wire Wire Line
	2400 1850 2400 1950
$Comp
L power:GND #PWR05
U 1 1 5EFE02C9
P 3400 3450
F 0 "#PWR05" H 3400 3200 50  0001 C CNN
F 1 "GND" H 3405 3277 50  0000 C CNN
F 2 "" H 3400 3450 50  0001 C CNN
F 3 "" H 3400 3450 50  0001 C CNN
	1    3400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3450 3400 3350
$Comp
L power:+5V #PWR04
U 1 1 5EFE0FC8
P 2400 1850
F 0 "#PWR04" H 2400 1700 50  0001 C CNN
F 1 "+5V" H 2415 2023 50  0000 C CNN
F 2 "" H 2400 1850 50  0001 C CNN
F 3 "" H 2400 1850 50  0001 C CNN
	1    2400 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 5EFE177B
P 1200 700
F 0 "#PWR08" H 1200 550 50  0001 C CNN
F 1 "+5V" H 1215 873 50  0000 C CNN
F 2 "" H 1200 700 50  0001 C CNN
F 3 "" H 1200 700 50  0001 C CNN
	1    1200 700 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5EFE1E72
P 1200 1500
F 0 "#PWR09" H 1200 1250 50  0001 C CNN
F 1 "GND" H 1205 1327 50  0000 C CNN
F 2 "" H 1200 1500 50  0001 C CNN
F 3 "" H 1200 1500 50  0001 C CNN
	1    1200 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 800  1200 700 
$Comp
L Device:CP C2
U 1 1 5EFE3336
P 900 1100
F 0 "C2" H 1018 1146 50  0000 L CNN
F 1 "100uF" H 1018 1055 50  0000 L CNN
F 2 "" H 938 950 50  0001 C CNN
F 3 "~" H 900 1100 50  0001 C CNN
	1    900  1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5EFE4062
P 900 1500
F 0 "#PWR07" H 900 1250 50  0001 C CNN
F 1 "GND" H 905 1327 50  0000 C CNN
F 2 "" H 900 1500 50  0001 C CNN
F 3 "" H 900 1500 50  0001 C CNN
	1    900  1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5EFE46B1
P 900 700
F 0 "#PWR06" H 900 550 50  0001 C CNN
F 1 "+5V" H 915 873 50  0000 C CNN
F 2 "" H 900 700 50  0001 C CNN
F 3 "" H 900 700 50  0001 C CNN
	1    900  700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  950  900  700 
Wire Wire Line
	900  1250 900  1500
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5EFE5C5A
P 1900 1100
F 0 "J1" H 1962 1144 50  0000 L CNN
F 1 "Conn_01x02_Male" H 1650 900 50  0000 L CNN
F 2 "" H 1900 1100 50  0001 C CNN
F 3 "~" H 1900 1100 50  0001 C CNN
	1    1900 1100
	-1   0    0    1   
$EndComp
Wire Wire Line
	1200 1500 1200 1400
$Comp
L power:GND #PWR011
U 1 1 5EFEE96F
P 1650 1150
F 0 "#PWR011" H 1650 900 50  0001 C CNN
F 1 "GND" H 1655 977 50  0000 C CNN
F 2 "" H 1650 1150 50  0001 C CNN
F 3 "" H 1650 1150 50  0001 C CNN
	1    1650 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 5EFEF193
P 1650 950
F 0 "#PWR010" H 1650 800 50  0001 C CNN
F 1 "+5V" H 1665 1123 50  0000 C CNN
F 2 "" H 1650 950 50  0001 C CNN
F 3 "" H 1650 950 50  0001 C CNN
	1    1650 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 950  1650 1000
Wire Wire Line
	1650 1000 1700 1000
Wire Wire Line
	1700 1100 1650 1100
Wire Wire Line
	1650 1100 1650 1150
Text Notes 2450 2000 0    50   ~ 0
Uout = Uin * (1 + R3/R2 + R3/R1) - Vcc * R3/R1
Text Notes 2250 2100 0    50   ~ 0
R1
Text Notes 3250 3250 0    50   ~ 0
R2
Text Notes 3250 2800 0    50   ~ 0
R3
$Comp
L Fossa_library:LM335 DA1
U 1 1 5EFF8327
P 1250 2900
F 0 "DA1" H 883 2503 60  0000 R CNN
F 1 "LM335" H 883 2397 60  0000 R CNN
F 2 "" H 1240 2910 60  0000 C CNN
F 3 "" H 1240 2910 60  0000 C CNN
	1    1250 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5EFFB093
P 1250 4100
F 0 "#PWR02" H 1250 3850 50  0001 C CNN
F 1 "GND" H 1255 3927 50  0000 C CNN
F 2 "" H 1250 4100 50  0001 C CNN
F 3 "" H 1250 4100 50  0001 C CNN
	1    1250 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 4100 1250 4000
$Comp
L Device:R R1
U 1 1 5EFFBD64
P 1250 2350
F 0 "R1" H 1320 2396 50  0000 L CNN
F 1 "1.2k" H 1320 2305 50  0000 L CNN
F 2 "" V 1180 2350 50  0001 C CNN
F 3 "~" H 1250 2350 50  0001 C CNN
	1    1250 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 2500 1250 2600
$Comp
L power:+5V #PWR01
U 1 1 5EFFD0DA
P 1250 2050
F 0 "#PWR01" H 1250 1900 50  0001 C CNN
F 1 "+5V" H 1265 2223 50  0000 C CNN
F 2 "" H 1250 2050 50  0001 C CNN
F 3 "" H 1250 2050 50  0001 C CNN
	1    1250 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 2050 1250 2200
Connection ~ 1250 2600
Wire Wire Line
	1250 2600 1250 2700
$Comp
L Device:C C1
U 1 1 5F0093E1
P 2050 2900
F 0 "C1" H 2165 2946 50  0000 L CNN
F 1 "0.1uF" H 2165 2855 50  0000 L CNN
F 2 "" H 2088 2750 50  0001 C CNN
F 3 "~" H 2050 2900 50  0001 C CNN
	1    2050 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5F009C30
P 2050 3150
F 0 "#PWR03" H 2050 2900 50  0001 C CNN
F 1 "GND" H 2055 2977 50  0000 C CNN
F 2 "" H 2050 3150 50  0001 C CNN
F 3 "" H 2050 3150 50  0001 C CNN
	1    2050 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 3150 2050 3050
Wire Wire Line
	2050 2750 2050 2600
Wire Wire Line
	2050 2600 1250 2600
Wire Wire Line
	2600 2600 2050 2600
Connection ~ 2050 2600
Text Notes 1500 2550 0    50   ~ 0
10mV/k\n-50C - 2.23V\n+5C - 2.78V\n+25C - 2.98V\n+60C - 3.33V
Text Notes 3100 2400 0    50   ~ 0
IRL measurements:\n2.23V - 0.66V\n2.78V - 1.60V\n3.03V - 2.02V\n3.33V - 2.55V
$Comp
L Amplifier_Operational:LM358 U1
U 2 1 5EFFA571
P 5050 2600
F 0 "U1" H 5050 2967 50  0000 C CNN
F 1 "LM158" H 5050 2876 50  0000 C CNN
F 2 "" H 5050 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 5050 2600 50  0001 C CNN
	2    5050 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5EFFEB45
P 4200 2500
F 0 "R5" V 3993 2500 50  0000 C CNN
F 1 "1k" V 4084 2500 50  0000 C CNN
F 2 "" V 4130 2500 50  0001 C CNN
F 3 "~" H 4200 2500 50  0001 C CNN
	1    4200 2500
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5EFFF990
P 5050 2150
F 0 "R9" V 4843 2150 50  0000 C CNN
F 1 "75k" V 4934 2150 50  0000 C CNN
F 2 "" V 4980 2150 50  0001 C CNN
F 3 "~" H 5050 2150 50  0001 C CNN
	1    5050 2150
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5F000289
P 4550 1900
F 0 "R7" H 4620 1946 50  0000 L CNN
F 1 "12k" H 4620 1855 50  0000 L CNN
F 2 "" V 4480 1900 50  0001 C CNN
F 3 "~" H 4550 1900 50  0001 C CNN
	1    4550 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5F000C84
P 4550 3050
F 0 "R8" H 4620 3096 50  0000 L CNN
F 1 "10k" H 4620 3005 50  0000 L CNN
F 2 "" V 4480 3050 50  0001 C CNN
F 3 "~" H 4550 3050 50  0001 C CNN
	1    4550 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:RTRIM R6
U 1 1 5F0014F4
P 4550 1500
F 0 "R6" H 4678 1546 50  0000 L CNN
F 1 "5k" H 4678 1455 50  0000 L CNN
F 2 "" V 4480 1500 50  0001 C CNN
F 3 "~" H 4550 1500 50  0001 C CNN
	1    4550 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2150 4700 2150
Wire Wire Line
	4700 2150 4700 2500
Wire Wire Line
	4700 2500 4750 2500
Wire Wire Line
	4350 2500 4700 2500
Connection ~ 4700 2500
Wire Wire Line
	4550 2700 4550 2900
Wire Wire Line
	4750 2700 4550 2700
Wire Wire Line
	4550 2050 4550 2700
Connection ~ 4550 2700
Wire Wire Line
	4550 1650 4550 1750
Wire Wire Line
	5200 2150 5450 2150
Wire Wire Line
	5450 2150 5450 2600
Wire Wire Line
	5450 2600 5350 2600
Wire Wire Line
	4050 2500 3400 2500
Connection ~ 3400 2500
$Comp
L power:GND #PWR013
U 1 1 5F044406
P 4550 3300
F 0 "#PWR013" H 4550 3050 50  0001 C CNN
F 1 "GND" H 4555 3127 50  0000 C CNN
F 2 "" H 4550 3300 50  0001 C CNN
F 3 "" H 4550 3300 50  0001 C CNN
	1    4550 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR012
U 1 1 5F044C8B
P 4550 1250
F 0 "#PWR012" H 4550 1100 50  0001 C CNN
F 1 "+5V" H 4565 1423 50  0000 C CNN
F 2 "" H 4550 1250 50  0001 C CNN
F 3 "" H 4550 1250 50  0001 C CNN
	1    4550 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3300 4550 3200
Wire Wire Line
	4550 1350 4550 1250
$Comp
L Device:R R10
U 1 1 5F046FF3
P 5750 2600
F 0 "R10" V 5543 2600 50  0000 C CNN
F 1 "4.7k" V 5634 2600 50  0000 C CNN
F 2 "" V 5680 2600 50  0001 C CNN
F 3 "~" H 5750 2600 50  0001 C CNN
	1    5750 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 2600 5450 2600
Connection ~ 5450 2600
$Comp
L Transistor_FET:2N7002 Q1
U 1 1 5F04BBAF
P 6250 2600
F 0 "Q1" H 6454 2646 50  0000 L CNN
F 1 "2N7002" H 6454 2555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6450 2525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 6250 2600 50  0001 L CNN
	1    6250 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2600 5900 2600
$Comp
L power:GND #PWR015
U 1 1 5F04E3FC
P 6350 2900
F 0 "#PWR015" H 6350 2650 50  0001 C CNN
F 1 "GND" H 6355 2727 50  0000 C CNN
F 2 "" H 6350 2900 50  0001 C CNN
F 3 "" H 6350 2900 50  0001 C CNN
	1    6350 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 5F04F594
P 6350 1900
F 0 "R11" H 6420 1946 50  0000 L CNN
F 1 "1k" H 6420 1855 50  0000 L CNN
F 2 "" V 6280 1900 50  0001 C CNN
F 3 "~" H 6350 1900 50  0001 C CNN
	1    6350 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2800 6350 2900
Wire Wire Line
	6350 2400 6350 2050
$Comp
L power:+5V #PWR014
U 1 1 5F05201F
P 6350 1600
F 0 "#PWR014" H 6350 1450 50  0001 C CNN
F 1 "+5V" H 6365 1773 50  0000 C CNN
F 2 "" H 6350 1600 50  0001 C CNN
F 3 "" H 6350 1600 50  0001 C CNN
	1    6350 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 1600 6350 1750
Text Notes 6400 2200 0    50   ~ 0
OK - 5V\nOverheat - 0V
$EndSCHEMATC
