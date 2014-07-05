//
//  CommentTableViewController.m
//  Altstars
//
//  Created by Kouki Saito on 2014/07/03.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "CommentTableViewController.h"

@interface CommentTableViewController ()

@end

@implementation CommentTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    if(section == 0){
        return 1;
    }
    else if(section==1){
        return 20;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainItem" forIndexPath:indexPath];

        UIImageView *mainImage = (UIImageView*)[cell viewWithTag:1];
        NSURL *url = [NSURL URLWithString:self.dataObject[@"image"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        mainImage.image = [[UIImage alloc] initWithData:data];
        
        UILabel *text = (UILabel*)[cell viewWithTag:3];
        text.text = @"自然言語がなんとかこんとかでなんとかこんとかだからなんとかこんとかなことがなんとかこんとかしてなんとかこんとかなんとかこんとかがなんとかこんとかするようになんとかこんとかした";
        [text sizeToFit];
        
        
        UILabel *nextButton = (UILabel*)[cell viewWithTag:4];
        nextButton.frame = CGRectMake(nextButton.frame.origin.x,
                                      text.frame.origin.y + text.frame.size.height + 8,
                                      nextButton.frame.size.width,
                                      nextButton.frame.size.height);
        
        
        return cell;
    }
    else if(indexPath.section == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Comment" forIndexPath:indexPath];
        
        UILabel *text = (UILabel*)[cell viewWithTag:10];
        text.text = @"That is a comment. comment.comment.comment.comment.comment.comment.comment.comment.comment.comment.";
        [text sizeToFit];
        
        UIImageView *thumbnail = (UIImageView*)[cell viewWithTag:11];
        NSLog(@"%f,%f",thumbnail.frame.size.width, thumbnail.frame.size.height);
        thumbnail.layer.cornerRadius = thumbnail.bounds.size.width * 0.5f;
        thumbnail.clipsToBounds = YES;
        
        return cell;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text;
    CGSize  maxSize = CGSizeMake(200, CGFLOAT_MAX);
    int margin = 0;
    if(indexPath.section == 0){
        margin = 195;
        text = @"自然言語がなんとかこんとかでなんとかこんとかだからなんとかこんとかなことがなんとかこんとかしてなんとかこんとかなんとかこんとかがなんとかこんとかするようになんとかこんとかした";
        maxSize = CGSizeMake(300, CGFLOAT_MAX);
    }
    else if(indexPath.section == 1){
        margin = 45;
        text = @"That is a comment. comment.comment.comment.comment.comment.comment.comment.comment.comment.comment.";
        maxSize = CGSizeMake(310, CGFLOAT_MAX);
    }
    
    NSDictionary *attr = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0]};
    CGSize modifiedSize = [text boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attr
                                             context:nil
                           ].size;
    
    return modifiedSize.height + margin;
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
