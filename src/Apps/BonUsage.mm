#include "BonUsage.h"
#import "AVFoundationVideoPlayer.h"
#import "MentionsLegales.h"

//--------------------------------------------------------------
BonUsage :: BonUsage () {
    cout << "creating BonUsage" << endl;
}

//--------------------------------------------------------------
BonUsage :: ~BonUsage () {
    cout << "destroying BonUsage" << endl;
}

//--------------------------------------------------------------
void BonUsage::setup() {
	ofBackground(127);
    
    state = 1;
    contenu1.loadImage("Interface/BonUsage01.jpg");
    contenu2.loadImage("Interface/BonUsage02.jpg");
    bouton1.loadImage("Interface/Boutons-JPG/Bouton-BonUsage01-x1142-y1389.jpg");
    bouton2.loadImage("Interface/Boutons-JPG/Bouton-BonUsage02-x1435-y1389.jpg");

}

//--------------------------------------------------------------
void BonUsage::update(){

}

//--------------------------------------------------------------
void BonUsage::draw() {
    
    if (state == 1)
    {
        contenu1.draw(0,0);
        bouton1.draw(1142,1389);
    }
    else
    {
        contenu2.draw(0, 0);
        bouton2.draw(1435, 1389);
    }
    
}

//--------------------------------------------------------------
void BonUsage::exit() {
    
}

//--------------------------------------------------------------
void BonUsage::touchDown(ofTouchEventArgs &touch){

    // BOUTON 1
    if (ofRectangle(1142,1389,254,89).inside(touch.x, touch.y))
        state = 1;
    // BOUTON 2
    else if (ofRectangle(1435,1389,254,89).inside(touch.x, touch.y))
        state = 2;
    // ACCUEIL
    else if (ofRectangle(1733,1389,197,89).inside(touch.x, touch.y))
    {
        cout << "quitte vers accueil" << endl;
        exit();
        [mainController.navigationController popViewControllerAnimated:YES];

    }
    else if (ofRectangle(1370,40,250,118).inside(touch.x, touch.y))
    {
        cout << "quitte vers accueil" << endl;
        exit();
        [mainController.navigationController popViewControllerAnimated:YES];

        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:mainController
                                       selector:@selector(buttonLegalAction:)
                                       userInfo:nil
                                        repeats:NO];
        
    }
    //TODO : Mentions légales

}

//--------------------------------------------------------------
void BonUsage::touchMoved(ofTouchEventArgs &touch){
}

//--------------------------------------------------------------
void BonUsage::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void BonUsage::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void BonUsage::lostFocus(){

}

//--------------------------------------------------------------
void BonUsage::gotFocus(){

}

//--------------------------------------------------------------
void BonUsage::gotMemoryWarning(){

}

//--------------------------------------------------------------
void BonUsage::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void BonUsage::touchCancelled(ofTouchEventArgs& args){

}

