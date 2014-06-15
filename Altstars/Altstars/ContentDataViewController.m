//
//  ContentDataViewController.m
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "ContentDataViewController.h"

#import <AFNetworking.h>

#import "PaulClient.h"

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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    switch (touch.view.tag) {
        case 1:
            NSLog(@"Move to web view");
            break;
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    WebViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    webViewController.url = self.dataObject[@"url"];
    
    UINavigationController *navigationController = self.parentViewController.parentViewController.parentViewController.navigationController;
    [navigationController pushViewController:webViewController animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *content_id = (NSString*)self.dataObject[@"id"];
    
    PaulClient *client = [PaulClient sharedClient];
    [client relatedContentWithId:content_id
                   success:^(NSURLSessionDataTask *task, id responseObject) {
                       NSLog(@"responseObject: %@", responseObject);
                       self.relatedContentsView.related_data = responseObject;
                       [self.relatedContentsView reloadData];
                   }
                   failure:^(NSURLSessionDataTask *task, NSError *error) {
                       // エラーの場合はエラーの内容をコンソールに出力する
                       NSLog(@"Error: %@", error);
                   }];
    
 
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.mainTitle.text = self.dataObject[@"title"];
    
    UIImageView *imageView = [[UIImageView alloc] init];
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
