//
//  RelatedContentsView.h
//  Altstars
//
//  Created by Kouki Saito on 2014/05/17.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RelatedContentsView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *related_data;

@end
