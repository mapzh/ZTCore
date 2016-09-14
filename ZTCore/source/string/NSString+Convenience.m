//
//  NSString+Convenience.m
//  FingerBiscuit
//
//  Created by 马成林 on 15/8/18.
//  Copyright (c) 2015年 FingerBiscuit. All rights reserved.
//

#import "NSString+Convenience.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Convenience)
-(NSInteger)hexValue{
    CFStringRef cfSelf = (__bridge CFStringRef)self;
    UInt8 buffer[64];
    const char *cptr;
    
    if((cptr = CFStringGetCStringPtr(cfSelf, kCFStringEncodingMacRoman)) == NULL) {
        CFRange range     = CFRangeMake(0L, CFStringGetLength(cfSelf));
        CFIndex usedBytes = 0L;
        CFStringGetBytes(cfSelf, range, kCFStringEncodingUTF8, '?', false, buffer, 60L, &usedBytes);
        buffer[usedBytes] = 0;
        cptr              = (const char *)buffer;
    }
    
    return((NSInteger)strtol(cptr, NULL, 16));
}

- (NSString *)md5{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    size_t t1 = strlen(cStr);
    CC_LONG len1 = (CC_LONG)t1;
    CC_MD5( cStr, len1, result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];  
}

-(NSString*)trim{
    NSString *ret = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return ret;
}

- (NSDictionary *)queryDictionaryFromStringUsingEncoding:(NSStringEncoding)encoding{
    NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    NSScanner* scanner = [[NSScanner alloc] initWithString:self];
    
    while (![scanner isAtEnd]) {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 1 || kvPair.count == 2) {
            NSString* key = [kvPair[0] stringByReplacingPercentEscapesUsingEncoding:encoding];
            
            NSMutableArray* values = pairs[key];
            if (nil == values) {
                values = [NSMutableArray array];
                pairs[key] = values;
            }
            
            if (kvPair.count == 1) {
                [values addObject:[NSNull null]];
                
            } else if (kvPair.count == 2) {
                NSString* value = [kvPair[1] stringByReplacingPercentEscapesUsingEncoding:encoding];
                [values addObject:value];
            }
        }
    }
    return [pairs copy];
}

- (NSString *)stringByAddingPercentEscapesForURLParameterString:(NSString *)parameter{
    CFStringRef buffer = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                 (__bridge CFStringRef)parameter,
                                                                 NULL,
                                                                 (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                 kCFStringEncodingUTF8);
    
    NSString* result = [NSString stringWithString:(__bridge NSString *)buffer];
    CFRelease(buffer);
    return result;
}

- (NSString *)stringByAddingQueryDictionary:(NSDictionary *)query{
    NSMutableArray* pairs = [NSMutableArray array];
    for (NSString* key in [query keyEnumerator]) {
        NSString* value = [self stringByAddingPercentEscapesForURLParameterString:[query objectForKey:key]];
        NSString* pair = [NSString stringWithFormat:@"%@=%@", key, value];
        [pairs addObject:pair];
    }
    
    NSString* params = [pairs componentsJoinedByString:@"&"];
    if ([self rangeOfString:@"?"].location == NSNotFound) {
        return [self stringByAppendingFormat:@"?%@", params];
        
    } else {
        return [self stringByAppendingFormat:@"&%@", params];
    }
}


@end
