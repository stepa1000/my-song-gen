<CsoundSynthesizer>

<CsOptions>

--nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 1
0dbfs = 1.0
gkrggBpmVar init 110.0
girgfree_vco = 101
ir9 = girgfree_vco
ir10 vco2init 16, ir9
girgfree_vco = ir10
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop


instr 21
endin

instr 20
event_i "i", 19, 604800.0, 1.0e-2
endin

instr 19
ir0 = 18
ir1 = 0.0
turnoff2 ir0, ir1, ir1
exitnow
endin

instr 18
arl0 init 0.0
ir1 = 1.0
kr0 = 220.0
kr1 vco2ft kr0, 4
ar1 oscilikt ir1, kr0, kr1
ir5 = 0.0
ir6 = 90.0
ir7 = 100.0
ar2 upsamp k(ir1)
ar3 compress ar1, ar2, ir5, ir6, ir6, ir7, ir5, ir5, 0.0
ar1 = (ar3 * 0.8)
arl0 = ar1
ar1 = arl0
out ar1
endin

</CsInstruments>

<CsScore>



f0 604800.0

i 21 0.0 -1.0
i 20 0.0 -1.0
i 18 0.0 -1.0

</CsScore>


</CsoundSynthesizer>