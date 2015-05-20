//
//  XDSegmentControlTVC.h
//  XDSegmentControlTableView
//
//  Created by jack on 15/5/19.
//  Copyright (c) 2015年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDSegmentControlTVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *titleArray;

@end
