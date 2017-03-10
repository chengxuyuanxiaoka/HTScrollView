//
//  ViewController.m
//  HTCarouselScrollView
//
//  Created by 一米阳光 on 17/3/10.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "ViewController.h"
#import "HTConfig.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createScrollView];
}

- (void)createScrollView {
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(7 * SCREEN_width, SCREEN_height);
    //设置内容视图初始状态下的偏移位置
    scrollView.contentOffset = CGPointMake(SCREEN_width, 0);
    
    for (int i = 0; i < 7; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_width * i, 0, SCREEN_width, SCREEN_height)];
        if (i == 0) {
            imageView.image = [UIImage imageNamed:@"5.png"];
        }else if (i == 6) {
            imageView.image = [UIImage imageNamed:@"1.png"];
        }else {
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
        }
        [scrollView addSubview:imageView];
    }
    
    scrollView.pagingEnabled = YES;
    //设置代理
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 6 * SCREEN_width) {
        scrollView.contentOffset = CGPointMake(SCREEN_width, 0);
    } else if (scrollView.contentOffset.x == 0) {
        scrollView.contentOffset = CGPointMake(5 * SCREEN_width, 0);
    }
}

@end
