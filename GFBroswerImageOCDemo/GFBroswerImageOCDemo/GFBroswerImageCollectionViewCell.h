//
//  GFBroswerImageCollectionViewCell.h
//  GFBroswerImageOCDemo
//
//  Created by LiZhongQiang on 16/7/4.
//  Copyright © 2016年 LiZhongQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utility.h"

@protocol GFBroswerImageCollectionViewCellDelegate <NSObject>

- (void)singleTap;

@end

@interface GFBroswerImageCollectionViewCell : UICollectionViewCell<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *dataScrView;
@property (nonatomic, strong) UIImageView *dataImgView;
@property (nonatomic, assign) id<GFBroswerImageCollectionViewCellDelegate>delegate;

- (void)showImageViewWithUrl:(NSString *)urlStr;
- (void)showImageViewWithImage:(UIImage *)img;

@end
