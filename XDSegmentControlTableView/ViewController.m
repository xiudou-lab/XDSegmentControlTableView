//
//  ViewController.m
//  XDSegmentControlTableView
//
//  Created by jack on 15/5/19.
//  Copyright (c) 2015年 jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *_array1;
    NSArray *_array2;
    NSArray *_array3;
    NSArray *_array4;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array1 = @[@"春天",@"夏天",@"秋天",@"冬天"];
    _array2 = @[@"花猫",@"哈士奇",@"土拨鼠",@"猎豹",@"恐龙"];
    _array3 = @[@"上衣",@"披肩",@"靴子",@"半身裙"];
    _array4 = @[@"咖啡",@"牛奶",@"蓝莓汁"];
    self.titleArray = @[@"最热",@"最新",@"最美",@"最炫"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (tableView.tag == 0) {
        [tableViewCell.textLabel setText:_array1[indexPath.row]];
    } else if (tableView.tag == 1) {
        [tableViewCell.textLabel setText:_array2[indexPath.row]];
    } else if (tableView.tag == 2) {
        [tableViewCell.textLabel setText:_array3[indexPath.row]];
    } else {
        [tableViewCell.textLabel setText:_array4[indexPath.row]];
    }
    
    return tableViewCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count;
    if (tableView.tag == 0) {
        count = _array1.count;
    } else if (tableView.tag == 1) {
        count = _array2.count;
    } else if (tableView.tag == 2) {
        count = _array3.count;
    } else {
        count = _array4.count;
    }
    return count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
