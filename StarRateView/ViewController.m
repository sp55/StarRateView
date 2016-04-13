//
//  ViewController.m
//  StarRateView
//
//  Created by admin on 16/4/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//
//评价星星
//半星、一星、残缺的都可以用


#import "ViewController.h"
#import "StarRateView.h"

@interface ViewController ()<StarRateViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//代理
    //残缺的
    StarRateView *starRateView = [[StarRateView alloc] initWithFrame:CGRectMake(20, 60, 200, 30)];
    starRateView.isAnimation = YES;
    starRateView.rateStyle = IncompleteStar;
    starRateView.tag = 1;
    starRateView.delegate = self;
    [self.view addSubview:starRateView];
    
    //半星带动画
    StarRateView *starRateView2 = [[StarRateView alloc] initWithFrame:CGRectMake(20, 100, 200, 30) numberOfStars:5 rateStyle:HalfStar isAnination:YES delegate:self];
    starRateView2.tag = 2;
    [self.view addSubview:starRateView2];

//Block
    //残缺的
    StarRateView *starRateView3 = [[StarRateView alloc] initWithFrame:CGRectMake(20, 140, 200, 30) finish:^(CGFloat currentScore) {
        NSLog(@"3----  %f",currentScore);
    }];
    [self.view addSubview:starRateView3];
    
    //半星
    StarRateView *starRateView4 = [[StarRateView alloc] initWithFrame:CGRectMake(20, 180, 200, 30) numberOfStars:5 rateStyle:HalfStar isAnination:YES finish:^(CGFloat currentScore) {
        NSLog(@"4----  %f",currentScore);
    }];
    [self.view addSubview:starRateView4];
    
}

-(void)starRateView:(StarRateView *)starRateView currentScore:(CGFloat)currentScore{
    NSLog(@"%ld----  %f",starRateView.tag,currentScore);
}

@end
