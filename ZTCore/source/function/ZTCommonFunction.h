//
//  ZTCommonFunction.h
//  ZTCoreDemo
//
//  Created by mapengzhen on 16/9/10.
//  Copyright © 2016年 Biscuit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <UIKit/UIApplication.h>


#if defined __cplusplus
extern "C" {
#endif

    
//判断是否空数组
BOOL isNotEmptyArray(NSArray *arr);

//判断是否空字典
BOOL isNotEmptyDictionary(NSDictionary *dict);

//判断是否空字符串
BOOL isNotEmptyString(NSString *str);

//添加监听
void ZTAddObserver(id observer, SEL selector, NSString *notifyName, id object);

//发送通知
void ZTNotify(NSString *notifyName, id object, NSDictionary *aUserInfo);

//去除监听者
void ZTRemoveObserver(id observer);

//为监听者去除指定监听
void ZTRemoveNotifyForObserver(id observer, NSString *notifyName);

//判断设备是否iPad
BOOL ZTIsPad(void);

//判断是否iPhone
BOOL ZTIsPhone(void);

CGFloat ZTScreenScale(void);

BOOL ZTIsRetina(void);

//状态栏高度
CGFloat ZTStatusBarHeight(void);
    
//Toolbar高度
CGFloat ZTToolbarHeightForOrientation(UIInterfaceOrientation orientation);
    
//设备系统版本号
BOOL ZTDeviceOSVersionIsAtLeast(double versionNumber);

#pragma mark- path
//bundle resource path
//bundle : If nil, [NSBundle mainBundle] will be used
NSString* ZTPathForBundleResource(NSBundle* bundle, NSString* relativePath);
    
NSString* ZTPathForDocumentsResource(NSString* relativePath);
NSString* ZTPathForLibraryResource(NSString* relativePath);
NSString* ZTPathForCachesResource(NSString* relativePath);

    
void ZTSwapInstanceMethods(Class cls, SEL originalSel, SEL newSel);
void ZTSwapClassMethods(Class cls, SEL originalSel, SEL newSel);
    
#if defined __cplusplus
};
#endif