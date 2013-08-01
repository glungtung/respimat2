#include "dataLoader.h"
#include "ofEventUtils.h"
#include "assimp.h"
#include "ofxAssimpModelLoader.h"

//--------------------------------------------------------------
dataLoader :: dataLoader () {
    cout << "data Loading ..." << endl;
    
    sceneRespimat = NULL;
    sceneBronche = NULL;
    

   modelRespimat.loadModel("3D/rerespimat/respimat06col14.DAE");
   sceneRespimat = modelRespimat.getAssimpScene();
    
    modelBronche.loadModel("3D/rerespimat/bronchescol03.DAE");
    sceneBronche = modelBronche.getAssimpScene();


}

//--------------------------------------------------------------
dataLoader :: ~dataLoader () {
    cout << "destroying dataLoader" << endl;
    aiReleaseImport(sceneRespimat);
    aiReleaseImport(sceneBronche);
}



