//
//  NSMutableArray+BisMutableArray.m
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//

#import "ZTHandyMutableArray.h"
@implementation NSMutableArray (Handy)
- (BOOL)exchangeObjectFromIndex:(NSUInteger)from
                            toIndex:(NSUInteger)to {
    if ([self count] == 0 && to != from && from < [self count] && to < [self count]) {
        id obj = [self safeObjectAtIndex:from];
        [self safeRemoveObjectAtIndex:from];
        
        if(to >= [self count]) {
            [self addObject:obj];
        } else {
            [self insertObject:obj atIndex:to];
        }
        
        return YES;
    }
    
    return NO;
}

- (BOOL)safeRemoveObject:(id)anObject {
    if (anObject == nil) {
        NSLog(@"待移除对象为空，不需要移除");
        return NO;
    }
    
    if (![self containsObject:anObject]) {
        NSLog(@"待移除对象不在数组中，无法移除");
        return NO;
    }
    
    [self removeObject:anObject];
    return YES;
}

- (BOOL)safeRemoveObjectAtIndex:(NSUInteger)atIndex {
    if (atIndex >= self.count) {
        NSLog(@"索引越界，超出数组最大个数，请检查边界条件");
        return NO;
    }
    
    [self removeObjectAtIndex:atIndex];
    
    return YES;
}

- (BOOL)safeInsertObject:(id)anObject atIndex:(NSUInteger)atIndex {
    if (anObject == nil) {
        NSLog(@"待插入对象为空，不需要添加");
        return NO;
    }
    
    if ([self containsObject:anObject]) {
        NSLog(@"待插入对象已经存在数组中，不需要插入");
        return NO;
    }
    
    [self insertObject:anObject atIndex:atIndex];
    
    return YES;
}
@end
