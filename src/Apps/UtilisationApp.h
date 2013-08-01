#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#import "VideoAppViewController.h"
#include "MyAppViewController.h"


class UtilisationApp : public ofxiPhoneApp {
	
public:
    
     UtilisationApp ();
    ~UtilisationApp ();
    
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

    void loadVideo(string path);
    
    ofiPhoneVideoPlayer video;
    ofImage cadre;

    MyAppViewController * mainController;
    
};


