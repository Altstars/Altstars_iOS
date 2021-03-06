//
//  ContentDataViewController.h
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "ContentsView.h"
#import "WebViewController.h"
#import "CommentTableViewController.h"

@interface ContentDataViewController : UIViewController <ContentsViewDelegate>

@property (strong, nonatomic) id dataObject;

@property (weak, nonatomic) IBOutlet ContentsView *contentsView;

@property CGRect rect;

@end
