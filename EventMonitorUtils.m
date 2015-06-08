//
//  EventMonitorUtils.m
//  RexCloud
//
//  Created by Rex Ma on 15/5/17.
//  Copyright (c) 2015年 clove. All rights reserved.
//

#import "EventMonitorUtils.h"

@interface EventMonitorUtils ()

@property (nonatomic, strong) NSMutableDictionary *eventMonitorDic;

@end

@implementation EventMonitorUtils

+ (EventMonitorUtils *)shareInstance{
    static EventMonitorUtils *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[EventMonitorUtils alloc] init];
    });
    return instance;
}

- (id)init{
    if (self = [super init]) {
        self.eventMonitorDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)registerEvent:(NSString *)eventName monitor:(id<EventMonitorProtocol>)viewController{
    NSMutableArray *monitorArray = [NSMutableArray arrayWithArray:[self.eventMonitorDic objectForKey:eventName]];
    [monitorArray addObject:viewController];
    
    [self.eventMonitorDic setObject:monitorArray forKey:eventName];
}

- (void)unRegisterEvent:(NSString *)eventName monitor:(id<EventMonitorProtocol>)viewController{
    NSMutableArray *monitorArray = [NSMutableArray arrayWithArray:[self.eventMonitorDic objectForKey:eventName]];
    [monitorArray removeObject:viewController];
    
    [self.eventMonitorDic setObject:monitorArray forKey:eventName];
}

- (void)sendEvent:(NSString *)eventName{
    NSArray *monitorArray = [self.eventMonitorDic objectForKey:eventName];
    for (id<EventMonitorProtocol> monitor in monitorArray) {
        [monitor eventRecieved:eventName];
    }
}

@end
