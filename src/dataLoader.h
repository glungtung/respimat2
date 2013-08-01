#pragma once

#include "ofMain.h"
#include "singleton.h"
#include "ofxAssimpModelLoader.h"

class aiScene;

class dataLoader {
	
    public:
    
        dataLoader ();
        ~dataLoader ();
    
    const aiScene * sceneRespimat;
    const aiScene * sceneBronche;
    ofxAssimpModelLoader modelRespimat;
    ofxAssimpModelLoader modelBronche;


};


typedef Singleton<dataLoader> singletonDataLoader;
