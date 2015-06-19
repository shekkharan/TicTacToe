//
//  UIImageView+RoundEdge.m
//  Surveys_ipad
//
//  Created by Shekhar on 4/22/14.
//  Copyright (c) 2014 App-solutely Private Limited. All rights reserved.
//

#import "UIView+RoundEdge.h"


@implementation UIView (RoundEdge)

- (void)maskRoundCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    // To round all corners, we can just set the radius on the layer
    if ( corners == UIRectCornerAllCorners ) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    } else {
        // If we want to choose which corners we want to mask then
        // it is necessary to create a mask layer.
        self.layer.mask = [CALayer maskLayerWithCorners:corners radii:CGSizeMake(radius, radius) frame:self.bounds];
    }
}

- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
}

- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(self.frame.size.width, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
}

- (void)addAllBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
    
}


@end
