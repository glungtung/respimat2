#include "RAApp.h"

//--------------------------------------------------------------
RAApp :: RAApp () {
    cout << "creating RAApp" << endl;
}

//--------------------------------------------------------------
RAApp :: ~RAApp () {
    cout << "destroying RAApp" << endl;
}


//--------------------------------------------------------------
void RAApp::setup(){
	ofBackground(0);
    
//    teapotImage.loadImage("qcar_assets/TextureTeapotBrass.png");
//    teapotImage.mirror(true, false);  //-- flip texture vertically since the texture coords are set that way on the teapot.
    
    touchPoint.x = touchPoint.y = -1;
    
    
    ofDisableArbTex(); // we need GL_TEXTURE_2D for our models coords.
    
    /*
    glEnable(GL_DEPTH_TEST);
    
    glEnable(GL_LIGHTING);
    
    GLfloat global_ambient[] = { 0.2f, 0.2f, 0.2f, 1.0f };
    glLightModelfv(GL_LIGHT_MODEL_AMBIENT, global_ambient);
    
    GLfloat specular[] = {1.0f, 1.0f, 1.0f, 1.0f};
    glLightfv(GL_LIGHT0, GL_SPECULAR, specular);
    
    GLfloat diffuse[] = {1.0f, 1.0f, 1.0f, 1.0f};
    glLightfv(GL_LIGHT0, GL_DIFFUSE, diffuse);
    
    GLfloat ambient[] = {0.2, 0.2f, 0.2f, 0.2f};
    glLightfv(GL_LIGHT0, GL_AMBIENT, ambient);
    
    GLfloat position[] = { 0.5f, 0.5f, 0.5f, 2.0f};
    glLightfv(GL_LIGHT0, GL_POSITION, position);
    
    glEnable(GL_LIGHT0);
    
    //some model / light stuff
    glShadeModel(GL_SMOOTH);
    //  light.enable();
    ofEnableSeparateSpecularLight();
    */
    
    
    ofSetSmoothLighting(true);
    light.enable();
    
    //ofPoint modelPosition(ofGetWidth() / 2, (float)ofGetHeight() * 0.75 , 0);
    model.loadModel("3D/rerespimat/respimat 04.3DS");
    //ofEnableSeparateSpecularLight();

    //model.setPosition(modelPosition.x, modelPosition.y, modelPosition.z);
    
    model.setLoopStateForAllAnimations(OF_LOOP_NORMAL);
    //model.playAllAnimations();
    
    
    ofxQCAR * qcar = ofxQCAR::getInstance();
    qcar->addTarget("respimat.xml", "respimat.xml");
    qcar->autoFocusOn();
    qcar->setCameraPixelsFlag(true);
    qcar->setup();
}

//--------------------------------------------------------------
void RAApp::update(){
    ofxQCAR::getInstance()->update();
    model.update();
    
}

//--------------------------------------------------------------
void RAApp::draw(){
    
    
    
    ofxQCAR * qcar = ofxQCAR::getInstance();
    qcar->draw();
    
    bool bPressed;
    bPressed = touchPoint.x >= 0 && touchPoint.y >= 0;
    
    if(qcar->hasFoundMarker()) {
        
        glDisable(GL_DEPTH_TEST);
        ofEnableBlendMode(OF_BLENDMODE_ALPHA);
        ofSetLineWidth(3);
        
        bool bInside = false;
        if(bPressed) {
            vector<ofPoint> markerPoly;
            markerPoly.push_back(qcar->getMarkerCorner((ofxQCAR_MarkerCorner)0));
            markerPoly.push_back(qcar->getMarkerCorner((ofxQCAR_MarkerCorner)1));
            markerPoly.push_back(qcar->getMarkerCorner((ofxQCAR_MarkerCorner)2));
            markerPoly.push_back(qcar->getMarkerCorner((ofxQCAR_MarkerCorner)3));
            bInside = ofInsidePoly(touchPoint, markerPoly);
        }
        
        if (bInside)
            model.playAllAnimations();
        
        
        ofSetColor(ofColor(255, 0, 255, bInside ? 150 : 50));
        qcar->drawMarkerRect();
        
        ofSetColor(ofColor::yellow);
        qcar->drawMarkerBounds();
        ofSetColor(ofColor::cyan);
        qcar->drawMarkerCenter();
        qcar->drawMarkerCorners();
        
 //       ofEnableBlendMode(OF_BLENDMODE_DISABLED);

        
        ofSetColor(ofColor::white);
        ofSetLineWidth(1);
        
//        glEnable(GL_DEPTH_TEST);
        // ofEnableNormalizedTexCoords();
        
        // teapotImage.getTextureReference().bind();
        //ofDrawTeapot(qcar->getProjectionMatrix(), qcar->getModelViewMatrix(), 3);
        //teapotImage.getTextureReference().unbind();
        
        ofEnableAlphaBlending();
        
        //float objectScale = .5;
        float objectScale = 4;

        
        
        // REACTIVATED BECAUSE VUFORIA DESACTIVATED IT DURING RENDERING !!
        glEnable( GL_CULL_FACE );
        glEnable(GL_LIGHTING);
        
        
        // DRAW OPAQUE PART
        ////////////////////////
        glEnable( GL_DEPTH_TEST );
        
         glAlphaFunc ( GL_GREATER, 0.6 ) ;
         glEnable ( GL_ALPHA_TEST ) ;
        
  //       glEnable(GL_BLEND);
   //      glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
   //      glDisable(GL_CULL_FACE);
   //      glDepthFunc(GL_LEQUAL);
        
        
        glPushMatrix();
        glTranslatef( ofGetWidth() * 0.5, ofGetHeight() * 0.5, 0 );
        {
            
            
            glMatrixMode(GL_PROJECTION);
            glLoadMatrixf( qcar->getProjectionMatrix().getPtr() );
            
            glMatrixMode( GL_MODELVIEW );
            glLoadMatrixf( qcar->getModelViewMatrix().getPtr() );
            glTranslatef( 0.0f, 0.0f, 0.0f );
            glRotatef(180, 1.0, .0, 1.0);
            glRotatef(-90, 0, 1.0, 0);
            ofDrawBitmapString("fps: " + ofToString(ofGetFrameRate(), 2), 60, -90);
            glScalef( objectScale, objectScale, objectScale );
            glRotatef(90, 1.0, 0, 0);
            glRotatef(90, 0, 1.0, 0);
            model.drawFaces();
            
            
        }
        glPopMatrix();
        
        
        
        // DRAW TRANSLUCENT PART
        ////////////////////////
    //    glDisable( GL_DEPTH_TEST );
        
        glAlphaFunc ( GL_LESS, 0.6 ) ;
        glEnable ( GL_ALPHA_TEST ) ;
        
   //     glEnable(GL_BLEND);
   //     glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        
   //     glDisable(GL_CULL_FACE);
   //     glDepthFunc(GL_LEQUAL);
        
        // glEnable( GL_CULL_FACE );
        
        glPushMatrix();
        glTranslatef( ofGetWidth() * 0.5, ofGetHeight() * 0.5, 0 );
        {
            
            
            glMatrixMode(GL_PROJECTION);
            glLoadMatrixf( qcar->getProjectionMatrix().getPtr() );
            
            glMatrixMode( GL_MODELVIEW );
            glLoadMatrixf( qcar->getModelViewMatrix().getPtr() );
            glTranslatef( 0.0f, 0.0f, 0.0f );
            glRotatef(180, 1.0, .0, 1.0);
            glRotatef(-90, 0, 1.0, 0);
            ofDrawBitmapString("fps: " + ofToString(ofGetFrameRate(), 2), 60, -90);
            glScalef( objectScale, objectScale, objectScale );
            glRotatef(90, 1.0, 0, 0);
            glRotatef(90, 0, 1.0, 0);
            model.drawFaces();
            
            
        }
        glPopMatrix();

        
        glDisable(GL_ALPHA_TEST);
        
        
        // glDisable( GL_CULL_FACE );
        
        ofSetupScreen();
        
        ofDrawBitmapString("fps: " + ofToString(ofGetFrameRate(), 2), 10, 15);
        ofDrawBitmapString("num animations for this model: " + ofToString(model.getAnimationCount()), 10, 30);
        ofDrawBitmapString("double tap to change model", 10, 60);
        
        
        /*
         
         
         ofEnableAlphaBlending();
         
         //note we have to enable depth buffer in main.mm
         //see: window->enableDepthBuffer(); in main.mm
         
         glEnable(GL_DEPTH_TEST);
         
         glMatrixMode(GL_PROJECTION);
         glLoadMatrixf( qcar->getProjectionMatrix().getPtr());
         
         glMatrixMode( GL_MODELVIEW );
         glLoadMatrixf(  qcar->getModelViewMatrix().getPtr());
         model.drawFaces();
         
         
         ofDrawBitmapString("fps: " + ofToString(ofGetFrameRate(), 2), 10, 15);
         ofDrawBitmapString("num animations for this model: " + ofToString(model.getAnimationCount()), 10, 30);
         ofDrawBitmapString("double tap to change model", 10, 60);
         
         */
        ofDisableNormalizedTexCoords();
    }
    
    glEnable(GL_DEPTH_TEST);
    
    /**
     *  access to camera pixels.
     */
    int cameraW = qcar->getCameraWidth();
    int cameraH = qcar->getCameraHeight();
    unsigned char * cameraPixels = qcar->getCameraPixels();
    if(cameraW > 0 && cameraH > 0 && cameraPixels != NULL) {
        if(cameraImage.isAllocated() == false ) {
            cameraImage.allocate(cameraW, cameraH, OF_IMAGE_GRAYSCALE);
        }
        cameraImage.setFromPixels(cameraPixels, cameraW, cameraH, OF_IMAGE_GRAYSCALE);
        if(qcar->getOrientation() == OFX_QCAR_ORIENTATION_PORTRAIT) {
            cameraImage.rotate90(1);
        } else if(qcar->getOrientation() == OFX_QCAR_ORIENTATION_LANDSCAPE) {
            cameraImage.mirror(true, true);
        }
        
        cameraW = cameraImage.getWidth() * 0.5;
        cameraH = cameraImage.getHeight() * 0.5;
        int cameraX = 0;
        int cameraY = ofGetHeight() - cameraH;
        cameraImage.draw(cameraX, cameraY, cameraW, cameraH);
        
        ofPushStyle();
        ofSetColor(ofColor::white);
        ofNoFill();
        ofSetLineWidth(3);
        ofRect(cameraX, cameraY, cameraW, cameraH);
        ofPopStyle();
    }
    
    if(bPressed) {
        ofSetColor(ofColor::red);
        ofDrawBitmapString("touch x = " + ofToString((int)touchPoint.x), 20, 200);
        ofDrawBitmapString("touch y = " + ofToString((int)touchPoint.y), 20, 220);
    }
}

//--------------------------------------------------------------
void RAApp::exit(){
    ofxQCAR::getInstance()->exit();
}

//--------------------------------------------------------------
void RAApp::touchDown(ofTouchEventArgs & touch){
    touchPoint.set(touch.x, touch.y);
}

//--------------------------------------------------------------
void RAApp::touchMoved(ofTouchEventArgs & touch){
    touchPoint.set(touch.x, touch.y);
}

//--------------------------------------------------------------
void RAApp::touchUp(ofTouchEventArgs & touch){
    touchPoint.set(-1, -1);
}

//--------------------------------------------------------------
void RAApp::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void RAApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void RAApp::lostFocus(){
    
}

//--------------------------------------------------------------
void RAApp::gotFocus(){
    
}

//--------------------------------------------------------------
void RAApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void RAApp::deviceOrientationChanged(int newOrientation){
    
}

