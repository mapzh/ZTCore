//
//  ZTCommonFunction.h
//  ZTCoreDemo
//
//  Created by mapengzhen on 16/9/10.
//  Copyright © 2016年 Biscuit. All rights reserved.
//

#import <Foundation/Foundation.h>

#if defined __cplusplus
extern "C" {
#endif

    
//判断是否空数组
BOOL isNotEmptyArray(NSArray *arr);

//判断是否空字典
BOOL isNotEmptyDictionary(NSDictionary *dict);

//判断是否空字符串
BOOL isNotEmptyString(NSString *str);

//添加监听
void ZTAddObserver(id observer, SEL selector, NSString *notifyName, id object);

//发送通知
void ZTNotify(NSString *notifyName, id object, NSDictionary *aUserInfo);

//去除监听者
void ZTRemoveObserver(id observer);

//为监听者去除指定监听
void ZTRemoveNotifyForObserver(id observer, NSString *notifyName);


    
#if defined __cplusplus
};
#endif