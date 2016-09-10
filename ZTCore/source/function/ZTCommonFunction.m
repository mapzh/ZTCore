//
//  ZTCommonFunction.m
//  ZTCoreDemo
//
//  Created by mapengzhen on 16/9/10.
//  Copyright © 2016年 Biscuit. All rights reserved.
//

#import "ZTCommonFunction.h"

BOOL isNotEmptyArray(NSArray *arr){
    return (arr&&[arr isKindOfClass:[NSArray class]]&&arr.count>0);
}

BOOL isNotEmptyDictionary(NSDictionary *dict){
    return (dict&&[dict isKindOfClass:[NSDictionary class]]&&dict.count>0);
}

BOOL isNotEmptyString(NSString *str){
    return (str&&[str isKindOfClass:[NSString class]]&&str.length>0);
}

void ZTAddObserver(id observer, SEL selector, NSString *notifyName, id object){
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:notifyName object:object];
}

void ZTNotify(NSString *notifyName, id object, NSDictionary *aUserInfo){
    [[NSNotificationCenter defaultCenter] postNotificationName:notifyName object:object userInfo:aUserInfo];
}

void ZTRemoveObserver(id observer){
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

void ZTRemoveNotifyForObserver(id observer, NSString *notifyName){
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:notifyName object:nil];
}