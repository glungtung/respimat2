//
//  CustomAppViewController.m
//  Created by lukasz karluk on 8/02/12.
//

#import "RAAppViewController.h"
#import "ofxiPhoneExtras.h"

@implementation RAAppViewController

- (id) initWithFrame:(CGRect)frame app:(ofxiPhoneApp *)app {
    
    ofxiPhoneGetOFWindow()->setOrientation( OF_ORIENTATION_DEFAULT );
    
    return self = [super initWithFrame:frame app:app];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return NO;
}

@end
