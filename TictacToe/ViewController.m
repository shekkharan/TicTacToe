//
//  ViewController.m
//  TictacToe
//
//  Created by Shekhar  on 22/1/15.
//  Copyright (c) 2015 Edenred. All rights reserved.
//

#import "ViewController.h"
#import "CellItem.h"
#import "BoardCell.h"

static NSString *kPlayer1 = @"Player 1";
static NSString *kPlayer2 = @"Player 2";

@interface ViewController ()
{
    int gridCount;
    int turnCount;
}
@property(nonatomic,strong) NSMutableArray *cellItems;
@property (weak, nonatomic) IBOutlet UICollectionView *cvBoard;
@property (assign, nonatomic) UserType user;
@property (strong, nonatomic) NSString *userType;
@property (weak, nonatomic) IBOutlet UILabel *lblPlayerStatus;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.cvBoard registerNib:[UINib nibWithNibName:@"BoardCell" bundle:nil] forCellWithReuseIdentifier:@"cellIdentifier"];
    gridCount = 3;
    [self resetGame];

}

#pragma mark - UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1) {
        [self resetGame];
    }
    
}

#pragma mark - Implementation

- (void)resetGame
{
    self.user = 1;
    self.userType = kPlayer1;
    turnCount = 0;
    self.lblPlayerStatus.text = [NSString stringWithFormat:@"%@'s turn",self.userType];
    self.cellItems = [NSMutableArray array];
    for (int i = 0; i < gridCount; i++) {
        
        NSMutableArray *rowArray = [NSMutableArray array];
        for(int j = 0;j < gridCount; j++)
        {
            CellItem *item = [[CellItem alloc]init];
            item.row = i;
            item.column = j;
            item.user = 0;
            [rowArray addObject:item];
            
        }
        [self.cellItems addObject:rowArray];
    }
    [self.cvBoard reloadData];
}

- (void)cellClicked:(UserType)user row:(int)row
{
    CellItem * item = [[self.cellItems objectAtIndex:row/gridCount] objectAtIndex:row%gridCount];
    if (item.user == 0) {
        item.user = user;
        [self.cvBoard reloadData];
        if (![self checkWinWithCellitem:item]) {
            turnCount++;
            if (turnCount != gridCount*gridCount) {
                switch (self.user) {
                    case 1:
                    {
                        self.user = 2;
                        self.userType = kPlayer2;
                    }
                        break;
                    case 2:
                    {
                        self.user = 1;
                        self.userType = kPlayer1;
                    }
                        break;
                        
                    default:
                        break;
                }
                self.lblPlayerStatus.text = [NSString stringWithFormat:@"%@'s turn",self.userType];
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Game Over" message:@"Drawn" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                alert.tag = 1;
                [alert show];
            }
        }
        else
        {
            NSString *alertMsg = [NSString stringWithFormat:@"%@ has won",self.userType];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Game Over" message:alertMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            alert.tag = 1;
            [alert show];
        }
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Cell taken" message:@"Please choose another one" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        alert.tag = 2;
        [alert show];
    }
}

- (BOOL)checkWinWithCellitem:(CellItem *)item
{
    BOOL rowWin = YES;
    BOOL colWin = YES;
    
    //left to right diagonal
    BOOL lrdiagionalWin = YES;
    
     //right to left diagonal
    BOOL rldiagionalWin = YES;
    int rowIndex = item.row;
    int columnIndex = item.column;
  
    for(int i = 0; i < gridCount; i++)
    {
        if (!(rowWin||colWin||lrdiagionalWin||rldiagionalWin)) break;
        
        //check row
        if (rowWin) {
            CellItem * rowItem = [[self.cellItems objectAtIndex:rowIndex] objectAtIndex:i];
            if (item.user != rowItem.user) {
                rowWin = NO;
            }
        }

        //check row
        if (colWin) {
        CellItem * colItem = [[self.cellItems objectAtIndex:i]objectAtIndex:columnIndex];
        if (item.user != colItem.user) {
            colWin = NO;
        }
        }
        
        //left to right diagonal
        if (lrdiagionalWin) {
            CellItem * lrdiagonalItem = [[self.cellItems objectAtIndex:i]objectAtIndex:i];
            if (item.user != lrdiagonalItem.user) {
                lrdiagionalWin = NO;
            }
        }
        
        //right to left diagonal
        if (rldiagionalWin) {
            CellItem * rldiagonalItem = [[self.cellItems objectAtIndex:i]objectAtIndex:gridCount - 1 - i];
            if (item.user != rldiagonalItem.user) {
                rldiagionalWin = NO;
            }
        }
    }
    return (rowWin||colWin||lrdiagionalWin||rldiagionalWin);
}

#pragma mark - UICollectionViewDataSource & Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return gridCount*gridCount;
}

- (BoardCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BoardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    CellItem *cellItem = [[self.cellItems objectAtIndex:indexPath.row/gridCount] objectAtIndex:indexPath.row%gridCount];
    if (!cell) cell = [BoardCell loadBoardCell];
    
    // Configure the cell...
    [cell setData:cellItem];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.user) {
        case 1:
            self.userType = kPlayer1;
            break;
        case 2:
            self.userType = kPlayer2;
            break;
            
        default:
            break;
    }
    [self cellClicked:self.user row:(int)indexPath.row];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
