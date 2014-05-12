//
//  DataViewController.h
//  TestPageView
//
//  Created by Kouki Saito on 2014/05/12.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@end
