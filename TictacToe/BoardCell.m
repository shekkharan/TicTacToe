//
//  BoardCell.m
//  TictacToe
//
//  Created by Shekhar Sasikumar on 1/25/15.
//  Copyright (c) 2015 Edenred. All rights reserved.
//

#import "BoardCell.h"
#import "UIView+RoundEdge.h"

static NSString *kCross = @"cross";
static NSString *kCircle = @"circle";

@implementation BoardCell

- (void)setNeedsDisplay
{
    [self maskRoundCorners:UIRectCornerAllCorners radius:3];
    [self addAllBorderWithColor:[UIColor grayColor] andWidth:1];
}


+ (BoardCell *)loadBoardCell
{
   BoardCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BoardCell" owner:nil options:nil] objectAtIndex:0];
    return cell;
}

- (void)setData:(CellItem *)cellItem
{
    self.imgPlayer.contentMode = UIViewContentModeScaleAspectFit;
    
    switch (cellItem.user) {
        case 0:
            self.imgPlayer.image = nil;
            break;
        case 1:
            self.imgPlayer.image = [UIImage imageNamed:kCross];
            break;
        case 2:
            self.imgPlayer.image = [UIImage imageNamed:kCircle];
            break;
            
        default:
            break;
    }
}

@end
