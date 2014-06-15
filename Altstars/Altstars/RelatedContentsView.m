//
//  RelatedContentsView.m
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "RelatedContentsView.h"

@implementation RelatedContentsView
@synthesize touchedDelegate;

- (id) initWithCoder:(NSCoder*)coder {

    self = [super initWithCoder:coder];
    if(self) {
        [self setDataSource:self];
        [self setDelegate:self];
        self.related_data = [[NSArray alloc] init];
        
        self.scrollEnabled = YES;
    }
    return self;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.related_data count];
}

//Method to create cell at index path
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    RelatedContentsViewCell *cell;
    id content = self.related_data[indexPath.row];
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DefaultRelatedItem" forIndexPath:indexPath];
    
    UIImageView *related_view = (UIImageView*)[cell viewWithTag:1];
    UILabel *related_title = (UILabel*)[cell viewWithTag:2];
    
    

    //画像を非同期で取得
    NSString *imageURL = content[@"image"];
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_global, ^{
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString: imageURL]]];
        dispatch_async(q_main, ^{
            related_view.image = img;
        });
    });


    /*
    NSURL *url = [NSURL URLWithString:content[@"image"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    related_view.image = [[UIImage alloc] initWithData:data];
    */
    cell.tintColor = [UIColor blackColor];
    
    related_title.text = content[@"title"];
    
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    id content = self.related_data[indexPath.row];
    NSString *url = content[@"url"];
    NSLog(@"touched:%@", url);
    
    [self.touchedDelegate contentsViewCellTouched:url];

    /*
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    WebViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    webViewController.url = content[@"url"];
    
    
    UINavigationController *navigationController = self.parentViewController.parentViewController.parentViewController.navigationController;
    [navigationController pushViewController:webViewController animated:YES];
     */
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
