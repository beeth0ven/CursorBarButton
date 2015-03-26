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
    [self setUp];
}

- (void)setUp {
    CursorButton *cursorButton = [CursorButton cursorButton];
    [cursorButton addTarget:self
                     action:@selector(changeSelectState:)
           forControlEvents:UIControlEventTouchUpInside];
    self.cursorBarButtonItem.customView = cursorButton;
}


- (IBAction)changeSelectState:(CursorButton *)sender {
    sender.on = !sender.isOn;
}




@end
