//
//  ViewController.m
//  HTScrollView
//
//  Created by 一米阳光 on 17/3/10.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"滚动视图";
    [self createScrollView];
}

/**
 *  滚动视图只是将比它大的UIImageView视图,通过拖拽效果,将UIImageView上的图片信息完整的展示给用户
 *  为了让滚动效果明显,添加图片视图的宽或者高至少比滚动视图的宽高多一个像素
 */
- (void)createScrollView {
    //创建对象
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    //显示位置
    scrollView.frame = CGRectMake(10, 70, self.view.bounds.size.width-20, 400);
    //添加背景颜色
    scrollView.backgroundColor = [UIColor orangeColor];
    //添加UIImageView
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 600, 500)];
    imageView.image = [UIImage imageNamed:@"timg.jpg"];
    [scrollView addSubview:imageView];
    
    //设置滚动视图的滚动范围, 内容视图的大小
    scrollView.contentSize = imageView.frame.size;
    //关闭自动调节显示位置的属性
    self.automaticallyAdjustsScrollViewInsets = NO;
    //关闭边框回弹效果
    scrollView.bounces = NO;
    //隐藏滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    //设置内容视图的偏移位置,默认内容视图显示在滚动视图区域的坐标是在内容视图的(0,0)点位置
    scrollView.contentOffset = CGPointMake(200, 100);
    //设置滚动视图的内容视图的缩放效果
    scrollView.delegate = self;
    //设置缩放的倍数
    scrollView.minimumZoomScale = 1.0;
    scrollView.maximumZoomScale = 3.0;
    [self.view addSubview:scrollView];
}

#pragma mark - UIScrollViewDelegate
/**
 *  最常用的协议方法，没有时间点反复调用,当滚动视图滚动时,一直调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"x = %f_____y = %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}

/**
 *  设置滚动视图的缩放效果
 */
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return [[scrollView subviews] objectAtIndex:0];
}

/**
 *  滚动视图拖拽开始调用该方法
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //获取的是该方法的名称
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

/**
 *  滚动视图拖拽结束调用该方法
 *  不能在该方法中获取最终滚动视图停止内容视图的偏移位置的值,也就是contentoffSet的值
 *  因为滚动视图拖拽结束的时候,还要经历一个内容视图缓慢减速停止的方法,应该在减速停止的方法里获取contentoffSet的值
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

/**
 *  滚动视图减速停止调用的方法
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
