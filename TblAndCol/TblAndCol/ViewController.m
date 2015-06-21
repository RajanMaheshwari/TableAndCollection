//
//  ViewController.m
//  TblAndCol
//
//  Created by Rajan Maheshwari on 21/06/15.
//  Copyright (c) 2015 rajanmaheshwari. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "MyTableViewCell.h"
@interface ViewController ()
{
    MyTableViewCell* tableViewCell;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView Delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   tableViewCell=(MyTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell"];
    if(tableViewCell==nil)
    {
        tableViewCell=[[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyTableViewCell"];
    }
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [tableViewCell.collectionView setPagingEnabled:YES];
    [tableViewCell.collectionView setCollectionViewLayout:flowLayout];
    [tableViewCell.collectionView setBackgroundColor:[UIColor whiteColor]];
    tableViewCell.pageControl.tag=indexPath.row;
    tableViewCell.collectionView.tag=indexPath.row;
    NSLog(@"Index path row %ld",indexPath.row);
    [tableViewCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    tableViewCell.path=indexPath;

    return tableViewCell;
}

#pragma mark CollectionView Delegates

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     MyCollectionViewCell* cell=(MyCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    if(cell==nil)
    {
        cell=[[MyCollectionViewCell alloc]initWithFrame:CGRectMake(0, 0, collectionView.frame.size.width, collectionView.frame.size.height)];
    }
    [cell.myLabel setText:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return collectionView.frame.size;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    

    if ([scrollView isKindOfClass:[UICollectionView class]])
    {
        UICollectionView *mainCollection = (UICollectionView *) scrollView;

        NSIndexPath *myIP = [NSIndexPath indexPathForRow:mainCollection.tag inSection:0];

        MyTableViewCell *cell = (MyTableViewCell *)[self.tableView cellForRowAtIndexPath:myIP];
        
        CGRect visibleRect = (CGRect){.origin = mainCollection.contentOffset, .size = mainCollection.bounds.size};
        CGPoint visiblePoint = CGPointMake(CGRectGetMidX(visibleRect), CGRectGetMidY(visibleRect));
        NSIndexPath *visibleIndexPath = [mainCollection indexPathForItemAtPoint:visiblePoint];
        NSLog(@"visibleIndexPath %ld",(long)visibleIndexPath.row);
    
        
        [cell.pageControl setCurrentPage:visibleIndexPath.row];
    }
    
}



@end
