//
//  ViewController.m
//  TYLCopyLabel
//
//  Created by Lengain on 16/1/12.
//  Copyright © 2016年 Lengain. All rights reserved.
//

#import "ViewController.h"
#import "TYLCopyLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TYLCopyLabel *copyLabel1 = [[TYLCopyLabel alloc]initWithFrame:CGRectMake(10, 40, 100, 30)];
    copyLabel1.text = @"This is a copy Lable,plase try with longPress Gesture";
    copyLabel1.numberOfLines = 0;
    CGSize autoSize1 = [copyLabel1 sizeThatFits:CGSizeMake(100, 100)];
    copyLabel1.frame = CGRectMake(10, 40, autoSize1.width, autoSize1.height);
    [self.view addSubview:copyLabel1];
    
    TYLCopyLabel *copyLabel2 = [[TYLCopyLabel alloc]initWithFrame:CGRectMake(10, 140, self.view.frame.size.width - 20, 30)];
    copyLabel2.text = @"This is a copy Lable,plase try with longPress Gesture";
    copyLabel2.numberOfLines = 0;
    CGSize autoSize2 = [copyLabel2 sizeThatFits:CGSizeMake(self.view.frame.size.width - 20, 100)];
    copyLabel2.frame = CGRectMake(10, copyLabel1.frame.origin.y + copyLabel1.frame.size.height + 20, autoSize2.width, autoSize2.height);
    [self.view addSubview:copyLabel2];
    
    TYLCopyLabel *copyLabel3 = [[TYLCopyLabel alloc]initWithFrame:CGRectMake(10, 140, self.view.frame.size.width - 20, 30)];
    copyLabel3.text = @"This is a copy Lable";
    copyLabel3.numberOfLines = 0;
    CGSize autoSize3 = [copyLabel3 sizeThatFits:CGSizeMake(self.view.frame.size.width - 20, 100)];
    copyLabel3.frame = CGRectMake(10, copyLabel2.frame.origin.y + copyLabel2.frame.size.height + 20, autoSize3.width, autoSize3.height);
    [self.view addSubview:copyLabel3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
