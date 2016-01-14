//
//  TYLCopyLabel.h
//  TYLCopyLabel
//
//  Created by Lengain on 16/1/12.
//  Copyright © 2016年 Lengain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYLCopyLabel : UILabel

@property(nonatomic, assign)BOOL    isClickCopy;        //点击复制，如果没设置或为NO，则默认为长按复制

@property(nonatomic, strong)UIColor  *highLightColor;    //高亮颜色

@end
