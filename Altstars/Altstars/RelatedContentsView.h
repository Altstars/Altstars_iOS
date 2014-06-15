//
//  RelatedContentsView.h
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "RelatedContentsViewCell.h"

@protocol RelatedContentsViewDelegate <NSObject>

- (void)contentsViewCellTouched:(NSString *)url;

@end


@interface RelatedContentsView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *related_data;
@property (nonatomic, unsafe_unretained) id<RelatedContentsViewDelegate> touchedDelegate;

@end
