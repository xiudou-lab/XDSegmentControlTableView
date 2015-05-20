//
//  Constants.h
//  XDSegmentControlTableView
//
//  Created by jack on 15/5/19.
//  Copyright (c) 2015年 jack. All rights reserved.
//

#ifndef XDSegmentControlTableView_Constants_h
#define XDSegmentControlTableView_Constants_h

#define WINDOW_HEIGHT (IOS_VERSION > 8.1 ? ([[UIScreen mainScreen] applicationFrame].size.height + 20) : [[UIScreen mainScreen] applicationFrame].size.height + 84)
#define WINDOW_WIDTH [[UIScreen mainScreen] applicationFrame].size.width
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#endif
