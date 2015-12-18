//
//  NSMutableArray+BisMutableArray.h
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//

#import "ZTHandyArray.h"

@interface NSMutableArray (Handy)
/**
 *  @author  
 *
 *  将两个元素互换位置
 *
 *  @param from The index to move from
 *  @param to   The index to move to
 *
 *  @return YES，表示移动成功，NO表示移动失败
 */
- (BOOL)exchangeObjectFromIndex:(NSUInteger)from
                            toIndex:(NSUInteger)to;


/**
 *  @author  
 *
 *  将对象移除
 *
 *  @param atIndex  位置
 *  @return YES 表示成功，NO表示失败
 */
- (BOOL)safeRemoveObjectAtIndex:(NSUInteger)atIndex;

/**
 *  @author  
 *
 *  将对象移除
 *
 *  @param anObject  待移除对象
 *
 *  @return YES，表示成功，NO表示失败
 */
- (BOOL)safeRemoveObject:(id)anObject;

/**
 * @author  
 *
 * @param anObject 待插入对象
 * @param atIndex  插入位置
 *
 * @return YES表示成功，NO表示插入失败
 */
- (BOOL)safeInsertObject:(id)anObject atIndex:(NSUInteger)atIndex;
@end
