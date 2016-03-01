//
//  CXSlideBar.m
//  pregnant-information
//
//  Created by 王长旭 on 16/1/14.
//  Copyright © 2016年 wcxdell. All rights reserved.
//

#import "CXSlideBar.h"
#import "Common.h"


@interface CXSlideBar()<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView * scrollView;
@property (strong, nonatomic) UIImageView * indicator;
@property (strong, nonatomic) NSMutableArray * labelArrays;
@property (weak,nonatomic) NSArray * array;
@property (assign, nonatomic)  NSInteger labelWidth;
@property (assign, nonatomic) NSInteger currentIndex;

@property BOOL tapCategoryTitle;
@end

@implementation CXSlideBar

#pragma mark - Life Cycle
+(instancetype)initWithFrame:(CGRect)frame Array:(NSArray *)array{
    CXSlideBar * slideBar = [[CXSlideBar alloc] initWithFrame:frame];
    [slideBar setupWithArray:array];
    return slideBar;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
    }
    return self;
}


#pragma mark - Public Method

-(void)setupWithArray:(NSArray*) array{
    self.backgroundColor = [UIColor whiteColor];
    self.array = array;
    [self addSubview:self.scrollView];
    
    self.tapCategoryTitle = NO;
    self.currentIndex = 0;
    self.labelArrays = [NSMutableArray array];
    self.labelWidth = 106;
    
    NSInteger categoryCount = [array count];
    if (DeviceWidth / categoryCount > self.labelWidth) {
        self.labelWidth = DeviceWidth / categoryCount;
        [self.indicator setFrame:CGRectMake(0, self.frame.size.height - 2, self.labelWidth, 1)];
    }
    
    self.scrollView.contentSize = CGSizeMake((categoryCount) * self.labelWidth, self.scrollView.frame.size.height);
    
    UILabel* line = [[UILabel alloc] initWithFrame:CGRectMake(0, self.scrollView.frame.size.height - 1, self.scrollView.contentSize.width, 1)];
    line.backgroundColor = separatorColor;
    
    [self.scrollView addSubview:line];
    [self.scrollView addSubview:self.indicator];
    
    for (int i = 0; i < categoryCount; i++) {
        [self createCategoryLabel:i];
    }
    [self highlightedCategory:self.currentIndex];
}


- (void) createCategoryLabel:(int)index {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(index * self.labelWidth, 0, self.labelWidth, self.scrollView.frame.size.height - 2)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:(iPad ? 27.0 : 18.0)];
    label.tag = index;
    label.textColor = blackTextColor;
    label.text = self.array[index];
    [label setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [tap addTarget:self action:@selector(tapCategory:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [label addGestureRecognizer:tap];
    [self.labelArrays addObject:label];
    [self.scrollView addSubview:label];
}

- (void) tapCategory:(UITapGestureRecognizer *)recognizer {
    UIView *viewT = [recognizer view];
    if (viewT.tag ==self.currentIndex) {
        return;
    }
    NSInteger last = self.currentIndex;
    self.currentIndex = viewT.tag;
    self.tapCategoryTitle = YES;//标识是点击切换类别
    
    [self highlightedCategory:last];
    if ([self.delegate respondsToSelector:@selector(slideBarTouch:atIndex:)]) {
        [self.delegate slideBarTouch:self atIndex:self.currentIndex];
    }
    
}

-(void)moveTo:(NSInteger)index{
    NSInteger last = self.currentIndex;
    self.currentIndex = index;
    [self highlightedCategory:last];
}

- (void) highlightedCategory:(NSInteger)lastHighlighted {
    UILabel * labelCurrent = self.labelArrays[self.currentIndex];
    UILabel * labelLast = self.labelArrays[lastHighlighted];
    labelLast.textColor = blackTextColor;
    labelCurrent.textColor = navigationColor;
    
    [UIView animateWithDuration:0.5
                     animations:^{//修改rView坐标
                         self.indicator.frame = CGRectMake(self.labelWidth * self.currentIndex, self.scrollView.frame.size.height - 2, self.labelWidth, 1) ;
                         if (self.currentIndex >= 1 && self.currentIndex < [self.array count] - 1) {
                             //中间的category
                             CGFloat offset = (self.currentIndex - 1) * self.labelWidth;
                             if (offset > self.scrollView.contentSize.width - DeviceWidth) {
                                 offset = self.scrollView.contentSize.width - DeviceWidth;
                             }
                             CGPoint point = CGPointMake(offset, 0);
                             self.scrollView.contentOffset = point;
                         }else if ((self.currentIndex - lastHighlighted) > 0) {
                             //最右边的category
                             CGPoint point = CGPointMake(self.scrollView.contentSize.width - DeviceWidth, 0);
                             self.scrollView.contentOffset = point;
                         }else if ((lastHighlighted - self.currentIndex) > 0){
                             //最左边的category
                             CGPoint point = CGPointMake(self.currentIndex * self.labelWidth, 0);
                             self.scrollView.contentOffset = point;
                         }
                     }
                     completion:^(BOOL finished){
                         self.tapCategoryTitle = NO;
                     }];
}

#pragma mark - Getter
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

-(UIImageView *)indicator{
    if (!_indicator) {
        _indicator = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 2, self.labelWidth, 1)];
        _indicator.backgroundColor = navigationColor;
    }
    return _indicator;
}

@end
