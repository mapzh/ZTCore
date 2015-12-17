//
//  NSDate+BisDate.m
//  BiscuitCoreDemo
//
//  Created by 翟冰涛 on 15/12/7.
//  Copyright © 2015年 mapengzhen. All rights reserved.
//

#import "NSDate+BisDate.h"

@implementation NSDate (BisDate)
- (NSUInteger)bis_day {
    return [NSDate bis_day:self];
}

- (NSUInteger)bis_month {
    return [NSDate bis_month:self];
}

- (NSUInteger)bis_year {
    return [NSDate bis_year:self];
}

- (NSUInteger)bis_hour {
    return [NSDate bis_hour:self];
}

- (NSUInteger)bis_minute {
    return [NSDate bis_minute:self];
}

- (NSUInteger)bis_second {
    return [NSDate bis_second:self];
}

+ (NSUInteger)bis_day:(NSDate *)bis_date {
    return [[self bis_dateComponentsWithDate:bis_date] day];
}

+ (NSUInteger)bis_month:(NSDate *)bis_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth)fromDate:bis_date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit)fromDate:bis_date];
#endif
    
    return [dayComponents month];
}

+ (NSUInteger)bis_year:(NSDate *)bis_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear)fromDate:bis_date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit)fromDate:bis_date];
#endif
    
    return [dayComponents year];
}

+ (NSUInteger)bis_hour:(NSDate *)bis_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour)fromDate:bis_date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit)fromDate:bis_date];
#endif
    
    return [dayComponents hour];
}

+ (NSUInteger)bis_minute:(NSDate *)bis_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute)fromDate:bis_date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit)fromDate:bis_date];
#endif
    
    return [dayComponents minute];
}

+ (NSUInteger)bis_second:(NSDate *)bis_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond)fromDate:bis_date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit)fromDate:bis_date];
#endif
    
    return [dayComponents second];
}

- (NSUInteger)bis_daysInYear {
    return [NSDate bis_daysInYear:self];
}

+ (NSUInteger)bis_daysInYear:(NSDate *)bis_date {
    return [self bis_isLeapYear:bis_date] ? 366 : 365;
}

- (BOOL)bis_isLeapYear {
    return [NSDate bis_isLeapYear:self];
}

+ (BOOL)bis_isLeapYear:(NSDate *)bis_date {
    int year = (int)[bis_date bis_year];
    return [self bis_isLeapYearWithYear:year];
}

+ (BOOL)bis_isLeapYearWithYear:(int)year {
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    
    return NO;
}

- (NSString *)bis_formatYMD {
    return [NSDate bis_formatYMD:self];
}

+ (NSString *)bis_formatYMD:(NSDate *)bis_date {
    return [NSString stringWithFormat:@"%ld-%02ld-%02ld",
            (long)[bis_date bis_year],
            (long)[bis_date bis_month],
            (long)[bis_date bis_day]];
}

- (NSUInteger)bis_weeksOfMonth {
    return [NSDate bis_weeksOfMonth:self];
}

+ (NSUInteger)bis_weeksOfMonth:(NSDate *)bis_date {
    return [[bis_date bis_lastdayOfMonth] bis_weekOfYear] - [[bis_date bis_begindayOfMonth] bis_weekOfYear] + 1;
}

- (NSUInteger)bis_weekOfYear {
    return [NSDate bis_weekOfYear:self];
}

+ (NSUInteger)bis_weekOfYear:(NSDate *)bis_date {
    NSUInteger i;
    NSUInteger year = [bis_date bis_year];
    
    NSDate *lastdate = [bis_date bis_lastdayOfMonth];
    
    for (i = 1;[[lastdate bis_dateAfterDay:-7 * i] bis_year] == year; i++) {
        
    }
    
    return i;
}

- (NSDate *)bis_dateAfterDay:(NSUInteger)bis_day {
    return [NSDate bis_dateAfterDate:self day:bis_day];
}

+ (NSDate *)bis_dateAfterDate:(NSDate *)bis_date day:(NSInteger)bis_day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:bis_day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:bis_date options:0];
    
    return dateAfterDay;
}

- (NSDate *)bis_dateAfterMonth:(NSUInteger)bis_month {
    return [NSDate bis_dateAfterDate:self month:bis_month];
}

+ (NSDate *)bis_dateAfterDate:(NSDate *)bis_date month:(NSInteger)bis_month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:bis_month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:bis_date options:0];
    
    return dateAfterMonth;
}

- (NSDate *)bis_begindayOfMonth {
    return [NSDate bis_begindayOfMonth:self];
}

+ (NSDate *)bis_begindayOfMonth:(NSDate *)bis_date {
    return [self bis_dateAfterDate:bis_date day:-[bis_date bis_day] + 1];
}

- (NSDate *)bis_lastdayOfMonth {
    return [NSDate bis_lastdayOfMonth:self];
}

+ (NSDate *)bis_lastdayOfMonth:(NSDate *)bis_date {
    NSDate *lastDate = [self bis_begindayOfMonth:bis_date];
    return [[lastDate bis_dateAfterMonth:1] bis_dateAfterDay:-1];
}

- (NSUInteger)bis_daysAgo {
    return [NSDate bis_daysAgo:self];
}

+ (NSUInteger)bis_daysAgo:(NSDate *)bis_date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:bis_date
                                                 toDate:[NSDate date]
                                                options:0];
#else
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:bis_date
                                                 toDate:[NSDate date]
                                                options:0];
#endif
    
    return [components day];
}

- (NSInteger)bis_weekday {
    return [NSDate bis_weekday:self];
}

+ (NSInteger)bis_weekday:(NSDate *)bis_date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:bis_date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

- (NSString *)bis_dayFromWeekday {
    return [NSDate bis_dayFromWeekday:self];
}

+ (NSString *)bis_dayFromWeekday:(NSDate *)bis_date {
    switch([bis_date bis_weekday]) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)bis_isSameDay:(NSDate *)bis_anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:bis_anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}

- (BOOL)bis_isToday {
    return [self bis_isSameDay:[NSDate date]];
}

- (NSDate *)bis_dateByAddingDays:(NSUInteger)bis_days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = bis_days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

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
+ (NSString *)bis_monthWithMonthNumber:(NSInteger)bis_month {
    switch(bis_month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)bis_stringWithDate:(NSDate *)bis_date format:(NSString *)bis_format {
    return [bis_date bis_stringWithFormat:bis_format];
}

- (NSString *)bis_stringWithFormat:(NSString *)bis_format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:bis_format];
    [outputFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *retStr = [outputFormatter stringFromDate:self];
    
    return retStr;
}

+ (NSDate *)bis_dateWithString:(NSString *)bis_string format:(NSString *)bis_format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:bis_format];
    [inputFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate *date = [inputFormatter dateFromString:bis_string];
    
    return date;
}

- (NSUInteger)bis_daysInMonth:(NSUInteger)bis_month {
    return [NSDate bis_daysInMonth:self month:bis_month];
}

+ (NSUInteger)bis_dayInYear:(NSUInteger)year month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [self bis_isLeapYearWithYear:year] ? 29 : 28;
    }
    
    return 30;
}

+ (NSUInteger)bis_daysInMonth:(NSDate *)bis_date month:(NSUInteger)bis_month {
    switch (bis_month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [bis_date bis_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)bis_daysInMonth {
    return [NSDate bis_daysInMonth:self];
}

+ (NSUInteger)bis_daysInMonth:(NSDate *)bis_date {
    return [self bis_daysInMonth:bis_date month:[bis_date bis_month]];
}

- (NSString *)bis_timeInfo {
    return [NSDate bis_timeInfoWithDate:self];
}

+ (NSString *)bis_timeInfoWithDate:(NSDate *)bis_date {
    return [self bis_timeInfoWithDateString:[self bis_stringWithDate:bis_date format:[self bis_ymdHmsFormat]]];
}

+ (NSString *)bis_timeInfoWithDateString:(NSString *)bis_dateString {
    NSDate *date = [self bis_dateWithString:bis_dateString format:[self bis_ymdHmsFormat]];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    int month = (int)([curDate bis_month] - [date bis_month]);
    int year = (int)([curDate bis_year] - [date bis_year]);
    int day = (int)([curDate bis_day] - [date bis_day]);
    
    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && [curDate bis_month] == 1 && [date bis_month] == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self bis_daysInMonth:date month:[date bis_month]];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate bis_day] + (totalDays - (int)[date bis_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)[curDate bis_month];
            int preMonth = (int)[date bis_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";
}

- (NSString *)bis_ymdFormat {
    return [NSDate bis_ymdFormat];
}

- (NSString *)bis_hmsFormat {
    return [NSDate bis_hmsFormat];
}

- (NSString *)bis_ymdHmsFormat {
    return [NSDate bis_ymdHmsFormat];
}

+ (NSString *)bis_ymdFormat {
    return @"yyyy-MM-dd";
}

+ (NSString *)bis_hmsFormat {
    return @"HH:mm:ss";
}

+ (NSString *)bis_ymdHmsFormat {
    return [NSString stringWithFormat:@"%@ %@", [self bis_ymdFormat], [self bis_hmsFormat]];
}

- (NSDate *)bis_offsetYears:(int)bis_numYears {
    return [NSDate bis_offsetYears:bis_numYears fromDate:self];
}

+ (NSDate *)bis_offsetYears:(int)bis_numYears fromDate:(NSDate *)bis_fromDate {
    if (bis_fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:bis_numYears];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:bis_fromDate
                                     options:0];
}

- (NSDate *)bis_offsetMonths:(int)bis_numMonths {
    return [NSDate bis_offsetMonths:bis_numMonths fromDate:self];
}

+ (NSDate *)bis_offsetMonths:(int)bis_numMonths fromDate:(NSDate *)bis_fromDate {
    if (bis_fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:bis_numMonths];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:bis_fromDate
                                     options:0];
}

- (NSDate *)bis_offsetDays:(int)bis_numDays {
    return [NSDate bis_offsetDays:bis_numDays fromDate:self];
}

+ (NSDate *)bis_offsetDays:(int)bis_numDays fromDate:(NSDate *)bis_fromDate {
    if (bis_fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:bis_numDays];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:bis_fromDate
                                     options:0];
}

- (NSDate *)bis_offsetHours:(int)bis_hours {
    return [NSDate bis_offsetHours:bis_hours fromDate:self];
}

+ (NSDate *)bis_offsetHours:(int)bis_numHours fromDate:(NSDate *)bis_fromDate {
    if (bis_fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:bis_numHours];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:bis_fromDate
                                     options:0];
}

+ (NSDateComponents *)bis_dateComponentsWithDate:(NSDate *)date {
    NSCalendar *calendar = nil;
    NSUInteger flags = 0;
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour
    | NSCalendarUnitMinute | NSCalendarUnitSecond;
#else
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit
    | NSMinuteCalendarUnit | NSSecondCalendarUnit;
#endif
    [calendar setTimeZone:[NSTimeZone systemTimeZone]];
    
    return [calendar components:flags fromDate:date];
}

- (NSString *)bis_toTimeStamp {
    return [NSString stringWithFormat:@"%lf", [self timeIntervalSince1970]];
}

+ (NSDate *)bis_toDateWithTimeStamp:(NSString *)timeStamp {
    NSString *arg = timeStamp;
    if (![timeStamp isKindOfClass:[NSString class]]) {
        arg = [NSString stringWithFormat:@"%@", timeStamp];
    }
    NSTimeInterval time = [timeStamp doubleValue];
    return [NSDate dateWithTimeIntervalSince1970:time];
}


+ (NSDate *)bis_localDateWithDate:(NSDate *)anyDate {
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}
@end
