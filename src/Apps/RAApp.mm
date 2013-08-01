#include "RAApp.h"
#include "dataLoader.h"

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
    
    //ofSetOrientation(OF_ORIENTATION_90_RIGHT);

    
//    teapotImage.loadImage("qcar_assets/TextureTeapotBrass.png");
//    teapotImage.mirror(true, false);  //-- flip texture vertically since the texture coords are set that way on the teapot.
    
    touchPoint.x = touchPoint.y = -1;
    
    EAGLView *view = ofxiPhoneGetGLView();
    recogPinch = [[ofPinchGestureRecognizer alloc] initWithView:view];
    objectScale = 3.5;
    lastObjectScale = 3.5;
    
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
    //model.loadModel("3D/rerespimat/respimat06col14.DAE");
    //ofEnableSeparateSpecularLight();

    //model.setPosition(modelPosition.x, modelPosition.y, modelPosition.z);
    

    
    
    ofxQCAR * qcar = ofxQCAR::getInstance();
    qcar->addTarget("respimat.xml", "respimat.xml");
    qcar->autoFocusOn();
    qcar->setCameraPixelsFlag(true);
    qcar->setup();
    
    cadreH.loadImage("Interface/cadreH.jpg");
    cadreB.loadImage("Interface/cadreB.jpg");
    
    animState = 0;
    animEnds[0] = 40.0 / 500;
    animEnds[1] = 150.0 / 500;
    animEnds[2] = 499. / 500;
    

    model.loadModel(singletonDataLoader::Instance()->sceneRespimat);
    model.optimizeScene();
    model.playAllAnimations();
    model.setLoopStateForAllAnimations(OF_LOOP_NONE);
}

//--------------------------------------------------------------
void RAApp::update(){
    ofxQCAR::getInstance()->update();
    model.update();
    
    if (recogPinch->pinching)
        objectScale = lastObjectScale * recogPinch->scale;
    else
        lastObjectScale = objectScale;
    
    if (model.getAnimation(0).getPosition() >= animEnds[animState])
        model.getAnimation(0).setPaused(true);
    else
        model.getAnimation(0).setPaused(false);

}

//--------------------------------------------------------------
void RAApp::draw(){
    ofSetColor(ofColor::white);

    
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
        
//        if (bInside)
            //model.playAllAnimations();
        
        
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
        
        //float objectScale = MAX(recogPinch->scale,4.);

        
        // REACTIVATED BECAUSE VUFORIA DESACTIVATED IT DURING RENDERING !!
        glEnable( GL_CULL_FACE );
        glEnable(GL_LIGHTING);
        
        
        // DRAW OPAQUE PART
        ////////////////////////
        glEnable( GL_DEPTH_TEST );
        

        
  //       glEnable(GL_BLEND);
   //      glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
   //      glDisable(GL_CULL_FACE);
   //      glDepthFunc(GL_LEQUAL);
        
        
        glPushMatrix();
        glTranslatef( ofGetWidth() * 0.5, ofGetHeight() * 0.5, 0 );

            glMatrixMode(GL_PROJECTION);
            glPushMatrix();
            glLoadMatrixf( qcar->getProjectionMatrix().getPtr() );
            
            glMatrixMode( GL_MODELVIEW );
            glPushMatrix();
            glLoadMatrixf( qcar->getModelViewMatrix().getPtr() );
          //  glTranslatef( 0.0f, 0.0f, 0.0f );
          //  glRotatef(90, .0, .0, 1.0);
          //  glRotatef(-90, 0, 1.0, 0);
            glRotatef(-90, 1.0, 0, 0);
        //  glRotatef(90, .0, .0, 1.0);

            glRotatef(-90, 0, 1.0, 0);
            glScalef( objectScale, objectScale, objectScale );
            ofDrawBitmapString("fps: " + ofToString(ofGetFrameRate(), 2), 60, -90);
        

        glEnable ( GL_ALPHA_TEST ) ;
        glAlphaFunc ( GL_GREATER, 0.9 ) ;
        model.drawFaces();
        glAlphaFunc ( GL_LESS, 0.9 ) ;
        model.drawFaces();

        
        glPopMatrix();
        glMatrixMode(GL_PROJECTION);
        glPopMatrix();
        glMatrixMode( GL_MODELVIEW );
        glPopMatrix();

 
        
        glDisable(GL_ALPHA_TEST);
        
        
        // glDisable( GL_CULL_FACE );
        
        //ofSetupScreen();
      //  ofDrawBitmapString("fps: " + ofToString(ofGetFrameRate(), 2), 10, 15);
      //  ofDrawBitmapString("num animations for this model: " + ofToString(model.getAnimationCount()), 10, 30);
        
        
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
        //ofDisableNormalizedTexCoords();
    }
    // Reinit anim state when marker disappear
    else
    {
        animState = 0;
        model.resetAllAnimations();
    }
    
    //glEnable(GL_DEPTH_TEST);
    glAlphaFunc ( GL_GREATER, 0.9 ) ;
    glDisable(GL_DEPTH_TEST);
    glDisable(GL_ALPHA_TEST);
    glDisable( GL_CULL_FACE );
    glDisable(GL_LIGHTING);
    ofSetColor(ofColor::white);


    //ofGetGLRenderer()->setupScreenPerspective(0,0,OF_ORIENTATION_180);
   // ofSetupScreen();

    // CADRE

    cadreH.draw(0,0);
    cadreB.draw(0,ofGetHeight() - cadreB.height);
    
    if(bPressed) {
        ofSetColor(ofColor::red);
        ofDrawBitmapString("touch x = " + ofToString((int)touchPoint.x), 20, 200);
        ofDrawBitmapString("touch y = " + ofToString((int)touchPoint.y), 20, 220);
    }
    ofDrawBitmapString("scale= " + ofToString((float)recogPinch->scale), 20, 240);
    ofDrawBitmapString("anim position " + ofToString(model.getAnimation(0).getPosition()), 20, 260);
    
    if (animState == 1)
    {
        ofImage buttonSlected;
        buttonSlected.loadImage("Interface/Boutons-JPG/Bouton-Techno01-x1138- y1389.jpg");
        buttonSlected.draw(1138,1389, 255, 89);
    }
    else if (animState == 2)
    {
        ofImage buttonSlected;
        buttonSlected.loadImage("Interface/Boutons-JPG/Bouton-Techno02-x1435-y1389.jpg");
        buttonSlected.draw(1435,1389, 255, 89);
    }
    

}

//--------------------------------------------------------------
void RAApp::exit(){
    model.resetAllAnimations();
    ofxQCAR::getInstance()->exit();
}

//--------------------------------------------------------------
void RAApp::touchDown(ofTouchEventArgs & touch){
//    touchPoint.set(touch.x, touch.y);

    int newState = 0;
    // INHALATEUR
    if (ofxQCAR::getInstance()->hasFoundMarker() && ofRectangle(1138,1389,255,89).inside(touch.x, touch.y))
         newState = 1;
    // DIFFUSION
    else if (ofxQCAR::getInstance()->hasFoundMarker() && ofRectangle(1435,1389,255,89).inside(touch.x, touch.y))
         newState = 2;
    // ACCUEIL
    else if (ofRectangle(1733,1389,197,89).inside(touch.x, touch.y))
    {
        newState = 0;
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
    if (newState > 0)
    {
        model.getAnimation(0).setPosition(animEnds[newState-1]);
        animState = newState;
        model.getAnimation(0).setPaused(false);
    }
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

