canopy = aircraft.door.new ("/controls/canopy/", 4);

toggle_canopy = func {
	#print ("toggle_canopy: ") ;

  if(getprop("/controls/canopy/position-norm") > 0) {
	#print ("Closing canopy.") ;
      canopy.close();
  } else {
	#print ("Opening canopy.") ;
      canopy.open();
  }
}

#print("Initialized model doors") ;