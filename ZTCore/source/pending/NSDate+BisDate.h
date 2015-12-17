//
//  NSDate+BisDate.h
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BisDate)
/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)bis_day;
- (NSUInteger)bis_month;
- (NSUInteger)bis_year;
- (NSUInteger)bis_hour;
- (NSUInteger)bis_minute;
- (NSUInteger)bis_second;
+ (NSUInteger)bis_day:(NSDate *)bis_date;
+ (NSUInteger)bis_month:(NSDate *)bis_date;
+ (NSUInteger)bis_year:(NSDate *)bis_date;
+ (NSUInteger)bis_hour:(NSDate *)bis_date;
+ (NSUInteger)bis_minute:(NSDate *)bis_date;
+ (NSUInteger)bis_second:(NSDate *)bis_date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)bis_daysInYear;
+ (NSUInteger)bis_daysInYear:(NSDate *)bis_date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)bis_isLeapYear;
+ (BOOL)bis_isLeapYear:(NSDate *)bis_date;
+ (BOOL)bis_isLeapYearWithYear:(int)year;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)bis_weekOfYear;
+ (NSUInteger)bis_weekOfYear:(NSDate *)bis_date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)bis_formatYMD;
+ (NSString *)bis_formatYMD:(NSDate *)bis_date;

/**
 * 返回当前月一共有几周(可能为4,5,6)bis_
 */
- (NSUInteger)bis_weeksOfMonth;
+ (NSUInteger)bis_weeksOfMonth:(NSDate *)bis_date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)bis_begindayOfMonth;
+ (NSDate *)bis_begindayOfMonth:(NSDate *)bis_date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)bis_lastdayOfMonth;
+ (NSDate *)bis_lastdayOfMonth:(NSDate *)bis_date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)bis_
 */
- (NSDate *)bis_dateAfterDay:(NSUInteger)bis_day;
+ (NSDate *)bis_dateAfterDate:(NSDate *)bis_date day:(NSInteger)bis_day;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)bis_
 */
- (NSDate *)bis_dateAfterMonth:(NSUInteger)bis_month;
+ (NSDate *)bis_dateAfterDate:(NSDate *)bis_date month:(NSInteger)bis_month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)bis_offsetYears:(int)bis_numYears;
+ (NSDate *)bis_offsetYears:(int)bis_numYears fromDate:(NSDate *)bis_fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)bis_offsetMonths:(int)bis_numMonths;
+ (NSDate *)bis_offsetMonths:(int)bis_numMonths fromDate:(NSDate *)bis_fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)bis_offsetDays:(int)bis_numDays;
+ (NSDate *)bis_offsetDays:(int)bis_numDays fromDate:(NSDate *)bis_fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)bis_offsetHours:(int)bis_hours;
+ (NSDate *)bis_offsetHours:(int)bis_numHours fromDate:(NSDate *)bis_fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)bis_daysAgo;
+ (NSUInteger)bis_daysAgo:(NSDate *)bis_date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)bis_weekday;
+ (NSInteger)bis_weekday:(NSDate *)bis_date;

/**
 *  获取星期几(名称)bis_
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)bis_dayFromWeekday;
+ (NSString *)bis_dayFromWeekday:(NSDate *)bis_date;

/**
 *  日期是否相等
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)bis_isSameDay:(NSDate *)bis_anotherDate;

/**
 *  是否是今天
 *
 *  @return Return if self is today
 */
- (BOOL)bis_isToday;

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)bis_dateByAddingDays:(NSUInteger)bis_days;

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)bis_monthWithMonthNumber:(NSInteger)bis_month;

/**
 * 根据日期返回字符串
 */
+ (NSString *)bis_stringWithDate:(NSDate *)bis_date format:(NSString *)bis_format;
- (NSString *)bis_stringWithFormat:(NSString *)bis_format;
+ (NSDate *)bis_dateWithString:(NSString *)bis_string format:(NSString *)bis_format;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)bis_daysInMonth:(NSUInteger)bis_month;
+ (NSUInteger)bis_daysInMonth:(NSDate *)bis_date month:(NSUInteger)bis_month;
+ (NSUInteger)bis_dayInYear:(NSUInteger)year month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)bis_daysInMonth;
+ (NSUInteger)bis_daysInMonth:(NSDate *)bis_date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)bis_timeInfo;
+ (NSString *)bis_timeInfoWithDate:(NSDate *)bis_date;
+ (NSString *)bis_timeInfoWithDateString:(NSString *)bis_dateString;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)bis_ymdFormat;
- (NSString *)bis_hmsFormat;
- (NSString *)bis_ymdHmsFormat;
+ (NSString *)bis_ymdFormat;
+ (NSString *)bis_hmsFormat;
+ (NSString *)bis_ymdHmsFormat;

/**
 * @author  
 *
 * @param  date fromDate
 *
 * @return a NSDateComponents object
 */
+ (NSDateComponents *)bis_dateComponentsWithDate:(NSDate *)date;

/**
 * @author  
 *
 * 将日期转换成时间戳
 */
- (NSString *)bis_toTimeStamp;

/**
 * @author  
 *
 * 将时间戳转换成日期
 *
 * @param timeStamp 时间戳
 */
+ (NSDate *)bis_toDateWithTimeStamp:(NSString *)timeStamp;

/**
 * @author  
 *
 * 将国际日期转换成本地日期（系统日期，因为我们国家地处东八区，会与国际相关8个时区）
 *
 * @param anyDate 国际日期
 *
 * @return 返回本地日期（系统日期）
 */
+ (NSDate *)bis_localDateWithDate:(NSDate *)anyDate;
@end
