//
//  NSDictionary+BisDictionary.m
//  Recyclers
//
//  Created by 翟冰涛 on 15/11/23.
//  Copyright © 2015年 Recycle. All rights reserved.
//

#import "NSDictionary+BisDictionary.h"

@implementation NSDictionary (BisDictionary)

- (id)bis_safeObjectForKey:(id<NSCopying>)aKey {
    if (aKey == nil) {
        return nil;
    }
    
    return [self objectForKey:aKey];
}

- (NSString *)bis_stringValueForKey:(id)key {
    id obj = [self bis_safeObjectForKey:key];
    
    if ([obj respondsToSelector:@selector(stringValue)]) {
        return [obj stringValue];
    }
    
    return nil;
}
- (NSDictionary *)bis_dictionaryValueForKey:(id)key {
    id obj = [self bis_safeObjectForKey:key];
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)obj;
    }
    
    return nil;
}

- (NSArray *)bis_arrayValueForKey:(id)key {
    id obj = [self bis_safeObjectForKey:key];
    
    if ([obj isKindOfClass:[NSArray class]]) {
        return (NSArray *)obj;
    }
    
    return nil;
}

@end
