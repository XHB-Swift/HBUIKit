# HBUIKit
## 针对iOS开发中日常遇到的涉及UI的使用，而进行总结，以后遇到同类问题，简化UI代码
### 如下，修改一个view的尺寸
```Objective-C
CGRect frame = view.frame;
frame.size = CGSizeMake(100,30);
view.frame = frame;
```
### 简化为如下代码
```Objective-C
view.hb_size = CGSizeMake(100,30);
```
