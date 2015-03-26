//
//  ViewController.m
//  CursorBarButton
//
//  Created by luojie on 3/25/15.
//  Copyright (c) 2015 luojie. All rights reserved.
//

#import "ViewController.h"
#import "Paths.h"
#import "CursorButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cursorBarButtonItem;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.cursorBarButtonItem.customView = [self cursorButton];
}


- (IBAction)changeSelectState:(CursorButton *)sender {
    sender.on = !sender.isOn;
}


- (CursorButton *)cursorButton {
    
    //pathScale control the path scale, For example value 1 is full screen in the frame;
    CGFloat pathScale = 0.5;
    CursorButton *cursorButton = [[CursorButton alloc] initWithFrame:CGRectMake(0,
                                                                                0,
                                                                                44 * pathScale,
                                                                                44)
                                                           pathScale:pathScale];
    
    cursorButton.on = NO;
    [cursorButton addTarget:self
                     action:@selector(changeSelectState:)
           forControlEvents:UIControlEventTouchUpInside];
    return cursorButton;
}



@end
