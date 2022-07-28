//
//  A4BBLoadMeasure.h
//  A4BBLoadMeasure
//
//  Created by tripleCC on 5/22/19.
//  Copyright © 2019 tripleCC. All rights reserved.
//

#ifndef A4BBLoadMeasure_h
#define A4BBLoadMeasure_h

#import <Foundation/Foundation.h>

@interface LMLoadInfo : NSObject
@property (copy, nonatomic, readonly) NSString *clsname;
@property (copy, nonatomic, readonly) NSString *catname;
@property (assign, nonatomic, readonly) CFAbsoluteTime start;
@property (assign, nonatomic, readonly) CFAbsoluteTime end;
@property (assign, nonatomic, readonly) CFAbsoluteTime duration;
@end

@interface LMLoadInfoWrapper : NSObject
@property (assign, nonatomic, readonly) Class cls;
@property (copy, nonatomic, readonly) NSArray <LMLoadInfo *> *infos;
@end

extern NSArray <LMLoadInfoWrapper *> *LMLoadInfoWappers;


@interface A4BBLoadMeasure : NSObject
// 进程启动的时间戳单位为ms
+ (NSTimeInterval)processStartTime;

// 这里将__attribute__((constructor))的执行当做第一个+load方法的执行。
+ (NSTimeInterval)firstLoadStartTime;

// 需要主动打点
+ (void)makeDidFinishStartTime;
+ (NSTimeInterval)didFinishStartTime;

// 线上+load统计耗时
+ (NSString *)loadTimeLogStr;
@end
#endif /* A4BBLoadMeasure_h */
