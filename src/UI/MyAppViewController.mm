//
//  MenuViewController.m
//  Created by lukasz karluk on 12/12/11.
//

#import "MyAppViewController.h"

#import "ofxQCAR_ViewController.h"
#import "RAApp.h"
#import "RABroncheApp.h"
#import "VideoAppViewController.h"
#import "UtilisationApp.h"
#import "BonUsage.h"
#import "MentionsLegales.h"

#import "dataLoader.h"


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
    
    UIView* containerView = [[[UIView alloc] initWithFrame:scrollViewFrame] autorelease];
    containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:containerView];

    //NSArray *buttonTitles;
    //buttonTitles = [NSArray arrayWithObjects: @"video", @"RA", @"triangle", @"image", nil];
    
   // NSInteger buttonY = 615;     // make room for navigation bar.
   // NSInteger buttonX = 260;
//    NSInteger buttonGap = 20;
    //NSInteger buttonHeight = (screenRect.size.height - 44) / [buttonTitles count] - buttonGap * ([buttonTitles count] - 1);
    //CGRect buttonRect1 = CGRectMake(390, 1380)
    //CGRect buttonRect1 = CGRectMake(260, 600, 150, 60);

//    (UIScrollView*)(contain
    
    UIImage *img1 = [UIImage imageNamed:@"Bouton-accueil01-x404-y1389.jpg"];
    CGRect buttonRect1 = CGRectMake(404/2, 1389/2, img1.size.width/2, img1.size.height/2);

    UIImage *img2 = [UIImage imageNamed:@"Bouton-accueil02-x718-y1389.jpg"];
    CGRect buttonRect2 = CGRectMake(718/2, 1389/2, img2.size.width/2, img2.size.height/2);

    UIImage *img3 = [UIImage imageNamed:@"Bouton-accueil03-x1047-y1389.jpg"];
    CGRect buttonRect3 = CGRectMake(1047/2, 1389/2, img3.size.width/2, img3.size.height/2);
    
    UIImage *img4 = [UIImage imageNamed:@"Bouton-accueil04-x1419-y1389.jpg"];
    CGRect buttonRect4 = CGRectMake(1419/2, 1389/2, img4.size.width/2, img4.size.height/2);
    
    CGRect buttonRectLegal = CGRectMake(1370/2, 40/2, 250/2, 118/2);
    
    //for (int i = 0; i < [buttonTitles count]; i++) {
        //UIButton *button;
        //button = [self makeButtonWithFrame:CGRectMake(buttonX, buttonY, buttonRect.size.width, buttonRect.size.height)
        //                           andText:[buttonTitles objectAtIndex:i]];
    
    
    UIButton *button1, *button2, *button3, *button4, *buttonLegal;

//    button1 = [[[UIButton alloc] initWithFrame:CGRectMake(390, 1380, img1.size.width, img1.size.height)] autorelease];
    button1 = [[[UIButton alloc] initWithFrame:CGRectMake(buttonRect1.origin.x, buttonRect1.origin.y, buttonRect1.size.width, buttonRect1.size.height)] autorelease];
   //[button1 setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.1]];
    [button1 setBackgroundImage: img1 forState: UIControlStateHighlighted];
    [button1 addTarget:self action:@selector(button1Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:button1 ];

    button2 = [[[UIButton alloc] initWithFrame:CGRectMake(buttonRect2.origin.x, buttonRect2.origin.y, buttonRect2.size.width, buttonRect2.size.height)] autorelease];
    //[button2 setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.1]];
    [button2 setBackgroundImage: img2 forState: UIControlStateHighlighted];
    [button2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:button2 ];

    button3 = [[[UIButton alloc] initWithFrame:CGRectMake(buttonRect3.origin.x, buttonRect3.origin.y, buttonRect3.size.width, buttonRect3.size.height)] autorelease];
    [button3 setBackgroundImage: img3 forState: UIControlStateHighlighted];
    [button3 addTarget:self action:@selector(button3Action:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:button3 ];
 
    button4 = [[[UIButton alloc] initWithFrame:CGRectMake(buttonRect4.origin.x, buttonRect4.origin.y, buttonRect4.size.width, buttonRect4.size.height)] autorelease];
    [button4 setBackgroundImage: img4 forState: UIControlStateHighlighted];
    [button4 addTarget:self action:@selector(button4Action:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:button4 ];
    
    buttonLegal = [[[UIButton alloc] initWithFrame:CGRectMake(buttonRectLegal.origin.x, buttonRectLegal.origin.y, buttonRectLegal.size.width, buttonRectLegal.size.height)] autorelease];
    [buttonLegal addTarget:self action:@selector(buttonLegalAction:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:buttonLegal ];
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
    ofxQCAR_ViewController * viewController;
    RAApp * ra = new RAApp();
    viewController = [[[ofxQCAR_ViewController alloc] initWithAppInLandscapeMode:ra] autorelease];
    ra->mainController = self;

    [self.navigationController pushViewController:viewController animated:YES];
    //self.navigationController.navigationBar.topItem.title = @"Qualcomm AR";
    self.navigationController.navigationBarHidden = YES;

}


- (void)button2Action:(UIButton*)b {
    // Basic view controller (should not be named Video...)
    VideoAppViewController *viewController;
    UtilisationApp *utilisation = new UtilisationApp();
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    viewController = [[[VideoAppViewController alloc] initWithFrame:CGRectMake(0, 0, screenSize.height, screenSize.width)
                                                                app:utilisation] autorelease];
    utilisation->mainController = self;
    [self.navigationController pushViewController:viewController animated:YES];
    //self.navigationController.navigationBar.topItem.title = @"Video";
    self.navigationController.navigationBarHidden = YES;
}

- (void)button3Action:(id)sender {
    ofxQCAR_ViewController * viewController;
    RABroncheApp * ra = new RABroncheApp();
    viewController = [[[ofxQCAR_ViewController alloc] initWithAppInLandscapeMode:ra] autorelease];
    ra->mainController = self;
    
    [self.navigationController pushViewController:viewController animated:YES];
    //self.navigationController.navigationBar.topItem.title = @"Qualcomm AR";
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)button4Action:(UIButton*)b {
    // Basic view controller (should not be named Video...)
    VideoAppViewController *viewController;
    BonUsage *bonUsage = new BonUsage();
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    viewController = [[[VideoAppViewController alloc] initWithFrame:CGRectMake(0, 0, screenSize.height, screenSize.width)
                                                                app:bonUsage] autorelease];
    bonUsage->mainController = self;
    [self.navigationController pushViewController:viewController animated:YES];
    //self.navigationController.navigationBar.topItem.title = @"Video";
    self.navigationController.navigationBarHidden = YES;
}

- (void)buttonLegalAction:(UIButton*)b {
    // Basic view controller (should not be named Video...)
    VideoAppViewController *viewController;
    MentionsLegales *mentionL = new MentionsLegales();
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    viewController = [[[VideoAppViewController alloc] initWithFrame:CGRectMake(0, 0, screenSize.height, screenSize.width)
                                                                app:mentionL] autorelease];
    mentionL->mainController = self;
    [self.navigationController pushViewController:viewController animated:YES];
    //self.navigationController.navigationBar.topItem.title = @"Video";
    self.navigationController.navigationBarHidden = YES;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    BOOL bRotate = NO;
    //bRotate = bRotate || (toInterfaceOrientation == UIInterfaceOrientationPortrait);
    //bRotate = bRotate || (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
    return bRotate;
}


@end
