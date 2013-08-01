#include "VideoApp.h"
#import "AVFoundationVideoPlayer.h"

//--------------------------------------------------------------
VideoApp :: VideoApp () {
    cout << "creating VideoApp" << endl;
}

//--------------------------------------------------------------
VideoApp :: ~VideoApp () {
    cout << "destroying VideoApp" << endl;
}

//--------------------------------------------------------------
void VideoApp::setup() {	
	ofBackground(127);
    

    cadre.loadImage("Interface/accueil@2x.jpg");

    
    int fontSize = 8;
    //if (ofxiPhoneGetOFWindow()->isRetinaSupported())
     //   fontSize *= 2;
    
    font.loadFont("fonts/mono0755.ttf", fontSize);
    
    video.loadMovie("videos/video@2x.mp4");

	video.play();
    
    AVFoundationVideoPlayer * avVideoPlayer;
    avVideoPlayer = (AVFoundationVideoPlayer *)video.getAVFoundationVideoPlayer();
    // [avVideoPlayer setVideoPosition:CGPointMake(0, 240)];
    [ofxiPhoneGetGLParentView() addSubview:avVideoPlayer.playerView];
    avVideoPlayer.playerView.hidden = YES;

}

//--------------------------------------------------------------
void VideoApp::update(){
    if(!video.isLoaded()) {
        return;
    }
    
    video.update();
}

//--------------------------------------------------------------
void VideoApp::draw() {
    int x = 114;
    int y = 82;
    int p = 0;
    
    
	ofSetColor(ofColor::white);
    cadre.draw(0,0);
    video.getTexture()->draw(x, y);
    
    
    x = ofGetWidth()  * 0.2;
    y = ofGetHeight() * 0.11;
    p = ofGetHeight() * 0.035;
    
    ofSetColor(ofColor::white);
    font.drawString("frame num      = " + ofToString( ofGetFrameNum() ),    x, y+=p);
    font.drawString("frame rate     = " + ofToString( ofGetFrameRate() ),   x, y+=p);
    font.drawString("screen width   = " + ofToString( ofGetWidth() ),       x, y+=p);
    font.drawString("screen height  = " + ofToString( ofGetHeight() ),      x, y+=p);
    font.drawString("is video loaded= " + ofToString( video.isLoaded() ),   x, y+=p);
    


}

//--------------------------------------------------------------
void VideoApp::exit() {
    //
    video.close();
}

//--------------------------------------------------------------
void VideoApp::touchDown(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void VideoApp::touchMoved(ofTouchEventArgs &touch){
}

//--------------------------------------------------------------
void VideoApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void VideoApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void VideoApp::lostFocus(){

}

//--------------------------------------------------------------
void VideoApp::gotFocus(){

}

//--------------------------------------------------------------
void VideoApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void VideoApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void VideoApp::touchCancelled(ofTouchEventArgs& args){

}

