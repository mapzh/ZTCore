//
//  ZTQueue.h
//  Pods
//
//  Created by 马成林 on 15/12/28.
//
//

#import <Foundation/Foundation.h>

@interface ZTQueue : NSObject

/**
 *  queue的标识符
 */
@property (nonatomic, copy) NSString *queueTag;

/**
 *  指定queue是串行还是并行操作,可取DISPATCH_QUEUE_SERIAL或DISPATCH_QUEUE_CONCURRENT
 */
@property (nonatomic, assign) dispatch_queue_attr_t queueProcess;


/**
 *  需要执行队列操作的对象
 */
@property (nonatomic, assign) id target;


- (void)queueStart;

- (void)addOperation:(SEL)sel;

- (void)addBlockOperation:(void(^)())block;
@end
