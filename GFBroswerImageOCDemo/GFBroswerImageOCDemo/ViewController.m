//
//  ViewController.m
//  GFBroswerImageOCDemo
//
//  Created by LiZhongQiang on 16/7/4.
//  Copyright © 2016年 LiZhongQiang. All rights reserved.
//

#import "ViewController.h"
#import "GFBroswerImageCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"图片浏览";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(100, 100, 100, 40);
    testBtn.backgroundColor = [UIColor grayColor];
    [testBtn setTitle:@"测试" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
}

- (void)testButtonEvent:(id)sender{
    GFBroswerImageCollectionViewController *broswerVC = [[GFBroswerImageCollectionViewController alloc] init];
//    [self presentViewController:broswerVC animated:YES completion:nil];
    [self.navigationController pushViewController:broswerVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
