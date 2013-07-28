#include "UtilisationApp.h"
#import "AVFoundationVideoPlayer.h"

//--------------------------------------------------------------
UtilisationApp :: UtilisationApp () {
    cout << "creating UtilisationApp" << endl;
}

//--------------------------------------------------------------
UtilisationApp :: ~UtilisationApp () {
    cout << "destroying UtilisationApp" << endl;
}

//--------------------------------------------------------------
void UtilisationApp::setup() {	
	ofBackground(127);
    

    cadre.loadImage("Interface/Utilisation.jpg");
    
    AVFoundationVideoPlayer * avVideoPlayer;
    avVideoPlayer = (AVFoundationVideoPlayer *)video.getAVFoundationVideoPlayer();
    // [avVideoPlayer setVideoPosition:CGPointMake(0, 240)];
    [ofxiPhoneGetGLParentView() addSubview:avVideoPlayer.playerView];
    avVideoPlayer.playerView.hidden = YES;

}

//--------------------------------------------------------------
void UtilisationApp::update(){
    if(!video.isLoaded()) {
        return;
    }
    
    video.update();
    
    if (video.getIsMovieDone())
        video.close();

}

//--------------------------------------------------------------
void UtilisationApp::draw() {
    int x = 0;
    int y = 201;
    
	ofSetColor(ofColor::white);
    cadre.draw(0,0);
    if (video.isLoaded())
        video.getTexture()->draw(x, y, 2048, 1152);
    
 /*
    x = ofGetWidth()  * 0.2;
    y = ofGetHeight() * 0.11;
    int p = ofGetHeight() * 0.035;
    
    ofSetColor(ofColor::white);
    font.drawString("frame num      = " + ofToString( ofGetFrameNum() ),    x, y+=p);
    font.drawString("frame rate     = " + ofToString( ofGetFrameRate() ),   x, y+=p);
    font.drawString("screen width   = " + ofToString( ofGetWidth() ),       x, y+=p);
    font.drawString("screen height  = " + ofToString( ofGetHeight() ),      x, y+=p);
    font.drawString("is video loaded= " + ofToString( video.isLoaded() ),   x, y+=p);
   */ 


}


//--------------------------------------------------------------
void UtilisationApp::loadVideo(string path) {
    video.loadMovie(path);
    
    video.play();
}


//--------------------------------------------------------------
void UtilisationApp::exit() {
    //
    video.close();
}

//--------------------------------------------------------------
void UtilisationApp::touchDown(ofTouchEventArgs &touch){

    if (video.isLoaded() && ofRectangle(0,201,2048,1152).inside(touch.x, touch.y))
        video.close();
    else
    {
        if (!video.isLoaded() && ofRectangle(249,603,680,385).inside(touch.x, touch.y))
            loadVideo("VideosHD/1erUtilisation.mp4");
        
        if (!video.isLoaded() && ofRectangle(1229,360,463,262).inside(touch.x, touch.y))
            loadVideo("VideosHD/Q-01.mp4");
        
        if (!video.isLoaded() && ofRectangle(1229,682,463,262).inside(touch.x, touch.y))
            loadVideo("VideosHD/Q-02.mp4");
        
        if (!video.isLoaded() && ofRectangle(1229,1000,463,262).inside(touch.x, touch.y))
            loadVideo("VideosHD/Q-03.mp4");
    }
    
    if (!video.isLoaded() && ofRectangle(1733,1389,197,89).inside(touch.x, touch.y))
    {
        cout << "quitte vers accueil" << endl;

        [mainController.navigationController popViewControllerAnimated:YES];

    }
    //TODO : Mentions légales

}

//--------------------------------------------------------------
void UtilisationApp::touchMoved(ofTouchEventArgs &touch){
}

//--------------------------------------------------------------
void UtilisationApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void UtilisationApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void UtilisationApp::lostFocus(){

}

//--------------------------------------------------------------
void UtilisationApp::gotFocus(){

}

//--------------------------------------------------------------
void UtilisationApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void UtilisationApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void UtilisationApp::touchCancelled(ofTouchEventArgs& args){

}

