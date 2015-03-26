//
//  CursorButton.m
//  CursorBarButton
//
//  Created by luojie on 3/26/15.
//  Copyright (c) 2015 luojie. All rights reserved.
//

#import "CursorButton.h"
#import "Paths.h"
#import "CGPath+Extension.h"

@interface CursorButton ()

@property (strong, nonatomic) CAShapeLayer *cursorShap;

@property (nonatomic) CGFloat lineWith;

@property (strong, nonatomic) UIColor *notFavoriteColor;

@property (strong, nonatomic) UIColor *cursorFavoriteColor;

@property (nonatomic) CGFloat pathScale;


@end


@implementation CursorButton

#pragma mark - Instancetype Method

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame
                     pathScale:(CGFloat)pathScale {
    self = [self initWithFrame:frame];
    _pathScale = pathScale;
    return self;
}

+ (CursorButton *)cursorButton {

    //pathScale control the path scale, For example value 1 is full screen in the frame;
    CGFloat pathScale = 0.5;
    CursorButton *cursorButton = [[CursorButton alloc] initWithFrame:CGRectMake(0,
                                                                                0,
                                                                                44 * pathScale,
                                                                                44)
                                                           pathScale:pathScale];
    
    return cursorButton;
}

#pragma mark - Property Setter And Getter Method



- (UIColor *)notFavoriteColor {
    return [UIColor grayColor];
}

- (UIColor *)cursorFavoriteColor {
    return [UIColor blueColor];
}

- (void)setOn:(BOOL)on {
    _on  = on;
    [self updateLayerProperties];
    
}

#pragma mark - Layout Method


- (void)layoutSubviews {
    [super layoutSubviews];
    [self createLayersIfNeeded];
    [self updateConstraints];
    
}


- (void)createLayersIfNeeded {
    
    if (self.cursorShap == nil) {
        CGRect cursorFrame = self.bounds;
        cursorFrame.size.width  = CGRectGetWidth(cursorFrame);
        cursorFrame.size.height = CGRectGetHeight(cursorFrame) * self.pathScale;
        
        self.cursorShap = [[CAShapeLayer alloc] init];
        
        self.cursorShap.path = CGPathRescaleForFrame([Paths cursor], cursorFrame);
        self.cursorShap.bounds = CGPathGetBoundingBox(self.cursorShap.path);
        self.cursorShap.fillColor = self.notFavoriteColor.CGColor;
        self.cursorShap.position = CGPointMake(CGRectGetWidth(self.frame)/2,
                                               CGRectGetHeight(self.frame)/2);
        
        self.cursorShap.transform = CATransform3DIdentity;
        self.cursorShap.opacity = 0.5;
        [self.layer addSublayer:self.cursorShap];
        
    }
    [self updateLayerProperties];
}

- (void)updateLayerProperties {
    if (self.cursorShap != nil) {
        self.cursorShap.fillColor = self.isOn ? self.cursorFavoriteColor.CGColor : self.notFavoriteColor.CGColor;
        
    }
}


@end
