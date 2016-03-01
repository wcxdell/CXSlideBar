# CXSlideBar
一个滑动标签控件
滑动到第几个标签可以通过代理事件获得，也可以通过代码控制滑动到第几个标签。传入一个标签名字的Array即可。
NSArray * array = [NSArray arrayWithObjects:@"标签1",@"标签2",@"标签3",nil];
_slideBar = [CXSlideBar initWithFrame:CGRectMake(0, 20, DeviceWidth, 40) Array:array]
![](https://github.com/wcxdell/CXSlideBar/blob/master/image-folder/screenshot.gif)
