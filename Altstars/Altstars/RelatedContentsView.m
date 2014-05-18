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
    }
    return self;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

//Method to create cell at index path
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell;
    
    
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DefaultRelatedItem" forIndexPath:indexPath];
    
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
