<Qucs Schematic 0.0.20>
<Properties>
  <View=0,-60,800,800,1.1,0,0>
  <Grid=10,10,1>
  <DataSet=ScalingAmplifier.dat>
  <DataDisplay=ScalingAmplifier.dpl>
  <OpenDisplay=1>
  <Script=ScalingAmplifier.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <OpAmp OP1 1 590 370 -26 -80 1 0 "1e6" 1 "15 V" 0>
  <GND * 5 660 580 0 0 0 0>
  <.DC DC1 1 20 20 0 37 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <.TR TR1 1 200 20 0 60 0 0 "lin" 1 "0" 1 "1 S" 1 "100" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <GND * 5 460 280 0 0 0 0>
  <GND * 5 320 590 0 0 0 0>
  <Vdc V2 1 460 230 18 -26 0 1 "5 V" 1>
  <Vdc V3 1 320 550 18 -26 0 1 "2.23 V" 1>
  <R R3 1 660 430 15 -26 0 1 "10k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vac V1 1 320 450 18 -26 0 1 "1.1 V" 1 "1 Hz" 0 "0" 0 "0" 0>
  <R R1 1 520 280 15 -26 0 1 "16k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R2 1 660 530 15 -26 0 1 "130k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
</Components>
<Wires>
  <320 390 560 390 "Vin" 430 360 76 "">
  <320 390 320 420 "" 0 0 0 "">
  <660 560 660 580 "" 0 0 0 "">
  <660 460 660 480 "" 0 0 0 "">
  <660 370 660 400 "" 0 0 0 "">
  <630 370 660 370 "" 0 0 0 "">
  <520 350 560 350 "" 0 0 0 "">
  <520 350 520 480 "" 0 0 0 "">
  <660 480 660 500 "" 0 0 0 "">
  <520 480 660 480 "" 0 0 0 "">
  <520 310 520 350 "" 0 0 0 "">
  <460 260 460 280 "" 0 0 0 "">
  <460 160 460 200 "" 0 0 0 "">
  <460 160 520 160 "" 0 0 0 "">
  <520 160 520 250 "" 0 0 0 "">
  <320 580 320 590 "" 0 0 0 "">
  <320 480 320 520 "" 0 0 0 "">
  <660 370 660 370 "Uout" 690 340 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
