//
//  ViewController.m
//  UIPageViewControll的简单使用
//
//  Created by myApple on 16/1/13.
//  Copyright © 2016年 myApple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIPageViewController *pageViewC;
    NSArray *array;
    UIPageControl *pageControl;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIViewController *page1=[[UIViewController alloc]init];
    UIViewController *page2=[[UIViewController alloc]init];
    UIViewController *page3=[[UIViewController alloc]init];
    UIViewController *page4=[[UIViewController alloc]init];
    page1.view.frame=self.view.frame;
    page2.view.frame=self.view.frame;
    page3.view.frame=self.view.frame;
    page4.view.frame=self.view.frame;
    
    page1.view.backgroundColor=[UIColor redColor];
    page2.view.backgroundColor=[UIColor orangeColor];
    page3.view.backgroundColor=[UIColor purpleColor];
    page4.view.backgroundColor=[UIColor yellowColor];

    array=[NSArray arrayWithObjects:page1,page2,page3,page4, nil];
    
    pageViewC=[[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    pageViewC.view.frame=self.view.frame;

    [pageViewC setDelegate:self];
    [pageViewC setDataSource:self];
    NSArray *viewControllers = [NSArray arrayWithObject:[array objectAtIndex:0]];

    [pageViewC setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:pageViewC];
    [self.view addSubview:pageViewC.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mask --------pageViewController  datasource

//BeforeViewController
- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger currentIndex = [array indexOfObject:viewController];
    if ( currentIndex > 0)
    {
        return [array objectAtIndex:currentIndex-1];
    }
    
    return nil;
}

//AfterViewController
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger currentIndex = [array indexOfObject:viewController];
    if ( currentIndex <array.count-1)
    {
        return [array objectAtIndex:currentIndex+1];
    }
        return nil;
}

@end