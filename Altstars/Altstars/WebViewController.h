//
//  WebViewController.h
//  Altstars
//
//  Created by Kouki Saito on 2014/05/25.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) NSString *url;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
