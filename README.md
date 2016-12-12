# 自定义slider
- 可监听开始滑动、正在滑动、结束滑动三个状态

# 为什么要自定义？
- 1、系统拖拽区域比较小（如果显示控件比较小的话），此时用户体验较差
- 2、事件监听不完善，没办法同时监听slider多个状态，对于监听拖拽开始 `UIControlEventTouchUpInside` ；监听拖拽结束 `UIControlEventTouchUpOutside`，监听正在拖拽 `UIControlEventValueChanged` 单独可以实现，但一起监听就没办法；当然如果设置了slider 的 `continuous` 属性为NO（默认是YES），此时`UIControlEventValueChanged` 监听的方法只会在松手的时候执行一次
- 3、播放视频需要缓冲，那么缓冲的进度条也需要显示出来，此时系统的没有
- 4、实际播放视频的时候，我需要一开始拖拽的时候，应该暂停播放、正在拖拽的时候改变对应的时间进度、结束播放的时候需要跳转到指定的位置，然后开始播放，那么就必须自定义slider了

# 效果

![效果图](http://upload-images.jianshu.io/upload_images/1085031-277817d85038d765.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/600)

# API设计（尽量仿系统）

> 1、当前进度值（float 类型）

```
/**
 *  @author gitKong
 *
 *  当前进度
 */
@property(nonatomic) float value;
```

> 2、最小进度值，默认是0.0

```
/**
 *  @author gitKong
 *
 *  最小值
 */
@property(nonatomic) float minimumValue;
```


> 3、最大进度值，默认是1.0

```
/**
 *  @author gitKong
 *
 *  最大值
 */
@property(nonatomic) float maximumValue;
```

> 4、缓存进度值，默认是0.0

```
/**
 *  @author gitKong
 *
 *  缓存进度值
 */
@property(nonatomic) float cacheValue;
```


> 5、当前进度条的颜色，有默认颜色

```
/**
 *  @author gitKong
 *
 *  当前进度条的颜色，有默认颜色
 */
@property(nonatomic,strong) UIColor *minimumTrackTintColor;
```

> 6、缓存进度条的颜色，有默认颜色

```
/**
 *  @author gitKong
 *
 *  缓存进度条的颜色，有默认颜色
 */
@property(nonatomic,strong) UIColor *cacheTrackTintColor;
```

> 7、总进度条颜色，有默认颜色

```
/**
 *  @author gitKong
 *
 *  总进度条颜色，有默认颜色
 */
@property(nonatomic,strong) UIColor *maximumTrackTintColor;
```

> 8、设置拖拽的Thumb图片(就是拖拽的按钮)

```
/**
 *  @author gitKong
 *
 *  设置拖拽的Thumb图片
 */
@property(nonatomic,strong) UIImage *thumbImage;
```

> 9、通过代理的方式来实现
```
/**
 *  @author gitKong
 *
 *  代理
 */
@property (nonatomic,weak)id<FLSliderDelegate> delegate;
```

> 10、代理方法

```
/**
 *  @author gitKong
 *
 *  开始拖动
 */
- (void)beginSlide:(FLSliderButton *)sliderBtn slider:(FLSlider *)slider;
/**
 *  @author gitKong
 *
 *  正在拖动
 */
- (void)sliding:(FLSliderButton *)sliderBtn slider:(FLSlider *)slider;
/**
 *  @author gitKong
 *
 *  结束拖动
 */
- (void)endSlide:(FLSliderButton *)sliderBtn slider:(FLSlider *)slider;
```

# 使用起来很简单

```
    FLSlider *slider = [[FLSlider alloc] init];
    slider.frame = CGRectMake(100, 300, 200, 30);
    slider.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:slider];
    
    slider.value = 0.2;
    slider.cacheValue = 0.5;
```

# 如果要看效果，去[基于阿里云播放SDK封装的工具类](https://github.com/gitkong/FLVideoPlayerManager) 这里有视频播放Demo

# 如果大家喜欢，点个Star~同时欢迎关注 [我的简书](http://www.jianshu.com/users/fe5700cfb223/latest_articles)
