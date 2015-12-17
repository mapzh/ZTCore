//
//  NSObject+BisObject.m
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//
/**
 * 快速生成字体
 */
#define kFontWithSize(size) [UIFont systemFontOfSize:size]
#define kBoldFontWithSize(size) [UIFont boldSystemFontOfSize:size]

#import "NSObject+BisObject.h"


@implementation NSObject (BisObject)
+ (CGSize)bis_sizeWithFont:(UIFont *)font text:(NSString *)text maxWidth:(CGFloat)maxWidth {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = font;
    label.numberOfLines = 0;
    label.preferredMaxLayoutWidth = maxWidth;
    CGSize size = [label sizeThatFits:CGSizeMake(maxWidth, CGFLOAT_MAX)];
    return size;
}

+ (CGSize)bis_sizeWithFontSize:(CGFloat)fontSize text:(NSString *)text {
    return [self bis_sizeWithFont:kFontWithSize(fontSize) text:text maxWidth:CGFLOAT_MAX];
}

+ (CGSize)bis_sizeWithBoldFontSize:(CGFloat)fontSize text:(NSString *)text {
    return [self bis_sizeWithFont:kBoldFontWithSize(fontSize) text:text maxWidth:CGFLOAT_MAX];
}

+ (CGSize)bis_sizeWithFontSize:(CGFloat)fontSize text:(NSString *)text maxWidth:(CGFloat)maxWidth {
    return [self bis_sizeWithFont:kFontWithSize(fontSize) text:text maxWidth:maxWidth];
}

+ (CGFloat)bis_degreesToRadian:(CGFloat)degree {
    return (M_PI * degree) / 180.0;
}

+ (CGFloat)bis_randianToDegrees:(CGFloat)radian {
    return (radian * 180.0) / M_PI;
}

+ (NSInteger)bis_randomIntBetweenMin:(NSInteger)minValue andMax:(NSInteger)maxValue {
    return (NSInteger)(minValue + [self bis_randomFloat] * (maxValue - minValue));
}

+ (CGFloat)bis_randomFloat {
    return (float) arc4random() / UINT_MAX;
}

+ (CGFloat)bis_randomFloatBetweenMin:(CGFloat)minValue andMax:(CGFloat)maxValue {
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * (maxValue - minValue)) + minValue;
}

+ (NSMutableData *)bis_JSONDataWithObject:(id)object {
    NSMutableData *postBodyData = nil;
    
    if ([NSJSONSerialization isValidJSONObject:object]) {
        NSError *error = nil;
        NSData *postData = [NSJSONSerialization dataWithJSONObject:object
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        if (error) {
            NSLog(@"error: %@", error.description);
        } else {
            postBodyData = [[NSMutableData alloc] initWithData:postData];
        }
    }
    
    return postBodyData;
}

+ (NSString *)bis_JSONStringWithObject:(id)object {
    NSMutableData *data = [self bis_JSONDataWithObject:object];
    
    if (data.length) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    return nil;
}

+ (BOOL)bis_hasLocalInstallApp:(NSString *)urlSchemes {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlSchemes]]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)bis_canOpenApp:(NSString *)itunesUrlString {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:itunesUrlString]]) {
        return YES;
    }
    
    return NO;
}

+ (void)bis_openLocalApp:(NSString *)urlSchemes {
    if ([self bis_canOpenApp:urlSchemes]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlSchemes]];
    }
}

+ (void)bis_openAppStore:(NSString *)itunesUrlString {
#if TARGET_IPHONE_SIMULATOR
    NSLog(@"虚拟机不支持APP Store.打开iTunes不会有效果。");
#else
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:itunesUrlString]];
#endif
    return;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (NSString *)bis_className {
    return NSStringFromClass([self class]);
}

+ (id)bis_removeNullFromObject:(id)object {
    if ([object isKindOfClass:[NSDictionary class]]) {
        return [self _removeNullFromDict:(NSDictionary *)object];
    } else if ([object isKindOfClass:[NSArray class]]) {
        return [self _removeNullFromArray:(NSArray *)object];
    } else if ([object isKindOfClass:[NSNull class]] || object == nil) {
        return nil;
    }
    
    return object;
}

+ (NSDictionary *)_removeNullFromDict:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    NSMutableDictionary *resultDict = [NSMutableDictionary dictionaryWithCapacity:dict.count];
    for (id key in dict.allKeys) {
        id object = [dict objectForKey:key];
        
        if ([object isKindOfClass:[NSNull class]] || object == nil) {
            // 不添加
        } else if ([object isKindOfClass:[NSDictionary class]]) {
            object = [self _removeNullFromDict:(NSDictionary *)object];
            
            if (object != nil) {
                [resultDict setObject:object forKey:key];
            }
        } else if ([object isKindOfClass:[NSArray class]]) {
            object = [self _removeNullFromArray:(NSArray *)object];
            
            if (object != nil) {
                [resultDict setObject:object forKey:key];
            }
        } else {
            [resultDict setObject:object forKey:key];
        }
    }
    
    return resultDict;
}

+ (NSArray *)_removeNullFromArray:(NSArray *)array {
    if (array == nil || [array isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    if (array.count == 0) {
        return array;
    }
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] initWithCapacity:array.count];
    
    for (NSUInteger i = 0; i < array.count; ++i) {
        id object = array[i];
        
        if ([object isKindOfClass:[NSNull class]] || object == nil) {
            // 不添加
        } else if ([object isKindOfClass:[NSDictionary class]]) {
            object = [self _removeNullFromDict:(NSDictionary *)object];
            if (object != nil && ![object isKindOfClass:[NSNull class]]) {
                [resultArray addObject:object];
            }
        } else if ([object isKindOfClass:[NSArray class]]) {
            object = [self _removeNullFromArray:(NSArray *)object];
            if (object != nil && ![object isKindOfClass:[NSNull class]]) {
                [resultArray addObject:object];
            }
        } else {
            [resultArray addObject:object];
        }
    }
    
    return resultArray;
}
@end
