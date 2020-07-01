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
P 4150 1150
F 0 "U1" H 4108 1196 50  0000 L CNN
F 1 "LM158" H 4108 1105 50  0000 L CNN
F 2 "" H 4150 1150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 4150 1150 50  0001 C CNN
	3    4150 1150
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
P 4050 750
F 0 "#PWR08" H 4050 600 50  0001 C CNN
F 1 "+5V" H 4065 923 50  0000 C CNN
F 2 "" H 4050 750 50  0001 C CNN
F 3 "" H 4050 750 50  0001 C CNN
	1    4050 750 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5EFE1E72
P 4050 1550
F 0 "#PWR09" H 4050 1300 50  0001 C CNN
F 1 "GND" H 4055 1377 50  0000 C CNN
F 2 "" H 4050 1550 50  0001 C CNN
F 3 "" H 4050 1550 50  0001 C CNN
	1    4050 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 850  4050 750 
$Comp
L Device:CP C2
U 1 1 5EFE3336
P 3750 1150
F 0 "C2" H 3868 1196 50  0000 L CNN
F 1 "100uF" H 3868 1105 50  0000 L CNN
F 2 "" H 3788 1000 50  0001 C CNN
F 3 "~" H 3750 1150 50  0001 C CNN
	1    3750 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5EFE4062
P 3750 1550
F 0 "#PWR07" H 3750 1300 50  0001 C CNN
F 1 "GND" H 3755 1377 50  0000 C CNN
F 2 "" H 3750 1550 50  0001 C CNN
F 3 "" H 3750 1550 50  0001 C CNN
	1    3750 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5EFE46B1
P 3750 750
F 0 "#PWR06" H 3750 600 50  0001 C CNN
F 1 "+5V" H 3765 923 50  0000 C CNN
F 2 "" H 3750 750 50  0001 C CNN
F 3 "" H 3750 750 50  0001 C CNN
	1    3750 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1000 3750 750 
Wire Wire Line
	3750 1300 3750 1550
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5EFE5C5A
P 4750 1150
F 0 "J1" H 4812 1194 50  0000 L CNN
F 1 "Conn_01x02_Male" H 4500 950 50  0000 L CNN
F 2 "" H 4750 1150 50  0001 C CNN
F 3 "~" H 4750 1150 50  0001 C CNN
	1    4750 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 1550 4050 1450
$Comp
L power:GND #PWR011
U 1 1 5EFEE96F
P 4500 1200
F 0 "#PWR011" H 4500 950 50  0001 C CNN
F 1 "GND" H 4505 1027 50  0000 C CNN
F 2 "" H 4500 1200 50  0001 C CNN
F 3 "" H 4500 1200 50  0001 C CNN
	1    4500 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 5EFEF193
P 4500 1000
F 0 "#PWR010" H 4500 850 50  0001 C CNN
F 1 "+5V" H 4515 1173 50  0000 C CNN
F 2 "" H 4500 1000 50  0001 C CNN
F 3 "" H 4500 1000 50  0001 C CNN
	1    4500 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1000 4500 1050
Wire Wire Line
	4500 1050 4550 1050
Wire Wire Line
	4550 1150 4500 1150
Wire Wire Line
	4500 1150 4500 1200
Text Notes 2650 2000 0    50   ~ 0
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
Text Notes 3200 2450 0    50   ~ 0
IRL measurements:\n2.23V - 0.66V\n2.78V - 1.60V\n3.03V - 2.02V\n3.33V - 2.55V
$EndSCHEMATC
