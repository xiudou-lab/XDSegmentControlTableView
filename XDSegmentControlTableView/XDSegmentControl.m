//
//  XDSegmentControl.m
//  XDSegmentControlTableView
//
//  Created by jack on 15/5/19.
//  Copyright (c) 2015年 jack. All rights reserved.
//

#import "XDSegmentControl.h"

#define BUTTON_Y_OFFSET 19

@interface XDSegmentControl(){
    NSMutableArray *_buttonArray;
    NSArray *_labelArray;
    UIScrollView *_scrollView;
    UIViewController *_superViewController;
}

@end

@implementation XDSegmentControl

-(instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, WINDOW_WIDTH, 44);
    }
    return self;
}


-(instancetype)initWithLabels:(NSArray *)labelArray withHightLightColor:(UIColor*)hightlightColor segmentColor:(UIColor*)segmentColor object:(id)viewController{
    if (self = [self init]) {
        _currentIndex = 0;
        _superViewController = viewController;
        _hightlightColor = hightlightColor;
        _segmentColor = segmentColor;
        _buttonArray = [[NSMutableArray alloc] init];
        _labelArray = labelArray;
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, WINDOW_WIDTH, WINDOW_HEIGHT - 50)];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_superViewController.view addSubview:_scrollView];
        for (int i = 0; i < _labelArray.count; i++) {
            [self initButtons:i];
            [self initTableViews:i];
        }
    }
    return self;
}

-(void)initButtons:(NSInteger)index{
    CGFloat buttonWidth = (WINDOW_WIDTH - 20) / _labelArray.count;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(index * buttonWidth + 10, BUTTON_Y_OFFSET, buttonWidth - 0.5, 25)];
    button.tag = index;
    if (index == 0) {
        [button setSelected:YES];
        button.backgroundColor = _hightlightColor;
        [self setMaskTo:button byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft];
    } else if (index == _labelArray.count - 1) {
        [button setSelected:NO];
        [button setBackgroundColor:_segmentColor];
        [self setMaskTo:button byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomRight];
    } else {
        [button setSelected:NO];
        [button setBackgroundColor:_segmentColor];
    }
    [button addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:_labelArray[index] forState:UIControlStateNormal];
    [button setTitleColor:_hightlightColor forState:UIControlStateNormal];
    [button setTitleColor:_segmentColor forState:UIControlStateSelected];
    [button.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [self addSubview:button];
    [_buttonArray addObject:button];
}

-(void)initTableViews:(NSInteger)index{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(index * WINDOW_WIDTH, 0, WINDOW_WIDTH,WINDOW_HEIGHT - 50) style:UITableViewStylePlain];
    [_scrollView addSubview:tableView];
    tableView.delegate = _superViewController;
    tableView.dataSource = _superViewController;
    tableView.tag = index;
}

-(void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners{
    UIBezierPath *path;
    path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(4, 4)];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:path.CGPath];
    view.layer.mask = shape;
}

-(void)segmentAction:(UIButton*)button{
    NSLog(@"%zd",button.tag);
    for (UIButton *button in _buttonArray) {
        [button setSelected:NO];
        [button setBackgroundColor:_segmentColor];
    }
    [_scrollView setContentOffset:CGPointMake(button.tag * WINDOW_WIDTH, 0) animated:YES];
    [button setSelected:YES];
    [button setBackgroundColor:_hightlightColor];
    _currentIndex = button.tag;
    [self.delegate segmentControlSelected:button.tag];
}

@end
