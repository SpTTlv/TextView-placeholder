//
//  LvTextView.h
//  灌溉
//
//  Created by Lv on 16/7/19.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LvTextView : UITextView
/**
 *  placeholder
 */
@property (nonatomic,weak) UILabel *placeholderLabel;
/**
 *  颜色
 */
@property (nonatomic,strong) UIColor *placeholderTextColor;
/**
 *  文字
 */
@property (nonatomic,strong) NSString *placeholder;

+ (LvTextView *)textViewWithFrame:(CGRect)frame placeholder:(NSString *)placeholder placeholderTextColor:(UIColor *)color font:(CGFloat)font;
@end
