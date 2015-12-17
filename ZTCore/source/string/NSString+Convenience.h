//
//  NSString+Convenience.h
//  FingerBiscuit
//
//  Created by 马成林 on 15/8/18.
//  Copyright (c) 2015年 FingerBiscuit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Convenience)
- (NSInteger)hexValue;//16进制
- (NSString *)md5;
- (NSString*)trim;//去掉空格
@end
