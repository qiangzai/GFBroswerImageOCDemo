//
//  GFBroswerImageCollectionViewController.m
//  GFBroswerImageOCDemo
//
//  Created by LiZhongQiang on 16/7/4.
//  Copyright © 2016年 LiZhongQiang. All rights reserved.
//

#import "GFBroswerImageCollectionViewController.h"
#import "GFBroswerImageCollectionViewCell.h"

@interface GFBroswerImageCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,GFBroswerImageCollectionViewCellDelegate>
@property (nonatomic, strong) UICollectionView *imgCollectionView;
@end

@implementation GFBroswerImageCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 64);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    flowLayout.minimumLineSpacing = 0;
//    flowLayout.minimumInteritemSpacing = 0;
    
    self.imgCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    [self.imgCollectionView registerClass:[GFBroswerImageCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.imgCollectionView.pagingEnabled = YES;
    self.imgCollectionView.directionalLockEnabled = YES;
    self.imgCollectionView.dataSource = self;
    self.imgCollectionView.delegate = self;
    self.imgCollectionView.backgroundColor = [UIColor whiteColor];
    self.imgCollectionView.showsHorizontalScrollIndicator = NO;
//    [self.imgCollectionView setContentOffset:CGPointMake(kScreenWidth * self.page, 0) animated:YES];
    [self.imgCollectionView setContentSize:CGSizeMake(kScreenWidth, kScreenContent * 10)];
    [self.view addSubview:self.imgCollectionView];
}

- (void)singleTap{
    NSLog(@"singletap");
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GFBroswerImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
//    if (cell == nil) {
//        cell = [[GFBroswerImageCollectionViewCell alloc] init];
//    }
    
//    cell.delegate = self;
//    cell.dataImgView.image = nil;
    
//    cell.dataImgView.image = [UIImage imageNamed:@"imageDemo"];
    
    
    [cell showImageViewWithImage:[UIImage imageNamed:@"imageDemo"]];
    
    
//    if (self.isUrl) {
//        [cell showImageViewWithUrl:self.imgArr[indexPath.row]];
//    }else{
//        [cell showImageViewWithImage:self.imgArr[indexPath.row]];
//    }
    
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.x;
    int index = offsetY / kScreenWidth + 1;
//    NSLog(@"this is %i page",index);
    self.navigationItem.title = [NSString stringWithFormat:@"第%i页",index];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
