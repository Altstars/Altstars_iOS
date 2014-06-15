//
//  ContentsView.h
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@protocol ContentsViewDelegate <NSObject>

- (void)contentsViewCellTouched:(NSString *)url;

@end


@interface ContentsView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIImage *mainImage;
@property (nonatomic, strong) NSString *mainTitle;
@property (nonatomic, strong) NSArray *related_data;
@property (nonatomic, unsafe_unretained) id<ContentsViewDelegate> touchedDelegate;



@end
