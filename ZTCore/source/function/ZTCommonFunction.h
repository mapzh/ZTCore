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


#if defined __cplusplus
};
#endif