//
//  LvTextView.m
//  灌溉
//
//  Created by Lv on 16/7/19.
//  Copyright © 2016年 Lv. All rights reserved.
//

#import "LvTextView.h"
#import "UIView+frame.h"

#define Scr_Width [UIScreen mainScreen].bounds.size.width
#define Scr_Height [UIScreen mainScreen].bounds.size.height

#define H(b) Scr_Height * b / 667
#define W(a) Scr_Width * a / 375
@implementation LvTextView

+ (LvTextView *)textViewWithFrame:(CGRect)frame placeholder:(NSString *)placeholder placeholderTextColor:(UIColor *)color font:(CGFloat)font
{
    LvTextView * textV = [[LvTextView alloc] initWithFrame:frame];
    textV.placeholder = placeholder;
    textV.placeholderTextColor = color;
    textV.font = [UIFont systemFontOfSize:font];
    return textV;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}
- (void)setUp
{
    self.backgroundColor = [UIColor clearColor];
    UILabel * placeholderLabel = [[UILabel alloc] init];
    placeholderLabel.backgroundColor = [UIColor clearColor];
    placeholderLabel.numberOfLines = 0;
    [self addSubview:placeholderLabel];
    
    self.placeholderLabel = placeholderLabel;
    
    self.placeholderLabel.textColor = self.placeholderTextColor;
    self.font = [UIFont systemFontOfSize:15.0f];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    
}
- (void)textDidChange
{
    self.placeholderLabel.hidden = self.hasText;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placeholderLabel.x = W(5);
    self.placeholderLabel.y = H(8);
    self.placeholderLabel.width = self.width - self.placeholderLabel.x * 2.0;
    
    CGSize size = CGSizeMake(self.placeholderLabel.width, MAXFLOAT);
    self.placeholderLabel.height = [self.placeholder boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.placeholderLabel.font} context:nil].size.height;

}
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    self.placeholderLabel.text = placeholder;
    
    [self setNeedsDisplay];
}
- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor
{
    _placeholderTextColor = placeholderTextColor;
    self.placeholderLabel.textColor = placeholderTextColor;

}
- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLabel.font= font;
    [self setNeedsDisplay];
}
- (void)setText:(NSString *)text
{
    [super setText:text];
    [self textDidChange];
    
}
- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self textDidChange];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:UITextViewTextDidChangeNotification];
}
@end
