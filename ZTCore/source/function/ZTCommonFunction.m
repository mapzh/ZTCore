//
//  ZTCommonFunction.m
//  ZTCoreDemo
//
//  Created by mapengzhen on 16/9/10.
//  Copyright © 2016年 Biscuit. All rights reserved.
//

#import "ZTCommonFunction.h"

BOOL isNotEmptyArray(NSArray *arr){
    return (arr&&[arr isKindOfClass:[NSArray class]]&&arr.count>0);
}

BOOL isNotEmptyDictionary(NSDictionary *dict){
    return (dict&&[dict isKindOfClass:[NSDictionary class]]&&dict.count>0);
}

BOOL isNotEmptyString(NSString *str){
    return (str&&[str isKindOfClass:[NSString class]]&&str.length>0);
}

void ZTAddObserver(id observer, SEL selector, NSString *notifyName, id object){
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:notifyName object:object];
}

void ZTNotify(NSString *notifyName, id object, NSDictionary *aUserInfo){
    [[NSNotificationCenter defaultCenter] postNotificationName:notifyName object:object userInfo:aUserInfo];
}

void ZTRemoveObserver(id observer){
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

void ZTRemoveNotifyForObserver(id observer, NSString *notifyName){
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:notifyName object:nil];
}

BOOL ZTIsPad(void) {
    static NSInteger isPad = -1;
    if (isPad < 0) {
        isPad = ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) ? 1 : 0;
    }
    return isPad > 0;
}

BOOL ZTIsPhone(void) {
    static NSInteger isPhone = -1;
    if (isPhone < 0) {
        isPhone = ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? 1 : 0;
    }
    return isPhone > 0;
}

BOOL ZTDeviceOSVersionIsAtLeast(double versionNumber) {
    return kCFCoreFoundationVersionNumber >= versionNumber;
}

CGFloat ZTScreenScale(void) {
    return [[UIScreen mainScreen] scale];
}

BOOL ZTIsRetina(void) {
    return ZTScreenScale() > 1.f;
}

CGFloat ZTStatusBarHeight(void) {
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat statusBarHeight = MIN(statusBarFrame.size.width, statusBarFrame.size.height);
    
    return statusBarHeight;
}

CGFloat ZTToolbarHeightForOrientation(UIInterfaceOrientation orientation) {
    return (ZTIsPad()
            ? 44
            : (UIInterfaceOrientationIsPortrait(orientation)
               ? 44
               : 33));
}


NSString* ZTPathForBundleResource(NSBundle* bundle, NSString* relativePath) {
    NSString* resourcePath = [(nil == bundle ? [NSBundle mainBundle] : bundle) resourcePath];
    return [resourcePath stringByAppendingPathComponent:relativePath];
}

NSString* ZTPathForDocumentsResource(NSString* relativePath) {
    static NSString* documentsPath = nil;
    if (nil == documentsPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                            NSUserDomainMask,
                                                            YES);
        documentsPath = [dirs objectAtIndex:0];
    }
    return [documentsPath stringByAppendingPathComponent:relativePath];
}

NSString* ZTPathForLibraryResource(NSString* relativePath) {
    static NSString* libraryPath = nil;
    if (nil == libraryPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
                                                            NSUserDomainMask,
                                                            YES);
        libraryPath = [dirs objectAtIndex:0];
    }
    return [libraryPath stringByAppendingPathComponent:relativePath];
}

NSString* ZTPathForCachesResource(NSString* relativePath) {
    static NSString* cachesPath = nil;
    if (nil == cachesPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                            NSUserDomainMask,
                                                            YES);
        cachesPath = [dirs objectAtIndex:0];
    }
    return [cachesPath stringByAppendingPathComponent:relativePath];
}

void ZTSwapInstanceMethods(Class cls, SEL originalSel, SEL newSel) {
    Method originalMethod = class_getInstanceMethod(cls, originalSel);
    Method newMethod = class_getInstanceMethod(cls, newSel);
    method_exchangeImplementations(originalMethod, newMethod);
}

void ZTSwapClassMethods(Class cls, SEL originalSel, SEL newSel) {
    Method originalMethod = class_getClassMethod(cls, originalSel);
    Method newMethod = class_getClassMethod(cls, newSel);
    method_exchangeImplementations(originalMethod, newMethod);
}