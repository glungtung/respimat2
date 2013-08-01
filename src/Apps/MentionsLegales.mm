#include "MentionsLegales.h"
#import "AVFoundationVideoPlayer.h"

//--------------------------------------------------------------
MentionsLegales :: MentionsLegales () {
    cout << "creating MentionsLegales" << endl;
}

//--------------------------------------------------------------
MentionsLegales :: ~MentionsLegales () {
    cout << "destroying MentionsLegales" << endl;
}

//--------------------------------------------------------------
void MentionsLegales::setup() {
	ofBackground(127);
    
    cadreH.loadImage("Interface/cadreH.jpg");
    cadreB.loadImage("Interface/cadreB-Legal.jpg");
    
    state = 1;
    contenu.loadImage("Interface/Mentionlegale/MentionLegale-Page01.jpg");

}

//--------------------------------------------------------------
void MentionsLegales::update(){

}

//--------------------------------------------------------------
void MentionsLegales::draw() {
    
    cadreH.draw(0,0);
    contenu.draw(0, cadreH.height);
    cadreB.draw(0,ofGetHeight()-cadreB.height);
    
}

//--------------------------------------------------------------
void MentionsLegales::exit() {
    
}

//--------------------------------------------------------------
void MentionsLegales::touchDown(ofTouchEventArgs &touch){

    
    // BOUTON PREV
    if (ofRectangle(836,1262,76,76).inside(touch.x, touch.y))
        state = ofClamp(state-1, 1, 4);
    // BOUTON NEXT
    else if (ofRectangle(1138,1262,76,76).inside(touch.x, touch.y))
        state = ofClamp(state+1, 1, 4);
    // ACCUEIL
    else if (ofRectangle(1733,1389,197,89).inside(touch.x, touch.y))
    {
        cout << "quitte vers accueil" << endl;
        exit();
        [mainController.navigationController popViewControllerAnimated:YES];

    }
    contenu.loadImage("Interface/Mentionlegale/MentionLegale-Page0"+ ofToString(state) + ".jpg");
    //TODO : Mentions légales

}

//--------------------------------------------------------------
void MentionsLegales::touchMoved(ofTouchEventArgs &touch){
}

//--------------------------------------------------------------
void MentionsLegales::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void MentionsLegales::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void MentionsLegales::lostFocus(){

}

//--------------------------------------------------------------
void MentionsLegales::gotFocus(){

}

//--------------------------------------------------------------
void MentionsLegales::gotMemoryWarning(){

}

//--------------------------------------------------------------
void MentionsLegales::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void MentionsLegales::touchCancelled(ofTouchEventArgs& args){

}

