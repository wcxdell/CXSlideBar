//
//  ViewController.m
//  CXSlideBar
//
//  Created by 王长旭 on 16/3/1.
//  Copyright © 2016年 王长旭. All rights reserved.
//

#import "ViewController.h"
#import "CXSlideBar.h"
#import "Common.h"


@interface ViewController ()<CXSlideBarDelegate>
@property (strong, nonatomic) CXSlideBar * slideBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.slideBar];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(CXSlideBar *)slideBar{
    if (!_slideBar) {
        NSArray * array = [NSArray arrayWithObjects:@"标签1",@"标签2",@"标签3",nil];
        _slideBar = [CXSlideBar initWithFrame:CGRectMake(0, 20, DeviceWidth, 40) Array:array];
        _slideBar.delegate = self;
    }
    return  _slideBar;
}

@end
