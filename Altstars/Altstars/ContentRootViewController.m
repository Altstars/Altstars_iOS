//
//  ContentRootViewController.m
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "ContentRootViewController.h"

#import "ContentModelController.h"
#import "ContentDataViewController.h"

#import <AFNetworking.h>

@interface ContentRootViewController ()
@property (strong, nonatomic) ContentModelController *modelController;
@end

@implementation ContentRootViewController

//@synthesize modelController = _modelController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.modelController = [[ContentModelController alloc] init];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://altstars.koukilab.com/magazine/latest"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             // 通信に成功した場合の処理
             
             NSLog(@"responseObject: %@", responseObject[@"contents"]);
             self.modelController.pageData = [responseObject[@"contents"] copy];
             
             self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
             self.pageViewController.delegate = self;
             
             ContentDataViewController *startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
             NSArray *viewControllers = @[startingViewController];
             [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
             
             self.pageViewController.dataSource = self.modelController;
             
             [self addChildViewController:self.pageViewController];
             [self.view addSubview:self.pageViewController.view];
             
             CGRect pageViewRect = self.view.bounds;
             self.pageViewController.view.frame = pageViewRect;
             
             [self.pageViewController didMoveToParentViewController:self];
             
             self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
             
             

             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             // エラーの場合はエラーの内容をコンソールに出力する
             NSLog(@"Error: %@", error);
         }];

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (ContentModelController *)modelController
{
    if(!self.modelController){
        _modelController = [[ContentModelController alloc] init];
    }
    return _modelController;
}
*/

- (UIPageViewControllerSpineLocation) pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    
    UIViewController *currentViewController = self.pageViewController.viewControllers[0];
    NSArray *viewControllers = @[currentViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    self.pageViewController.doubleSided = NO;
    return UIPageViewControllerSpineLocationMin;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
