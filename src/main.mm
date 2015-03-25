#include "ofMain.h"
#include "ofAppiOSWindow.h"
#include "Senses.h"

extern "C"{
    size_t fwrite$UNIX2003( const void *a, size_t b, size_t c, FILE *d )
    {
        return fwrite(a, b, c, d);
    }
    char* strerror$UNIX2003( int errnum )
    {
        return strerror(errnum);
    }
    time_t mktime$UNIX2003(struct tm * a)
    {
        return mktime(a);
    }
    double strtod$UNIX2003(const char * a, char ** b) {
        return strtod(a, b);
    }
}

//int main(){
//    //	ofSetupOpenGL(1024,768,OF_FULLSCREEN);			// <-------- setup the GL context
//    
//    //	ofRunApp(new OFAleixo());
//    
//    
//    
//    //ofSetupOpenGL(1024,768, OF_FULLSCREEN);			// <-------- setup the GL context
//    
//    ofAppiOSWindow * iOSWindow = new ofAppiOSWindow();
//    
//    iOSWindow->enableDepthBuffer();
//    //iOSWindow->enableAntiAliasing(4);
//    
//    iOSWindow->enableRetina();
//    //    iOSWindow->disableRetina();
//    
//    ofSetupOpenGL(iOSWindow, 768, 1024, OF_FULLSCREEN);
//    ofRunApp(new Senses);
//}

int main() {
    
    //  here are the most commonly used iOS window settings.
    //------------------------------------------------------
    ofiOSWindowSettings settings;
    settings.enableRetina = false; // enables retina resolution if the device supports it.
    settings.enableDepth = false; // enables depth buffer for 3d drawing.
    settings.enableAntiAliasing = false; // enables anti-aliasing which smooths out graphics on the screen.
    settings.numOfAntiAliasingSamples = 0; // number of samples used for anti-aliasing.
    settings.enableHardwareOrientation = true; // enables native view orientation.
    settings.enableHardwareOrientationAnimation = false; // enables native orientation changes to be animated.
    settings.glesVersion = OFXIOS_RENDERER_ES2; // type of renderer to use, ES1, ES2, etc.
    
    ofCreateWindow(settings);
    
    return ofRunApp(new Senses);
}

//
//int main(){
//    ofSetupOpenGL(1024,768,OF_FULLSCREEN);			// <-------- setup the GL context
//    
//    ofRunApp(new Senses());
//}
