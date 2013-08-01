#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "Qcar.h"

int main(){

    
    ofAppiPhoneWindow *window = new ofAppiPhoneWindow();
    //window->enableRendererES2();
    window->enableDepthBuffer();
<<<<<<< HEAD
    window->enableRetina();
    //window->enableRetinaSupport();
    //window->setOrientation(OF_ORIENTATION_90_RIGHT);
    //window->enableHardwareOrientation();
    window->disableHardwareOrientation();
    window->disableOrientationAnimation();
=======
    window->enableRetinaSupport();
    window->setOrientation(OF_ORIENTATION_90_RIGHT);

>>>>>>> 48a57db1870b16a32fb0a7167b1c0833a71dc461
    
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
