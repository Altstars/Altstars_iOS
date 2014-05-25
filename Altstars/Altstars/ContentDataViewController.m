//
//  ContentDataViewController.m
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "ContentDataViewController.h"

@interface ContentDataViewController ()

@end

@implementation ContentDataViewController

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
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.mainTitle.text = self.dataObject[@"title"];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    NSURL *url = [NSURL URLWithString:self.dataObject[@"image"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    self.mainImage.image = [[UIImage alloc] initWithData:data];

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
