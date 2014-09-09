####    T-37   ####
####    based on Aerostar by Syd Adams    ####


vol_cabin=props.globals.getNode("/sim/sound/T-37/vol_cabin",1);
vol_exterior=props.globals.getNode("/sim/sound/T-37/vol_exterior",1);

setlistener("/sim/signals/fdm-initialized", func{
    vol_cabin.setValue(0.5);
    vol_exterior.setValue(0.2);
});


setlistener("/sim/current-view/view-number", func(vw){
    ViewNum = vw.getValue();
    if(ViewNum == 0){
        vol_cabin.setValue(0.5);
        vol_exterior.setValue(0.5);
        }else{
        vol_cabin.setValue(0.2);
        vol_exterior.setValue(1.0);
        }
    },1,0);

#copied from F-14B
# Canopy switch animation and canopy move. Toggle keystroke and 2 positions switch.
var cnpy = aircraft.door.new("canopy", 4);
var cswitch = props.globals.getNode("sim/model/T37/controls/canopy/canopy-switch", 1);
var pos = props.globals.getNode("canopy/position-norm");

var canopyswitch = func(v) {
	var p = pos.getValue();
	if (v == 2 ) {
		if ( p < 1 ) {
			v = 1;
		} elsif ( p >= 1 ) {
			v = -1;
		}
	}
	if (v < 0) {
		cswitch.setValue(1);
		cnpy.close();
	} elsif (v > 0) {
		cswitch.setValue(-1);
		cnpy.open();
	}
}
