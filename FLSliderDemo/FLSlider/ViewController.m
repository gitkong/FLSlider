//
//  ViewController.m
//  FLSlider
//
//  Created by clarence on 16/12/10.
//  Copyright © 2016年 gitKong. All rights reserved.
//

#import "ViewController.h"
#import "FLSlider.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FLSlider *slider = [[FLSlider alloc] init];
    slider.frame = CGRectMake(100, 300, 200, 30);
    slider.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:slider];
    
    slider.value = 0.2;
    slider.cacheValue = 0.5;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
