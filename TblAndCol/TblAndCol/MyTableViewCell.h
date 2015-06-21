//
//  MyTableViewCell.h
//  TblAndCol
//
//  Created by Rajan Maheshwari on 21/06/15.
//  Copyright (c) 2015 rajanmaheshwari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSIndexPath * path;
@end
