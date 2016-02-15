//
//  UIButton+Block.m
//  onemap.supermap
//
//  Created by 月光 on 15/5/26.
//  Copyright (c) 2015年 月光. All rights reserved.
//

#import "UIButton+Block.h"

//#import <Foundation/NSObjCRuntime.h>
//引用oc 运行时
#import <objc/runtime.h>
//#import "/usr/include/objc/runtime.h"

@implementation UIButton (Block)

static char overviewKey;
static char paramKey;
//动态事件
@dynamic actions;
//设置事件
- (void) setAction:(NSString*)action withBlock:(void(^)())block {
    if ([self actions] == nil) {
        [self setActions:[[NSMutableDictionary alloc] init]];
        
    }
    [[self actions] setObject:block forKey:action];
    if ([kUIButtonBlockTouchUpInside isEqualToString:action]) {
        
        [self addTarget:self action:@selector(doTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}

- (void)setActions:(NSMutableDictionary*)actions {
    //关联
    objc_setAssociatedObject (self,&overviewKey,actions,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
//获取
- (NSMutableDictionary*)actions {
    return objc_getAssociatedObject(self, &overviewKey);
    
}

//点击是阿金
- (void)doTouchUpInside:(id)sender {
    void(^block)();
    block = [[self actions] objectForKey:kUIButtonBlockTouchUpInside];
    block();
    
}

- (void)setParam:(NSMutableDictionary *) params {
    
    objc_setAssociatedObject (self, &paramKey,params,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (NSString*)param {
    
    return objc_getAssociatedObject (self, &paramKey);
    
}

@end
