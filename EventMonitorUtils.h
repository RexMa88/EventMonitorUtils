//
//  EventMonitorUtils.h
//  RexCloud
//
//  Created by Rex Ma on 15/5/17.
//  Copyright (c) 2015年 clove. All rights reserved.
//

#import <Foundation/Foundation.h>

//上传图片
static NSString *uploadPictureEvent = @"uploadPictureEvent";

@protocol EventMonitorProtocol <NSObject>

- (void)eventRecieved:(NSString *)eventName;

@end

@interface EventMonitorUtils : NSObject

+ (EventMonitorUtils *)shareInstance;
/**
 *  注册监听事件
 */
- (void)registerEvent:(NSString *)eventName monitor:(id<EventMonitorProtocol>)viewController;
/**
 *  注销监听事件
 */
- (void)unRegisterEvent:(NSString *)eventName monitor:(id<EventMonitorProtocol>)viewController;
/**
 *  发送监听
 */
- (void)sendEvent:(NSString *)eventName;

@end
