*Skywater130 Test Simulation

.option scale=1e-6
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

xm01 	d1 g1 0 0 	sky130_fd_pr__nfet_01v8 l=0.15 w=10

vds1 	d1 0		1.8
vgs1 	g1 0 		1.8

xm02 	d2 g2 vdd vdd	sky130_fd_pr__pfet_01v8 l=0.15 w=25
eds2 	vdd d2 d1 0	1
egs2 	vdd g2 g1 0	1

vsup 	vdd 0 		1.8	

.control
* Transfer Characteristics
dc vgs1 0 1.8 0.01
plot (-i(vds1)) (-i(eds2))

* Output Characteristics
dc vds1 0 1.8 0.01 vgs1 0.2 1.8 0.2
plot (-i(vds1)) (-i(eds2))

.endc

.end

