#pragma once

#include "ofMain.h"
#include "Poema.h"
#include "ofxOpenCv.h"
#include "ofxTweenzor.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"


class Senses_frase {
public:
    string str;
    int begin;
    int end;
};


class Senses : public ofxiOSApp {
	
public:
    
    void setup();
    void update();
    void draw();
    void exit();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    
    int touchMillis;
    
    ofVec2f touchBegin;
    ofVec2f touchPosition;
    
    int currentEffect;
    int totalEffects;
    
    float magicNumber;
    
    float width, height;
    
    
    ofVideoGrabber camera;
    ofxCvColorImage cameraImage;
    int cameraWidth, cameraHeight;

    
    ofxiOSVideoPlayer channels[3];
    int channelWidth, channelHeight;
    int currentChannel;
    
    ofxCvColorImage colorImage;
    ofxCvGrayscaleImage grayImage;
    
    ofxiOSVideoPlayer videoNoise;
    
    ofImage vignette;
    
    
//    vector <ofSoundPlayer> songs;
    ofSoundPlayer soundOcean;
    float oceanVolume;
    
    
    Senses_frase frases[19];
    ofTrueTypeFont font;
    
    
    ofShader shader;
    bool bUseShader;
    ofPoint mousePoint;

    
    bool itemLoaded = false;
    int playlistNumber = 0;
    ofSoundPlayer audio;
    
    ofDirectory playlist;
    
    
    //change 

    
};


