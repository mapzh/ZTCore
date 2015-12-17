//
//  NSDictionary+BisDictionary.h
//  Recyclers
//
//  Created by 翟冰涛 on 15/11/23.
//  Copyright © 2015年 Recycle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (BisDictionary)
/*!
 *  根据key值获取值，@return 如果存在，返回value，否则返回nil
 */
-(id)bis_safeObjectForKey:(id <NSCopying>)aKey;

/*!
 *
 * 根据key获取值
 *
 * @return 如果存在，返回value，否则返回nil
 */
- (NSDictionary *)bis_dictionaryValueForKey:(id)key;

/*!
 * 根据key获取值
 *
 * @return 如果存在，返回value，否则返回nil
 */
- (NSArray *)bis_arrayValueForKey:(id)key;

/*!
 *
 * 根据key获取值
 *
 * @return 如果存在，返回value，否则返回nil
 */
- (NSString *)bis_stringValueForKey:(id)key;
@end
