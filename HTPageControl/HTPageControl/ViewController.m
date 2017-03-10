//
//  ViewController.m
//  HTPageControl
//
//  Created by 一米阳光 on 17/3/11.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController {
    UIScrollView * _scrollView;
    UIPageControl * _pageCtr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"分页控件";
    [self createUI];
}

- (void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createScrollView];
    [self createPageController];
}

- (void)createScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 70, self.view.bounds.size.width-20, 350)];
    _scrollView.contentSize = CGSizeMake((self.view.bounds.size.width-20) * 5, 350);
    _scrollView.backgroundColor = [UIColor cyanColor];
    
    for (int i = 0; i < 5; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * (self.view.bounds.size.width-20), 0, self.view.bounds.size.width-20, 350)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]];
        [_scrollView addSubview:imageView];
    }
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    //分页效果
    _scrollView.pagingEnabled = YES;
    //设置代理
    _scrollView.delegate = self;
    //缩放比例
    _scrollView.minimumZoomScale = 1.0;
    _scrollView.maximumZoomScale = 3.0f;
    [self.view addSubview:_scrollView];
}

- (void)createPageController {
    //创建分页控件
    _pageCtr = [[UIPageControl alloc] initWithFrame:CGRectMake(50, 350 - 30, 200, 30)];
    //背景颜色
    _pageCtr.backgroundColor = [UIColor blackColor];
    //设置分页控件的总页数
    _pageCtr.numberOfPages = 5;
    //设置初始化分页空间的页码
    _pageCtr.currentPage = 0;
    [self.view addSubview:_pageCtr];
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"%@",[[_scrollView subviews] objectAtIndex:_pageCtr.currentPage]);
    return [[_scrollView subviews] objectAtIndex:_pageCtr.currentPage];
}

//减速停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //获取当前的显示页为第几页
    int currentNum = _scrollView.contentOffset.x/_scrollView.frame.size.width;
    //设置当前的显示页码
    _pageCtr.currentPage = currentNum;
}

@end
