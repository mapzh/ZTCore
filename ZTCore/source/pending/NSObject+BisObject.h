//
//  NSObject+BisObject.h
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (BisObject)
/**
 * @author  
 *
 * 获取类名称
 */
- (NSString *)bis_className;

/*!
 * @author  
 *
 * 获取文本的高度、宽度
 *
 * @return 适应的宽高
 */
+ (CGSize)bis_sizeWithFont:(UIFont *)font text:(NSString *)text maxWidth:(CGFloat)maxWidth;
+ (CGSize)bis_sizeWithFontSize:(CGFloat)fontSize text:(NSString *)text;
+ (CGSize)bis_sizeWithBoldFontSize:(CGFloat)fontSize text:(NSString *)text;
+ (CGSize)bis_sizeWithFontSize:(CGFloat)fontSize text:(NSString *)text maxWidth:(CGFloat)maxWidth;

/*!
 * @author  
 *
 * @brief 把角度与弧度值互转
 *
 * @return 返回对应的弧度值/角度值
 */
+ (CGFloat)bis_degreesToRadian:(CGFloat)degree;
+ (CGFloat)bis_randianToDegrees:(CGFloat)radian;

/**
 * @author  
 *
 *  Create a random integer between the given range
 *
 *  @param minValue Mininum random value
 *  @param maxValue Maxinum random value
 *
 *  @return Return the created random integer
 */
+ (NSInteger)bis_randomIntBetweenMin:(NSInteger)minValue
                              andMax:(NSInteger)maxValue;

/**
 * @author  
 *
 *  Create a random float
 *
 *  @return Return the created random float
 */
+ (CGFloat)bis_randomFloat;

/**
 * @author  
 *
 *  Create a random float between the given range
 *
 *  @param minValue Mininum random value
 *  @param maxValue Maxinum random value
 *
 *  @return Return the created random float
 */
+ (CGFloat)bis_randomFloatBetweenMin:(CGFloat)minValue
                              andMax:(CGFloat)maxValue;

/*
 * @author  
 *
 * @brief 把对象转换成JSON格式数据
 *
 * @param object OC类型对象
 * @return 如果转换失败，返回nil，否则返回JSON格式数据
 */
+ (NSMutableData *)bis_JSONDataWithObject:(id)object;
+ (NSString *)bis_JSONStringWithObject:(id)object;

/*
 * @author  
 *
 * @brief 判断本机是否安装了某个应用，该应用是自己公司的产品
 *
 * @param urlSchemes 要判断的应用的URLSchemes，该参数值是由要判断的应用工程上配置的URLSchemes参数
 *
 * @return 返回YES表示本机已经安装了该应用，返回NO表示该应用未被安装
 */
+ (BOOL)bis_hasLocalInstallApp:(NSString *)urlSchemes;

/*
 * @author  
 *
 * @brief 判断能否打开指定的Itunes应用的链接
 *
 * @param itunesUrlString 要打开在Itunes上的应用的链接
 *
 * @return 返回YES表示可以打开该链接，返回NO表示无法打开该链接
 */
+ (BOOL)bis_canOpenApp:(NSString *)itunesUrlString;

/*
 * @author  
 *
 * @brief 在本机调起指定的应用
 *
 * @param urlSchemes 要判断的应用的URLSchemes，该参数值是由要调起的应用工程上配置的URLSchemes参数
 */
+ (void)bis_openLocalApp:(NSString *)urlSchemes;

/*
 * @author  
 *
 * @brief 进入APP Store
 *
 * @param itunesUrlString 要打开在Itunes上的应用的链接
 */
+ (void)bis_openAppStore:(NSString *)itunesUrlString;

/**
 * @author  
 *
 *  移除所有值为null的key-value
 *
 *  @param object OC-OBJECT
 */
+ (id)bis_removeNullFromObject:(id)object;
@end
