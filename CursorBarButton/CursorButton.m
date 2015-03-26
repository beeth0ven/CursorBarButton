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
