//
//  ContentModelController.m
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "ContentModelController.h"

#import "ContentDataViewController.h"

@interface ContentModelController()
@end

@implementation ContentModelController

- (id)init
{
    self = [super init];
    if (self) {
        _pageData = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
    }
    return self;
}

- (ContentDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{
    if([self.pageData count] == 0 || index >= [self.pageData count]){
        return nil;
    }
    
    ContentDataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"ContentDataViewController"];

    dataViewController.dataObject = self.pageData[index];
    
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(ContentDataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}



- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(ContentDataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(ContentDataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}



@end
