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
    
    NSString *url = self.dataObject[@"url"];
    [self pushWebViewControllerWithUrl:url];
    
}

- (void)contentsViewCellTouched:(NSString *)url{
    [self pushWebViewControllerWithUrl:url];
}

    

- (void)pushWebViewControllerWithUrl:(NSString*)url
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    WebViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    webViewController.url = url;
    
    UINavigationController *navigationController = self.parentViewController.parentViewController.parentViewController.navigationController;
    [navigationController pushViewController:webViewController animated:YES];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.contentsView setTouchedDelegate:self];
    
    NSString *content_id = (NSString*)self.dataObject[@"id"];
    
    PaulClient *client = [PaulClient sharedClient];
    [client relatedContentWithId:content_id
                   success:^(NSURLSessionDataTask *task, id responseObject) {
                       self.contentsView.related_data = responseObject;
                       [self.contentsView reloadData];
                   }
                   failure:^(NSURLSessionDataTask *task, NSError *error) {
                       NSLog(@"Error: %@", error);
                   }];
    
 
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.contentsView.mainTitle = self.dataObject[@"title"];
    
    NSURL *url = [NSURL URLWithString:self.dataObject[@"image"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    self.contentsView.mainImage = [[UIImage alloc] initWithData:data];
    
    self.contentsView.mainURL = self.dataObject[@"url"];
    
    
    self.contentsView.frame = CGRectMake(0, 0,
                            self.parentViewController.view.bounds.size.width,
                            self.parentViewController.view.bounds.size.height-60);
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
