//
//  UIImageView+RoundEdge.h
//  Surveys_ipad
//
//  Created by Shekhar on 4/22/14.
//  Copyright (c) 2014 App-solutely Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CALayer+RoundEdge.h"

@interface UIView (RoundEdge)

- (void)maskRoundCorners:(UIRectCorner)corners radius:(CGFloat)radius;

- (void)addBottomBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)addLeftBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)addRightBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)addTopBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)addAllBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

@end
