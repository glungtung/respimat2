#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "Qcar.h"

int main(){

    
    ofAppiPhoneWindow *window = new ofAppiPhoneWindow();
    //window->enableRendererES2();
    window->enableDepthBuffer();
    window->enableRetina();
    //window->enableRetinaSupport();
    //window->setOrientation(OF_ORIENTATION_90_RIGHT);
    //window->enableHardwareOrientation();
    window->disableHardwareOrientation();
    window->disableOrientationAnimation();

    
    ofSetupOpenGL( ofPtr<ofAppBaseWindow>( window ), 1024,768, OF_FULLSCREEN );
    window->startAppWithDelegate( "MyAppDelegate" );
    
    
 /*
        
        ofAppiPhoneWindow *window = new ofAppiPhoneWindow();
        window->enableDepthBuffer();
        window->enableRetinaSupport();

        
        ofGLES2Renderer * renderer = new ofGLES2Renderer();
        ofSetCurrentRenderer(ofPtr<ofBaseRenderer>(renderer));                      // switch to GLES2 renderer.
        
        
        ofSetupOpenGL(ofPtr<ofAppBaseWindow>(window), 1024, 768, OF_FULLSCREEN);
        window->startAppWithDelegate("MyAppDelegate");
        
        window->setOrientation(OF_ORIENTATION_90_RIGHT);
*/

}
