//
//  UIButton+Block.h
//  onemap.supermap
//
//  Created by 月光 on 15/5/26.
//  Copyright (c) 2015年 月光. All rights reserved.
//
//

//定义点击事件
#define kUIButtonBlockTouchUpInside @"TouchInside"


#import <UIKit/UIKit.h>

/*
 参考
 http://blog.csdn.net/wuzehai02/article/details/8486421
 <p>传参的时候就用
 NSMutableDictionary *parmas=[[NSMutableDictionary alloc] init];
 [button setPara:params]
 
 得到参数
 buttonAction:(id)sender{
 NSMutableDictionary  *parms= [(UIButton *) sender param];
 }
事件 
 [cancelButton setAction:kUIButtonBlockTouchUpInside withBlock:^{

 }];
 </p>
 */
@interface UIButton (Block)


@property (nonatomic, strong) NSMutableDictionary *actions;

//@property (nonatomic, strong) NSMutableDictionary *param;
//设置快
- (void) setAction:(NSString*)action withBlock:(void(^)())block;
//设置参数
- (void)setParam:(NSMutableDictionary *)params;
//参数
- (NSMutableDictionary*)param;

@end
