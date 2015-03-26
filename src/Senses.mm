#include "Senses.h"

#import "VideoPlayerControls.h"
#import "VideoPlayerControlsDelegateForOF.h"
#import "AVFoundationVideoPlayer.h"

//--------------------------------------------------------------
void Senses::setup(){
    
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    ofSetFrameRate(30);
    ofEnableAlphaBlending();
    
    Tweenzor::init();
    
    
    
    int nFiles = playlist.listDir("data_app/songs");
    if(nFiles) {
        
        for(int i=0; i<playlist.numFiles(); i++) {
            
            
        }
        
    }
    else {
        ofLog() << "Could not find folder\n";
    }
    
    magicNumber = 0;
    currentEffect = 0;
    totalEffects = 2;
    
    currentChannel = 2;
    
    width = ofGetWidth();
    height = ofGetHeight();
    
    
    touchBegin = ofVec2f(0,0);
    touchPosition = touchBegin;
    
    
    channelWidth = 320;
    channelHeight = 240;
    for (int i = 0; i < 19; i++) {
    }
    
    //    camera.listDevices();
    //    camera.setDeviceID(1);
    //    camera.initGrabber(channelWidth, channelHeight);
    //    cameraWidth = camera.getWidth();
    //	cameraHeight = camera.getHeight();
    //	cameraImage.allocate(cameraWidth, cameraHeight);
    
    colorImage.allocate(width, height);
    grayImage.allocate(channelWidth, channelHeight);
    
    
    oceanVolume = 0;
    soundOcean.load("data_app/sounds/ocean.mp3");
    soundOcean.play();
    soundOcean.setVolume(oceanVolume);
    soundOcean.setLoop(true);
    
    
    font.load("data_app/fonts/PFDinDisplayPro-Bold.ttf", 60, true, false, true, 1, 72);

    
    channels[currentChannel].load("data_app/videos/channels/"+ofToString(currentChannel)+".mp4");
    channels[currentChannel].setLoopState(OF_LOOP_NORMAL);
    channels[currentChannel].setVolume(0);
    channels[currentChannel].play();
    
    
}

//--------------------------------------------------------------
void Senses::update(){
    
        ofSoundUpdate();
    
    if (playlistNumber> playlist.numFiles() -1)
    {
        playlistNumber = 0;
        //        cout << "Playlist reset"<< endl;
    }
    if (!itemLoaded){
        //        cout << "Loading audio..."<< playlist.getPath(playlistNumber) << endl;
        audio.loadSound(playlist.getPath(playlistNumber));
        audio.play();
        itemLoaded = true;
    }
    
    
    Tweenzor::update( ofGetElapsedTimeMillis() );
    
    width = ofGetWidth();
    height = ofGetHeight();
    
    if (currentChannel == -1) {
        //        camera.update();
        //        if(camera.isFrameNew()) {
        //            cameraImage.setFromPixels(camera.getPixels(), cameraWidth, cameraHeight);
        //            colorImage.scaleIntoMe(cameraImage);
        //            grayImage.setFromColorImage(colorImage);
        //            grayImage.blur(5);
        //            grayImage.brightnessContrast(0.3,-0.2);
        //            grayImage.mirror(true, false);
        //        }
    } else {
        if(channels[currentChannel].isLoaded()) {
            channels[currentChannel].update();
            //            colorImage.setFromPixels(channels[currentChannel].);
            //            colorImage.setFromPixels(channels[currentChannel].getPixels().getData(), width, height);
            //            grayImage.setFromColorImage(colorImage);
            //            grayImage.blur(3);
        }else{
            
        }
    }
    
    
    soundOcean.setVolume(oceanVolume);
    
}

//--------------------------------------------------------------
void Senses::draw(){
    
    if (audio.getIsPlaying())
    {

    }else{
        audio.unloadSound();
        playlistNumber++;
        itemLoaded = false;
    }
    
    
    ofPushStyle();
    
    
    channels[currentChannel].getTexturePtr()->draw(0,0, ofGetWidth(),ofGetHeight());
    
    // camera
    //	ofSetColor(255, 100);
    //    grayImage.draw(0, 0, width, height);
    
    
    // vignette
    //    ofSetColor(255,100);
    //    vignette.draw(0, 0, width, height);
 
    
    ofPopStyle();
    
    
    
}

//--------------------------------------------------------------
void Senses::exit(){
    
    Tweenzor::destroy();
    
    //    camera.close();
    for (int i = 0; i < 3; i++) {
        channels[i].close();
    }
}

//--------------------------------------------------------------
void Senses::touchDown(ofTouchEventArgs & touch){
    touchBegin = touch;
    touchPosition = touch;
    
    touchMillis = ofGetElapsedTimeMillis();
    
    currentEffect++;
    if (currentEffect >= totalEffects) {
        currentEffect = 0;
    }
    
    Tweenzor::add(&oceanVolume, oceanVolume, 1.f, 0.f, 1.f-oceanVolume);
    

    
    
}

//--------------------------------------------------------------
void Senses::touchMoved(ofTouchEventArgs & touch){
    touchPosition = touch;
    magicNumber = ofMap(ofDist(touchBegin.x, touchBegin.y, touchPosition.x, touchPosition.y), 0, width, 0, 1);
    
    // we have to transform the coords to what the shader is expecting which is 0,0 in the center and y axis flipped.
    mousePoint.x = touch.x * 2 - width;
    mousePoint.y = height * 0.5 - touch.y;
}

//--------------------------------------------------------------
void Senses::touchUp(ofTouchEventArgs & touch){
    
    Tweenzor::add(&oceanVolume, oceanVolume, 0.f, 0.f, oceanVolume);
    
    
    
    // TAP = change channel
    if (ofGetElapsedTimeMillis() - touchMillis < 400) {
        int actual = currentChannel;
        int next = floor(ofRandom(2.9));
        while (actual == next) {
            next = floor(ofRandom(2.9));
        }
        channels[currentChannel].close();
        currentChannel = next;
      
            channels[currentChannel].load("data_app/videos/channels/"+ofToString(currentChannel)+".mp4");
            channels[currentChannel].setLoopState(OF_LOOP_PALINDROME);
            channels[currentChannel].setVolume(0);
            channels[currentChannel].play();
            if(currentChannel > 0){
                channels[currentChannel].setSpeed(1.5);
            }
            
            
            
            
    }else{
        channels[currentChannel].setPosition(ofRandom(0, 1));
    }
    
    
    
}

