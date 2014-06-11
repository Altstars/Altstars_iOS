//
//  LoginViewController.m
//  Altstars
//
//  Created by Kouki Saito on 2014/06/11.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    
    
    FBLoginView *loginView = [[FBLoginView alloc] initWithReadPermissions:@[@"public_profile", @"user_friends", @"email", @"user_likes", @"friends_about_me", @"user_actions.books", @"user_actions.fitness", @"user_actions.music", @"user_actions.news", @"user_actions.video", @"user_status"]];

    loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), 200);
    loginView.delegate = self;
    [self.view addSubview:loginView];
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error
{
    NSLog(@"%@",error);
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    NSLog(@"%@",user);
    
    NSString *fbAccessToken = [FBSession activeSession].accessTokenData.accessToken;
    NSLog(@"%@",fbAccessToken);
    
    
    //TODO:authをサーバーにアクセスして、Altstarsのセッションキーを貰うようにする
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:fbAccessToken forKey:@"auth"];
    
    /* //writeパーミッションの取り方
    if ([FBSession.activeSession.permissions indexOfObject:@"publish_actions"] == NSNotFound) {
        [FBSession.activeSession
         reauthorizeWithPublishPermissions:[NSArray arrayWithObject:@"publish_actions"]
         defaultAudience:FBSessionDefaultAudienceOnlyMe
         completionHandler:^(FBSession *session, NSError *error) {
             if (!error) {
                 
             }else{
                 
             }
         }];
    }else{
        
    }
    */
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)moveToFirstScene
{
    [self performSegueWithIdentifier:@"LogintToFirstView" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
