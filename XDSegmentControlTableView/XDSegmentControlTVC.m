//
//  XDSegmentControlTVC.m
//  XDSegmentControlTableView
//
//  Created by jack on 15/5/19.
//  Copyright (c) 2015年 jack. All rights reserved.
//

#import "XDSegmentControlTVC.h"
#import "XDSegmentControl.h"


@interface XDSegmentControlTVC (){
    XDSegmentControl *_xdSegmentControl;
}

@end

@implementation XDSegmentControlTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
}

-(void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
    _xdSegmentControl = [[XDSegmentControl alloc] initWithLabels:_titleArray withHightLightColor:[UIColor redColor] segmentColor:[UIColor whiteColor] object:self];
    [self.view addSubview:_xdSegmentControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
