//
//  Common.h
//  CXSlideBar
//
//  Created by 王长旭 on 16/3/1.
//  Copyright © 2016年 王长旭. All rights reserved.
//

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPad    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define narrowScreen (([UIScreen mainScreen].bounds.size.width) < (321))

#define AppVersion             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define IOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)? (YES):(NO))
#define IOS_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))
#define SystemLanguage         [[NSLocale preferredLanguages] objectAtIndex:0]

#define DeviceWidth     [UIScreen mainScreen].bounds.size.width
#define DeviceHeight    [UIScreen mainScreen].bounds.size.height


#define tabBarColor     ([UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0])
//#define navigationColor ([UIColor colorWithRed:255.0/255.0 green:110.0/255.0 blue:100.0/255.0 alpha:1.0])
#define navigationColor ([UIColor colorWithRed:244.0/255.0 green:156.0/255.0 blue:147.0/255.0 alpha:1.0])
#define grayTextColor   ([UIColor colorWithRed:150.0/255.0 green:150.0/255.0 blue:150.0/255.0 alpha:1.0])
#define blackTextColor  ([UIColor colorWithRed:50.0/255.0  green:50.0/255.0  blue:50.0/255.0  alpha:1.0])
#define separatorColor  ([UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0])
#define tabbarLineColor ([UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0])
#define darkGrayColor   ([UIColor colorWithRed:193.0/255.0 green:193.0/255.0 blue:193.0/255.0 alpha:1.0])
#define lightBlueColor   ([UIColor colorWithRed:28.0/255.0 green:89.0/255.0 blue:255.0/255.0 alpha:1.0])
#define lightGrayTextColor   ([UIColor colorWithRed:199.0/255.0 green:199.0/255.0 blue:205.0/255.0 alpha:1.0])
