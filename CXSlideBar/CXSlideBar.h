//
//  CXSlideBar.h
//  pregnant-information
//
//  Created by 王长旭 on 16/1/14.
//  Copyright © 2016年 wcxdell. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CXSlideBarDelegate;

@interface CXSlideBar : UIView

@property (weak, nonatomic) id<CXSlideBarDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame;

+(instancetype)initWithFrame:(CGRect)frame Array:(NSArray*)array;
///移动标签
-(void)moveTo:(NSInteger)index;



@end
/**
 *  CXSlideBar 代理
 */
@protocol CXSlideBarDelegate <NSObject>

/**
 *  CXSlideBar点击回调
 *
 *  @param slideBar
 */

- (void)slideBarTouch:(CXSlideBar *)slideBar atIndex:(NSInteger)index;


@end
