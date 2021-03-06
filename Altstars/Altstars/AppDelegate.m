//
//  AppDelegate.m
//  Altstars
//
//  Created by Kouki on 2014/05/15.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //For Deploy Gate
    [[DeployGateSDK sharedInstance] launchApplicationWithAuthor:@"deploygate.b4997c9d374c3268a1703f10851e3fcfa9d792e2" key:@"01c7e01db9f88c772a7f9c7f073ba55c41d0aa3b"];

    
    // Override point for customization after application launch.
   
    [FBLoginView class];
 
    //For push notification
    [application registerForRemoteNotificationTypes: (UIRemoteNotificationTypeBadge|
                                                      UIRemoteNotificationTypeSound|
                                                      UIRemoteNotificationTypeAlert)];
  
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *auth = (NSString*)[ud objectForKey:@"auth"];
    
    NSLog(@"%@", auth);
    
    if(auth != NULL){
        return YES;
    }
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    
    
    //[[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:230.0/256 green:13.0/256 blue:123.0/256 alpha:1.0]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // デバイストークンの両端の「<>」を取り除く
    NSString *deviceTokenString = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    
    // デバイストークン中の半角スペースを除去する
    deviceTokenString = [deviceTokenString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    PaulClient *client = [PaulClient sharedClient];
    [client setDeviceToken:deviceTokenString
                   success:^(NSURLSessionDataTask *task, id responseObject) {
                       NSLog(@"OK");
                   }
                   failure:^(NSURLSessionDataTask *task, NSError *error) {
                       // エラーの場合はエラーの内容をコンソールに出力する
                       NSLog(@"Error: %@", error);
                   }];

    
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)err{
    NSLog(@"Error : Fail Regist to APNS. (%@)", err);
}


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    // You can add your app-specific url handling code here if needed
    
    return wasHandled;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
