//
//  NSArray+BisArray.m
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//

#import "NSArray+BisArray.h"

@implementation NSArray (BisArray)
- (id)bis_safeObjectAtIndex:(NSUInteger)index {
    NSUInteger count = [self count];
    
    if (count > 0 && index < count) {
        return [self objectAtIndex:index];
    }
    
    return nil;
}

- (NSArray *)bis_reversedArray {
    return [NSArray bis_reversedArray:self];
}

+ (NSArray *)bis_reversedArray:(NSArray *)array {
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[array count]];
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    
    for (id element in enumerator) {
        [arrayTemp addObject:element];
    }
    
    return array;
}

- (NSString *)bis_toJson {
    return [NSArray bis_toJson:self];
}

+ (NSString *)bis_toJson:(NSArray *)array {
    if (![array isKindOfClass:[NSArray class]] || array == nil || array.count == 0) {
        return nil;
    }
    NSString *json = nil;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
    
    if (!error) {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return json;
    }
    
    return nil;
}

- (BOOL)bis_isContainsString:(NSString *)string {
    for (NSString *element in self) {
        if ([element isKindOfClass:[NSString class]] && [element isEqualToString:string]) {
            return true;
        }
    }
    
    return false;
}
@end
