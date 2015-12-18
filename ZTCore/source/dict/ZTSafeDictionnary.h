//
//  ZTSafeDictionnary.h
//  ZTCoreDemo
//
//  Created by mapengzhen on 15/12/18.
//  Copyright © 2015年 Biscuit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

/*!
 *  根据key值获取值，@return 如果存在，返回value，否则返回nil
 */
-(id)safeObjectForKey:(id <NSCopying>)aKey;

/*!
 *
 * 根据key获取值
 *
 * @return 如果存在，返回value，否则返回nil
 */
- (NSDictionary *)dictionaryValueForKey:(id)key;

/*!
 * 根据key获取值
 *
 * @return 如果存在，返回value，否则返回nil
 */
- (NSArray *)arrayValueForKey:(id)key;

/*!
 *
 * 根据key获取值
 *
 * @return 如果存在，返回value，否则返回nil
 */
- (NSString *)stringValueForKey:(id)key;

@end
