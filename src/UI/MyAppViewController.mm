//
//  MenuViewController.m
//  Created by lukasz karluk on 12/12/11.
//

#import "MyAppViewController.h"

#import "BonUsage.h"
#import "ofxQCAR_ViewController.h"
#import "RAApp.h"
#import "VideoAppViewController.h"
#import "VideoApp.h"

@interface MyAppViewController() {
}
@end

@implementation MyAppViewController

- (id)init {
    self = [super init];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (UIButton*) makeButtonWithFrame:(CGRect)frame 
                          andText:(NSString*)text {
    UIFont *font;
    font = [UIFont fontWithName:@"Georgia" size:10];
    
    UILabel *label;
    label = [[[ UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)] autorelease];
    label.backgroundColor = [UIColor colorWithWhite:1 alpha:0.95];
    label.textColor = [UIColor colorWithWhite:0 alpha:1];
    label.text = [text uppercaseString];
    label.textAlignment = UITextAlignmentCenter;
    label.font = font;
    label.userInteractionEnabled = NO;
    label.exclusiveTouch = NO;
    
    UIButton* button = [[[UIButton alloc] initWithFrame:frame] autorelease];
    [button setBackgroundColor:[UIColor clearColor]];
    [button addSubview:label];
    
    
     
    return button;
}

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    UIImageView* backgroundView;
    backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Accueil.jpg"]] autorelease];
    [self.view addSubview: backgroundView];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    CGRect scrollViewFrame = CGRectMake(0.f,
                                        0.f,
                                        screenRect.size.width,
                                        screenRect.size.height);
    
    UIView* containerView = [[[UIScrollView alloc] initWithFrame:scrollViewFrame] autorelease];
    containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:containerView];

    //NSArray *buttonTitles;
    //buttonTitles = [NSArray arrayWithObjects: @"video", @"RA", @"triangle", @"image", nil];
    
   // NSInteger buttonY = 615;     // make room for navigation bar.
   // NSInteger buttonX = 260;
//    NSInteger buttonGap = 20;
    //NSInteger buttonHeight = (screenRect.size.height - 44) / [buttonTitles count] - buttonGap * ([buttonTitles count] - 1);
    CGRect buttonRect1 = CGRectMake(260, 610, 150, 55);
    //CGRect buttonRect1 = CGRectMake(390, 1380)
    CGRect buttonRect2 = CGRectMake(430, 610, 140, 55);
    //CGRect buttonRect1 = CGRectMake(260, 600, 150, 60);
    
    
    UIImage *img1 = [UIImage imageNamed:@"b-technologie.jpg"];

    
    //for (int i = 0; i < [buttonTitles count]; i++) {
        //UIButton *button;
        //button = [self makeButtonWithFrame:CGRectMake(buttonX, buttonY, buttonRect.size.width, buttonRect.size.height)
        //                           andText:[buttonTitles objectAtIndex:i]];
    
    UIButton *button1, *button2;

//    button1 = [[[UIButton alloc] initWithFrame:CGRectMake(390, 1380, img1.size.width, img1.size.height)] autorelease];
    button1 = [[[UIButton alloc] initWithFrame:CGRectMake(390/2,1380/2, img1.size.width, img1.size.height)] autorelease];

    [button1 setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.1]];
    [button1 setBackgroundImage: img1 forState: UIControlStateHighlighted];
    [button1 addTarget:self action:@selector(button1Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:button1 ];
/*
    button2 = [[[UIButton alloc] initWithFrame:CGRectMake(buttonRect2.origin.x, buttonRect2.origin.y, buttonRect2.size.width, buttonRect1.size.height)] autorelease];
    [button2 setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.1]];
    [button2 addTarget:self action:@selector(button2Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:button2 ];
 */
/*
        if (i== 0)
            [button addTarget:self action:@selector(button1Pressed:) forControlEvents:UIControlEventTouchUpInside];
        else if (i==1)
            [button addTarget:self action:@selector(button2Pressed:) forControlEvents:UIControlEventTouchUpInside];
        else if (i==2)
            [button addTarget:self action:@selector(button3Pressed:) forControlEvents:UIControlEventTouchUpInside];
        else if (i==3)
            [button addTarget:self action:@selector(button4Pressed:) forControlEvents:UIControlEventTouchUpInside];
 

    }*/
    
}

- (void)button1Pressed:(id)sender {
    VideoAppViewController *viewController;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    //return [self initWithFrame:CGRectMake(0, 0, screenSize.height, screenSize.width) app:app];
    viewController = [[[VideoAppViewController alloc] initWithFrame:CGRectMake(0, 0, screenSize.height, screenSize.width)
                                                                app:new VideoApp()] autorelease];
    
    [self.navigationController pushViewController:viewController animated:YES];
    //self.navigationController.navigationBar.topItem.title = @"Video";
    self.navigationController.navigationBarHidden = YES;

}

- (void)button2Pressed:(id)sender {
    ofxQCAR_ViewController * viewController;
    viewController = [[[ofxQCAR_ViewController alloc] initWithAppInLandscapeMode:new RAApp()] autorelease];
    
    [self.navigationController pushViewController:viewController animated:YES];
    //self.navigationController.navigationBar.topItem.title = @"Qualcomm AR";
    self.navigationController.navigationBarHidden = YES;

}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    BOOL bRotate = NO;
    bRotate = bRotate || (toInterfaceOrientation == UIInterfaceOrientationPortrait);
    bRotate = bRotate || (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
    return bRotate;
}


@end
