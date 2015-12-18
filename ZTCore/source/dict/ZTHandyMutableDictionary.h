//
//  NSMutableDictionary+BisMutableDictionary.h
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Handy)
/**
 *
 *  更安全的方法添加对象到字典
 *
 *  @param anObject 若为nil，则什么都不做
 *  @param aKey     若为nil，则什么都不做
 */
- (void)setSafeObject:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 *
 *  更安全的方法添加网络请求参数
 *
 *  @param anObject 若为nil，则置为 @“”
 *  @param aKey     若为nil，则什么都不做
 */
- (void)setPostObj:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 *
 *  对基础数据类型的安全存储API
 */
- (void)setInt:(int)intValue forKey:(id<NSCopying>)aKey;
- (void)setDouble:(double)doubleValue forKey:(id<NSCopying>)aKey;
- (void)setFloat:(float)floatValue forKey:(id<NSCopying>)aKey;
@end
