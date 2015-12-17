//
//  BiscuitDate.m
//  Pods
//
//  Created by 马成林 on 15/11/12.
//
//

#import "ZTDate.h"

@implementation ZTDate
+ (NSDate *)dateFromTimestamp:(NSString *)timestamp{
    NSScanner* scan = [NSScanner scannerWithString:timestamp];
    double val;
    BOOL isNum = [scan scanDouble:&val] && [scan isAtEnd];
    if (isNum) {
        double thousandT = timestamp.doubleValue;
        double t = thousandT/1000.00;
        return [NSDate dateWithTimeIntervalSince1970:t];
    }
    return [NSDate date];
}
@end
