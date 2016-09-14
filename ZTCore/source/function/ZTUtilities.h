//
//  ZTUtilities.h
//  Pods
//
//  Created by mapengzhen on 16/9/14.
//
//
#import <Foundation/Foundation.h>

#if defined(DEBUG)
#define ZTDPRINT(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define ZTDPRINT(xx, ...)  ((void)0)
#endif

#ifdef DEBUG
#define ZTDCONDITIONLOG(condition, xx, ...) { if ((condition)) { \
ZTDPRINT(xx, ##__VA_ARGS__); \
} \
} ((void)0)
#else
#define ZTDCONDITIONLOG(condition, xx, ...) ((void)0)
#endif
