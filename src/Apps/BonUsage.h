#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#import "VideoAppViewController.h"
#include "MyAppViewController.h"


class BonUsage : public ofxiPhoneApp {
	
public:
    
     BonUsage ();
    ~BonUsage ();
    
	void setup();
	void update();
	void draw();
	void exit();
	
	void touchDown(ofTouchEventArgs &touch);
	void touchMoved(ofTouchEventArgs &touch);
	void touchUp(ofTouchEventArgs &touch);
	void touchDoubleTap(ofTouchEventArgs &touch);
	void touchCancelled(ofTouchEventArgs &touch);

	void lostFocus();
	void gotFocus();
	void gotMemoryWarning();
	void deviceOrientationChanged(int newOrientation);


    ofImage contenu1, contenu2;
    int state;
    ofImage bouton1, bouton2;

    MyAppViewController * mainController;
    
};


