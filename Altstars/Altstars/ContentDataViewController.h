//
//  ContentDataViewController.h
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ContentsView.h"
#import "WebViewController.h"

@interface ContentDataViewController : UIViewController <ContentsViewDelegate>

@property (strong, nonatomic) id dataObject;

@property (weak, nonatomic) IBOutlet ContentsView *contentsView;

@end
