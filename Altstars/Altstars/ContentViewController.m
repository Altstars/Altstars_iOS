//
//  ContentViewController.m
//  Altstars
//
//  Created by Kouki Saito on 2014/05/18.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "ContentViewController.h"

#import <FacebookSDK/FacebookSDK.h>

@interface ContentViewController ()

@end

@implementation ContentViewController

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

    
    //カラフルなバー表示
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    window.rootViewController = [window rootViewController];
    
    UIImageView *section = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"section.png"]];
    section.frame = CGRectMake(0, 62, 320, 3);
    [window addSubview:section];
    section.hidden = NO;

    //[self.navigationBar setBackgroundColor:[UIColor orangeColor]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)forDebugRefleshAuth:(id)sender {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud removeObjectForKey:@"auth"];
    
    FBSession *session = [[FBSession alloc] init];
    [session closeAndClearTokenInformation];

    NSLog(@"Reflesh authorization");
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
