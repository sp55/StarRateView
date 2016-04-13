//
//  StarRateView.h
//  StarRateView
//
//  Created by admin on 16/4/13.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StarRateView;
typedef void(^finishBlock)(CGFloat currentScore);

typedef NS_ENUM(NSInteger, RateStyle)
{
    WholeStar = 0, //只能整星评论
    HalfStar = 1,  //允许半星评论
    IncompleteStar = 2  //允许不完整星评论
};

//协议
@protocol StarRateViewDelegate <NSObject>
-(void)starRateView:(StarRateView *)starRateView currentScore:(CGFloat)currentScore;
@end


@interface StarRateView : UIView


@property (nonatomic,assign)BOOL isAnimation;       //是否动画显示，默认NO
@property (nonatomic,assign)RateStyle rateStyle;    //评分样式    默认是WholeStar
@property (nonatomic, weak) id<StarRateViewDelegate>delegate;

//代理
-(instancetype)initWithFrame:(CGRect)frame;
-(instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars rateStyle:(RateStyle)rateStyle isAnination:(BOOL)isAnimation delegate:(id)delegate;

//Block
-(instancetype)initWithFrame:(CGRect)frame finish:(finishBlock)finish;
-(instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars rateStyle:(RateStyle)rateStyle isAnination:(BOOL)isAnimation finish:(finishBlock)finish;




@end
