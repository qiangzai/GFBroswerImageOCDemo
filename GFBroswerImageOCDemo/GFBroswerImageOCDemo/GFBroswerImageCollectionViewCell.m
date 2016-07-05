//
//  GFBroswerImageCollectionViewCell.m
//  GFBroswerImageOCDemo
//
//  Created by LiZhongQiang on 16/7/4.
//  Copyright © 2016年 LiZhongQiang. All rights reserved.
//

#import "GFBroswerImageCollectionViewCell.h"

@implementation GFBroswerImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.dataScrView.frame = self.contentView.bounds;
        self.dataImgView.frame = self.contentView.bounds;
        [self.contentView addSubview:self.dataScrView];
        [self.dataScrView addSubview:self.dataImgView];
        
        self.dataScrView.contentSize = self.dataImgView.frame.size;
        
        
    }
    return self;
}

#pragma mark - event
- (void)singleTapGesture:(UITapGestureRecognizer *)ges{
    if (self.delegate && [self.delegate respondsToSelector:@selector(singleTap)]) {
        [self.delegate singleTap];
    }
}

- (void)doubleTapGesture:(UITapGestureRecognizer *)ges{
    CGFloat factor = ges.view.transform.a;
    if (factor == 1) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        self.dataScrView.zoomScale = 2;
        [UIView commitAnimations];
    }else{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        self.dataScrView.zoomScale = 1;
        [UIView commitAnimations];
    }
}

- (void)showImageViewWithUrl:(NSString *)urlStr{
//    [self.dataImgView ];
    
}

- (void)showImageViewWithImage:(UIImage *)img{
    self.dataImgView.image = img;
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.dataImgView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGSize boundsSize = self.dataScrView.bounds.size;
    CGRect contentsFrame = self.dataImgView.frame;
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0;
    }else{
        contentsFrame.origin.x = 0.0;
    }
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0;
    }else{
        contentsFrame.origin.y = 0.0;
    }
    self.dataScrView.contentSize = contentsFrame.size;
    self.dataImgView.frame = contentsFrame;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    if (self.dataImgView.frame.size.width < self.contentView.frame.size.width) {
        scrollView.zoomScale = 1;
    }
}

#pragma mark - setter and getter
- (UIScrollView *)dataScrView{
    if (_dataScrView == nil) {
        _dataScrView = [[UIScrollView alloc] init];
        _dataScrView.delegate = self;
        _dataScrView.minimumZoomScale = 0.5;
        _dataScrView.maximumZoomScale = 2;
        _dataScrView.showsVerticalScrollIndicator = NO;
        _dataScrView.showsHorizontalScrollIndicator = NO;
        
    }
    return _dataScrView;
}

- (UIImageView *)dataImgView{
    if (_dataImgView == nil) {
        _dataImgView = [[UIImageView alloc] init];
        _dataImgView.userInteractionEnabled = YES;
        _dataImgView.contentMode = UIViewContentModeScaleAspectFit;
        UITapGestureRecognizer *singleTapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGesture:)];
        singleTapGes.numberOfTapsRequired = 1;
        singleTapGes.numberOfTouchesRequired = 1;
        [_dataImgView addGestureRecognizer:singleTapGes];
        
        UITapGestureRecognizer *doubleTapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapGesture:)];
        doubleTapGes.numberOfTouchesRequired = 1;
        doubleTapGes.numberOfTapsRequired = 2;
        [_dataImgView addGestureRecognizer:doubleTapGes];
        
        [singleTapGes requireGestureRecognizerToFail:doubleTapGes];
        
    }
    return _dataImgView;
}

@end
