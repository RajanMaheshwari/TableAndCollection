//
//  ViewController.h
//  TblAndCol
//
//  Created by Rajan Maheshwari on 21/06/15.
//  Copyright (c) 2015 rajanmaheshwari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

