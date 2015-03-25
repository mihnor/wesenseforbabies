#pragma once

#include "ofMain.h"

class Poema {
	
public:
    virtual void setup();
    virtual void update();
    virtual void draw();
    virtual void exit();
	
    virtual void touchDown(ofTouchEventArgs & touch);
    virtual void touchMoved(ofTouchEventArgs & touch);
    virtual void touchUp(ofTouchEventArgs & touch);
    virtual void touchDoubleTap(ofTouchEventArgs & touch);
    virtual void touchCancelled(ofTouchEventArgs & touch);
    
    virtual void lostFocus();
    virtual void gotFocus();
    virtual void gotMemoryWarning();
    virtual void deviceOrientationChanged(int newOrientation);
    
};


