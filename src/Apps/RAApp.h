#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"

#include "ofxQCAR.h"
#include "ofxAssimpModelLoader.h"
#include "ofVboMesh.h"

#include "ofPinchGestureRecognizer.h"

#include "ofxQCAR_ViewController.h"

#include "MyAppViewController.h"

class RAApp : public ofxiPhoneApp {
	
public:
    
     RAApp ();
    ~RAApp ();
    
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

    ofPoint touchPoint;
    
    ofImage cadreH, cadreB;
    
    ofxAssimpModelLoader model;
    ofLight	light;

    float objectScale, lastObjectScale;
    
    //ofShader shader;
    ofPoint mousePoint;
    
    //to identify specific pan/pinch/tap/swipe gestures
    ofPinchGestureRecognizer      *recogPinch;
    
    MyAppViewController * mainController;

    int animState;
    float animEnds[3];


};