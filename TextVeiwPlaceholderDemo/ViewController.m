//
//  ViewController.m
//  TextVeiwPlaceholderDemo
//
//  Created by Lv on 16/7/19.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import "ViewController.h"
#import "LvTextView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LvTextView * textV = [LvTextView textViewWithFrame:CGRectMake(100, 100, 200, 40) placeholder:@"这是一个placeholder" placeholderTextColor:[UIColor grayColor] font:16.0f];
    textV.layer.borderColor = [UIColor blackColor].CGColor;
    textV.layer.borderWidth = 1.0f;
    [self.view addSubview:textV];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
