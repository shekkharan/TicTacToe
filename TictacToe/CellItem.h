//
//  CellItem.h
//  TictacToe
//
//  Created by Shekhar  on 22/1/15.
//  Copyright (c) 2015 Edenred. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    kNOUser = 0,
    kUser1 =  1,
    kUser2 =  2
}UserType;

@interface CellItem : NSObject

@property(nonatomic,assign)UserType user;
@property(nonatomic,assign)int row;
@property(nonatomic,assign)int column;
//@property(nonatomic,assign)BOOL isEmpty;



@end
