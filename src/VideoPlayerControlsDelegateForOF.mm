//
//  VideoPlayerControlsDelegateForOF.m
//  moviePlayerExample
//
//  Created by lukasz karluk on 6/06/12.
//

#import "VideoPlayerControlsDelegateForOF.h"

@implementation VideoPlayerControlsDelegateForOF {
    //
}

- (id)initWithApp:(ofApp *)myApp {
    self = [super init];
    if(self) {
        app = myApp;
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

@end
