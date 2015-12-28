//
//  ZTQueue.m
//  Pods
//
//  Created by 马成林 on 15/12/28.
//
//
#define ZT_DEFAULT_QUEUE_LABEL @"zt_default_queue_label"

#import "ZTQueue.h"
#import "ZTHandyMutableArray.h"
@interface ZTQueue ()

@property (nonatomic, strong) dispatch_queue_t queue;

@property (nonatomic, strong) dispatch_group_t group;

@property (nonatomic, strong) NSMutableArray *optArr;

@property (nonatomic, strong) NSMutableArray *blockArr;

@end

@implementation ZTQueue

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queueProcess = NULL;
        self.queueTag = ZT_DEFAULT_QUEUE_LABEL;
    }
    return self;
}

- (instancetype)initWithQueueTag:(NSString *)tag attr:(dispatch_queue_attr_t)attr
{
    self = [super init];
    if (self) {
        self.queueProcess = attr;
        self.queueTag = tag;
    }
    return self;
}

- (dispatch_queue_t)queue{
    if (!_queue) {
        _queue = dispatch_queue_create(self.queueTag.UTF8String, self.queueProcess);
    }
    return _queue;
}

- (dispatch_group_t)group{
    if (!_group) {
        _group = dispatch_group_create();
    }
    return _group;
}

- (void)addBlockOperation:(void(^)())block{
    if (!_blockArr) {
        _blockArr = [[NSMutableArray alloc] init];
    }
    [_blockArr addObject:block];
}

- (void)addOperation:(SEL)sel{
    if (!_optArr) {
        _optArr = [[NSMutableArray alloc] init];
    }
    NSString *selString = NSStringFromSelector(sel);
    if (selString) {
        [_optArr addObject:selString];
    }
}

- (void)queueStart{
    if (!self.target) {
        return;
    }
    if (_optArr&&_optArr.count>0) {
        [self startSels];
    }
    
    if (_blockArr&&_blockArr.count>0) {
        [self startBlocks];
    }
}

- (void)startBlocks{
    __weak typeof(self) instance = self;
    for (void(^block)() in self.blockArr) {
        void(^finalBlock)() = ^{
            if (block) {
                dispatch_group_enter(instance.group);
                block();
                dispatch_group_leave(instance.group);
            }
        };
        dispatch_group_async(self.group, self.queue, finalBlock);
    }
}

- (void)startSels{
    __weak typeof(self) instance = self;
    for (NSString *selString in _optArr) {
        NSLog(@"%@ started",selString);
        dispatch_group_async(self.group, self.queue, ^{
            SEL sel = @selector(selString);
            if (sel&&[instance.target respondsToSelector:sel]) {
                dispatch_group_enter(instance.group);
                [instance.target performSelector:sel withObject:nil];
                dispatch_group_leave(instance.group);
            }
        });
    }
    dispatch_group_wait(self.group, DISPATCH_TIME_FOREVER);
}

@end
