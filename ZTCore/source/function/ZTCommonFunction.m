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