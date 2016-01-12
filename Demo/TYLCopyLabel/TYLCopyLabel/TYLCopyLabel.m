//
//  TYLCopyLabel.m
//  TYLCopyLabel
//
//  Created by Lengain on 16/1/12.
//  Copyright © 2016年 Lengain. All rights reserved.
//

#import "TYLCopyLabel.h"

@interface TYLCopyLabel ()

@property (nonatomic,strong)UIColor *normalColor;

@end

@implementation TYLCopyLabel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addLongPressGesture];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addLongPressGesture];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self addLongPressGesture];
}

- (void)addLongPressGesture
{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPressGesture:)];
    [self addGestureRecognizer:longPress];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(menuControllerWillHideMenu) name:UIMenuControllerWillHideMenuNotification object:nil];
}

- (void)menuControllerWillHideMenu
{
    if (self.normalColor) {
        //取消第一响应者
        [self resignFirstResponder];
        self.backgroundColor = self.normalColor;
        self.normalColor = nil;
    }
}

//设置高亮颜色,这里取的为朋友圈文字被选中时的颜色
- (void)setHeightedBackgroundColor
{
    if (!self.normalColor) {
        self.normalColor = self.backgroundColor;
        self.backgroundColor = [UIColor colorWithRed:((float)((0xc7c7c5 & 0xFF0000) >> 16))/255.0 green:((float)((0xc7c7c5 & 0xFF00) >> 8))/255.0 blue:((float)(0xc7c7c5 & 0xFF))/255.0 alpha:1.0];
    }
}


- (void)handleLongPressGesture:(UILongPressGestureRecognizer *)longPress
{
    if ([UIMenuController sharedMenuController].menuVisible) {
        return;
    }
    //不成为第一响应者无法弹出UIMenuController
    [self becomeFirstResponder];
    //微信朋友圈长按出现的颜色
    [self setHeightedBackgroundColor];
    //NSLocalizedString(@"copy", @"");
    UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制"
                                                      action:@selector(begainCopy:)];
    [[UIMenuController sharedMenuController] setMenuItems:@[copyLink]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
}

//为了能接收到事件（能成为第一响应者），我们需要覆盖一个方法：
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
//还需要针对复制的操作覆盖两个方法：
// 可以响应的方法
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(begainCopy:));
}

//复制
-(void)begainCopy:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.text;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIMenuControllerWillHideMenuNotification object:nil];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
@end