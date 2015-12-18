//
//  ZTSafeDictionnary.m
//  ZTCoreDemo
//
//  Created by mapengzhen on 15/12/18.
//  Copyright © 2015年 Biscuit. All rights reserved.
//

#import "ZTSafeDictionnary.h"

@implementation NSDictionary (Safe)

- (id)safeObjectForKey:(id<NSCopying>)aKey {
    if (aKey == nil) {
        return nil;
    }
    
    return [self objectForKey:aKey];
}

- (NSString *)stringValueForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    
    if ([obj respondsToSelector:@selector(stringValue)]) {
        return [obj stringValue];
    }
    
    return nil;
}
- (NSDictionary *)dictionaryValueForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)obj;
    }
    
    return nil;
}

- (NSArray *)arrayValueForKey:(id)key {
    id obj = [self safeObjectForKey:key];
    
    if ([obj isKindOfClass:[NSArray class]]) {
        return (NSArray *)obj;
    }
    
    return nil;
}

@end
