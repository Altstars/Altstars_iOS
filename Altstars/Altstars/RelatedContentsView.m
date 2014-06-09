//
//  RelatedContentsView.m
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "RelatedContentsView.h"

@implementation RelatedContentsView

- (id) initWithCoder:(NSCoder*)coder {

    self = [super initWithCoder:coder];
    if(self) {
        [self setDataSource:self];
        [self setDelegate:self];
        self.related_data = [[NSArray alloc] init];
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
    
    UICollectionViewCell *cell;
    id content = self.related_data[indexPath.row];
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DefaultRelatedItem" forIndexPath:indexPath];
    
    UIImageView *related_view = (UIImageView*)[cell viewWithTag:1];
    UILabel *related_title = (UILabel*)[cell viewWithTag:2];
    
    NSURL *url = [NSURL URLWithString:content[@"image"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    related_view.image = [[UIImage alloc] initWithData:data];
    
    related_title.text = content[@"title"];
    
    return cell;
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
