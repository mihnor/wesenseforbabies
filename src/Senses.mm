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
            
//            // add the image to the vector
//            string filePath = playlist.getPath(i);
//            songs.push_back(ofSoundPlayer());
//            songs.back().loadSound(filePath);
            
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
	
//    videoNoise.loadMovie("data_app/videos/noise.mov");
//    videoNoise.setLoopState(OF_LOOP_NORMAL);
//    videoNoise.play();
//    videoNoise.setSpeed(0.5);
    
//    vignette.loadImage("data_app/images/vignette.png");
    
//    songs.at(0).play();
//    songs.at(0).setLoop(false);
//
//    songs[0].loadSound("data_app/songs/1.mp3");
//    songs[0].play();
//    songs[0].setLoop(false);
//    songs[1].loadSound("data_app/songs/2.mp3");
////    songs[1].play();
//    songs[1].setLoop(false);
//    songs[2].loadSound("data_app/songs/3.mp3");
////    songs[2].play();
//    songs[2].setLoop(false);
//    songs[3].loadSound("data_app/songs/4.mp3");
////    songs[3].play();
//    songs[3].setLoop(false);
    
    oceanVolume = 0;
    soundOcean.load("data_app/sounds/ocean.mp3");
    soundOcean.play();
    soundOcean.setVolume(oceanVolume);
    soundOcean.setLoop(true);
    
    
    font.load("data_app/fonts/PFDinDisplayPro-Bold.ttf", 60, true, false, true, 1, 72);
    
    
//    shader.load("data_app/shaders/noise.vert", "data_app/shaders/noise.frag");
//    bUseShader = true;
    
    
    
    
    frases[0].str = "UM ENORME RABO DE BALEIA";
    frases[0].begin = 10530;
    frases[0].end = 14268;
    
    frases[1].str = "CRUZARIA A SALA NESSE MOMENTO";
    frases[1].begin = 14268;
    frases[1].end = 18947;
    
    frases[2].str = "SEM BARULHO ALGUM O BICHO";
    frases[2].begin = 29291;
    frases[2].end = 32380;
    
    frases[3].str = "AFUNDARIA NAS TÁBUAS CORRIDAS";
    frases[3].begin = 32380;
    frases[3].end = 36559;
    
    frases[4].str = "E SUMIRIA SEM QUE PERCEBÊSSEMOS";
    frases[4].begin = 39114;
    frases[4].end = 49528;
    
    frases[5].str = "NO SOFÁ A FALTA DE ASSUNTO";
    frases[5].begin = 49528;
    frases[5].end = 55293;
    
    frases[6].str = "O QUE EU QUERIA MAS NÃO TE CONTO";
    frases[6].begin = 999999;
    frases[6].end = 999999;
    
    frases[7].str = "É ABRAÇAR A BALEIA MERGULHAR COM ELA";
    frases[7].begin = 999999;
    frases[7].end = 999999;
    
    frases[8].str = "SINTO UM TÉDIO PAVOROSO DESSES DIAS";
    frases[8].begin = 999999;
    frases[8].end = 999999;
    
    frases[9].str = "DE ÁGUA PARADA ACUMULANDO MOSQUITO";
    frases[9].begin = 999999;
    frases[9].end = 999999;
    
    frases[10].str = "APESAR DA AGITAÇÃO DOS DIAS";
    frases[10].begin = 999999;
    frases[10].end = 999999;
    
    frases[11].str = "DA EXAUSTÃO DOS DIAS";
    frases[11].begin = 999999;
    frases[11].end = 999999;
    
    frases[12].str = "O CORPO QUE CHEGA EXAUSTO EM CASA";
    frases[12].begin = 999999;
    frases[12].end = 999999;
    
    frases[13].str = "COM A MÃO ESTICADA EM BUSCA";
    frases[13].begin = 999999;
    frases[13].end = 999999;
    
    frases[14].str = "DE UM COPO D’ÁGUA";
    frases[14].begin = 999999;
    frases[14].end = 999999;
    
    frases[15].str = "A URGÊNCIA DE SEGUIR PARA UMA TERÇA";
    frases[15].begin = 999999;
    frases[15].end = 999999;
    
    frases[16].str = "OU QUARTA BOIA E A VONTADE";
    frases[16].begin = 999999;
    frases[16].end = 999999;
    
    frases[17].str = "É DE ABRAÇAR UM ENORME";
    frases[17].begin = 999999;
    frases[17].end = 999999;
    
    frases[18].str = "RABO DE BALEIA SEGUIR COM ELA";
    frases[18].begin = 999999;
    frases[18].end = 999999;
    
    
    /*
     UM ENORME RABO DE BALEIA
     CRUZARIA A SALA NESSE MOMENTO
     SEM BARULHO ALGUM O BICHO
     AFUNDARIA NAS TÁBUAS CORRIDAS
     E SUMIRIA SEM QUE PERCEBÊSSEMOS
     NO SOFÁ A FALTA DE ASSUNTO
     O QUE EU QUERIA MAS NÃO TE CONTO
     É ABRAÇAR A BALEIA MERGULHAR COM ELA
     SINTO UM TÉDIO PAVOROSO DESSES DIAS
     DE ÁGUA PARADA ACUMULANDO MOSQUITO
     APESAR DA AGITAÇÃO DOS DIAS
     DA EXAUSTÃO DOS DIAS
     O CORPO QUE CHEGA EXAUSTO EM CASA
     COM A MÃO ESTICADA EM BUSCA
     DE UM COPO D’ÁGUA
     A URGÊNCIA DE SEGUIR PARA UMA TERÇA
     OU QUARTA BOIA E A VONTADE
     É DE ABRAÇAR UM ENORME
     RABO DE BALEIA SEGUIR COM ELA
     */
    
    channels[currentChannel].load("data_app/videos/channels/"+ofToString(currentChannel)+".mp4");
    channels[currentChannel].setLoopState(OF_LOOP_NORMAL);
    channels[currentChannel].setVolume(0);
    channels[currentChannel].play();

    
}

//--------------------------------------------------------------
void Senses::update(){
    
//    ofSoundUpdate();
    
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
    
//    if(videoNoise.isLoaded()) {
//        videoNoise.update();
//    }
    
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
//        cout << "Playing audio..."<< playlistNumber << " of " << playlist.numFiles() <<endl;
    }else{
        audio.unloadSound();
        playlistNumber++;
        itemLoaded = false;
    }
    
    
    ofPushStyle();
    
    
//    ofBackground(255);
    
//    colorImage.draw(0, 0, width, height);

    
    channels[currentChannel].getTexturePtr()->draw(0,0, ofGetWidth(),ofGetHeight());
    
//                ofLog() << "Postion: " << channels[currentChannel].getPosition();
//	glEnable(GL_BLEND);
//	glBlendFunc(GL_SRC_ALPHA, GL_SRC_COLOR);
    
    // camera
//	ofSetColor(255, 100);
//    grayImage.draw(0, 0, width, height);
    
    //noise
//    ofSetColor(255, 0);
//    videoNoise.getTexture()->draw(0, 0, width, height);

//    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
//    glDisable(GL_BLEND);
//	ofEnableAlphaBlending();
    
    // vignette
//    ofSetColor(255,100);
//    vignette.draw(0, 0, width, height);
    
    
    
    
    
    //    cout<<soundRaboDeBaleia.getPositionMS()<<endl;
    
    
//    int millis = songs[0].getPositionMS();
    
//    for (int i = 0; i < 19; i++) {
//        if (millis > frases[i].begin && millis < frases[i].end) {
//            
//            float alpha;
//            if (millis < frases[i].begin+1000) {
//                alpha = ofMap(millis, frases[i].begin, frases[i].begin+1000, 0, 255);
//            } else if (millis > frases[i].end-1000) {
//                alpha = ofMap(millis, frases[i].end-1000, frases[i].end, 255, 0);
//            } else {
//                alpha = 255;
//            }
//            
//            switch (currentEffect) {
//                case 0:
//                    for (int j = 0; j < 9; j++) {
//                        if (j < 5) {
//                            ofSetColor(0, alpha*((j+1)/5.f));
//                        } else {
//                            ofSetColor(0, alpha*(4.f/j));
//                        }
//                        ofRectangle rect = font.getStringBoundingBox(frases[i].str, 0, 0);
//                        font.drawString(frases[i].str, (width-rect.width)/2.f, (touchPosition.y)-(50*(j-5)));
//                    }
//                    break;
//                    
//                case 1:;
//                    ofSetColor(0, alpha);
//                    ofFill();
//                    
//                    shader.begin();
//                    shader.setUniform1f("timeValX", ofGetElapsedTimef() * 0.1 );     // we want to pass in some varrying values to animate our type / color
//                    shader.setUniform1f("timeValY", -ofGetElapsedTimef() * 0.18 );
//                    shader.setUniform2f("mouse", mousePoint.x, mousePoint.y);        // we also pass in the mouse position
//                    
//                    ofRectangle rect = font.getStringBoundingBox(frases[i].str, 0, 0);
//                    font.drawStringAsShapes(frases[i].str, (width-rect.width)/2.f, touchPosition.y+(rect.height/2.f));
//                    
//                    shader.end();
//                    break;
//            }
//            
//        }
//    }
    
    ofPopStyle();
    
}

//--------------------------------------------------------------
void Senses::exit(){
    
    Tweenzor::destroy();

//    camera.close();
    for (int i = 0; i < 3; i++) {
        channels[i].close();
    }
//    videoNoise.close();
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
    
    channels[currentChannel].setPosition(ofRandom(0, 1));

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
    if (ofGetElapsedTimeMillis() - touchMillis < 1000) {
        if (currentChannel > -1) {
            channels[currentChannel].close();
        }
        currentChannel = floor(ofRandom(3));
        if (currentChannel == 3) {
            currentChannel = 0;
        } else {
            channels[currentChannel].load("data_app/videos/channels/"+ofToString(currentChannel)+".mp4");
//            channels[currentChannel].setLoopState(OF_LOOP_NORMAL);
            channels[currentChannel].setPaused(true);

            channels[currentChannel].setLoopState(OF_LOOP_PALINDROME);
            channels[currentChannel].setVolume(0);
//            channels[currentChannel].setFrame(1000);
            channels[currentChannel].play();
            
//            channels[currentChannel].setPosition(0.035);
            ofLog() << "POSITION : " << channels[currentChannel].getPosition();
            


        }
        
    }
}

