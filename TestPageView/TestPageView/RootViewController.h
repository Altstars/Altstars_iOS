//
//  RootViewController.h
//  TestPageView
//
//  Created by Kouki Saito on 2014/05/14.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
