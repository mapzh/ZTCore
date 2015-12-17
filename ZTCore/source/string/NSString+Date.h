//
//  NSString+Date.h
//  Pods
//
//  Created by 马成林 on 15/11/12.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Date)
//时间戳与时间的转换
+ (NSString *)dateStringFromDate:(NSDate *)date format:(NSString *)format;
- (NSString *)dateStringWithFormat:(NSString *)format;

@end
