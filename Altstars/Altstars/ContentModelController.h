//
//  ContentModelController.h
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ContentDataViewController;

@interface ContentModelController : NSObject <UIPageViewControllerDataSource>

@property (strong, nonatomic) NSArray *pageData;
@property (nonatomic) NSInteger currentIndex;


- (ContentDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(ContentDataViewController *)viewController;


@end
