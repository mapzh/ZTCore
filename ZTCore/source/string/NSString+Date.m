//
//  NSString+Date.m
//  Pods
//
//  Created by 马成林 on 15/11/12.
//
//

#import "NSString+Date.h"
#import "ZTDate.h"

@implementation NSString (Date)

+ (NSString *)dateStringFromDate:(NSDate *)date format:(NSString *)format{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    NSString *datestr = [dateFormat stringFromDate:date];
    return datestr;
}

- (NSString *)dateStringWithFormat:(NSString *)format{
    NSDate *date = [ZTDate dateFromTimestamp:self];
    return [NSString dateStringFromDate:date format:format];
}

@end
