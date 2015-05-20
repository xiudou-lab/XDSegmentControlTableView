//
//  XDSegmentControl.h
//  XDSegmentControlTableView
//
//  Created by jack on 15/5/19.
//  Copyright (c) 2015年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XDSegmentControlDelegate <NSObject>

-(void)segmentControlSelected:(NSInteger)index;

@end

@interface XDSegmentControl : UIView

@property (nonatomic,strong) UIColor *segmentColor;
@property (nonatomic,strong) UIColor *hightlightColor;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) id<XDSegmentControlDelegate> delegate;

-(instancetype)initWithLabels:(NSArray *)labelArray withHightLightColor:(UIColor*)hightlightColor segmentColor:(UIColor*)segmentColor object:(id)viewController;

@end
