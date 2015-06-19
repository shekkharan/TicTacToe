//
//  BoardCell.h
//  TictacToe
//
//  Created by Shekhar Sasikumar on 1/25/15.
//  Copyright (c) 2015 Edenred. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellItem.h"

@interface BoardCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgPlayer;

- (void)setData:(CellItem *)cellItem;
+ (BoardCell *)loadBoardCell;

@end
