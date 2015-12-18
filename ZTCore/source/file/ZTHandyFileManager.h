//
//  NSFileManager+BisFileManager.h
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Handy)
/*!
 * @author   
 *
 * @brief 判断文件是否存在
 *
 * @param filePath 文件路径名
 *
 * @return 返回YES表示存在，返回NO表示不存在
 */
- (BOOL) isFileExists:(NSString *)filePath;

/*!
 * @author   
 *
 * @brief 判断文件是否超时
 *
 * @param filePath 文件路径名
 * @param timeout 限制的超时时间，单位为秒
 *
 * @return 返回YES表示超时，返回NO表示未超时
 */
- (BOOL) isFile:(NSString *)filePath timeout:(NSTimeInterval)timeout;

/*!
 * @author   
 *
 * @brief 根据路径获取文件的大小
 *
 * @param filePath 文件路径名
 *
 * @return 文件的大小
 */
- (long) fileSizeWithPath:(NSString *)path;
@end
