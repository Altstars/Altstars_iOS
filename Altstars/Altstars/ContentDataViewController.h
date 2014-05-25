//
//  ContentDataViewController.h
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RelatedContentsView.h"
#import "WebViewController.h"

@interface ContentDataViewController : UIViewController

@property (strong, nonatomic) id dataObject;

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UILabel *mainTitle;

@property (weak, nonatomic) IBOutlet RelatedContentsView *relatedContentsView;

@end
