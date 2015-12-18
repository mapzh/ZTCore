//
//  NSMutableDictionary+BisMutableDictionary.m
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//

#import "ZTHandyMutableDictionary.h"

@implementation NSMutableDictionary (Handy)
- (void)setSafeObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (aKey == nil) {
        NSLog(@"setSafeObject 检测到 key为空，会直接跳过而不执行");
        return;
    }
    
    if (anObject == nil) {
        NSLog(@"setSafeObject 检测到 anObject为空，会直接跳过而不执行");
        return;
    }
    
    if ([anObject isKindOfClass:[NSString class]]) {
        NSString *obj = (NSString *)anObject;
        if (obj.length == 0) {
            NSLog(@"setSafeObject 检测到 anObject为空字符串，会直接跳过而不执行");
            return;
        }
    }
    
    [self setObject:anObject forKey:aKey];
}

- (void)setPostObj:(id)anObject forKey:(id<NSCopying>)aKey {
    if (aKey == nil) {
        NSLog(@"setSafeObject 检测到 key为空，会直接跳过而不执行");
        return;
    }
    
    if (anObject == nil) {
        NSLog(@"setSafeObject 检测到 anObject为空，置为 @"" ");
        anObject = @"";
    }
    
    [self setObject:anObject forKey:aKey];
}

- (void)setInt:(int)intValue forKey:(id<NSCopying>)aKey {
    [self setSafeObject:@(intValue) forKey:aKey];
}

- (void)setDouble:(double)doubleValue forKey:(id<NSCopying>)aKey {
    [self setSafeObject:@(doubleValue) forKey:aKey];
}

- (void)setFloat:(float)floatValue forKey:(id<NSCopying>)aKey {
    [self setSafeObject:@(floatValue) forKey:aKey];
}
@end
