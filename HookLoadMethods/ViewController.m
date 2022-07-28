//
//  ViewController.m
//  HookLoadMethods
//
//  Created by tripleCC on 5/21/19.
//  Copyright © 2019 tripleCC. All rights reserved.
//
#import "ViewController.h"
#import <objc/runtime.h>
#import <DynamicFramework/DynamicFramework.h>
#import "A4BBLoadMeasure/A4BBLoadMeasure.h"
@interface A : NSObject
@end
@implementation A
+ (void)load {
    usleep(100);
}

@end
@implementation A (sleep_100_ms)
+ (void)load {
    usleep(1000 * 100);
}
@end

@implementation A (copy_class_list)
+ (void)load {
    objc_copyClassList(nil);
}
@end

@interface B : NSObject
@end
@implementation B
@end
@implementation B (sleep_1_s)
+ (void)load {
    sleep(1);
}
@end


@interface ViewController ()

@end
@implementation ViewController (sleep_1_ms)
+ (void)load {
    usleep(1000);
}
@end
@implementation ViewController (sleep_50_ms)
+ (void)load {
    usleep(1000 * 50);
}
@end
@implementation ViewController
+ (void)load {
    NSLog(@"ViewController");
}
__attribute__((constructor)) static void vcMeasure_Initializer(void) {
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"这是progressStartTime:%@ms", @([A4BBLoadMeasure processStartTime]));
    NSLog(@"这是fistLoadTime:%@ms", @([A4BBLoadMeasure firstLoadStartTime]));
    NSLog(@"这是exec-load:%@ms", @([A4BBLoadMeasure firstLoadStartTime] - [A4BBLoadMeasure processStartTime]));
    NSLog(@"这是load-main:%@ms", @([A4BBLoadMeasure didFinishStartTime] - [A4BBLoadMeasure firstLoadStartTime]));
    NSLog(@"这是pre-main:%@ms", @([A4BBLoadMeasure didFinishStartTime] - [A4BBLoadMeasure processStartTime]));
}

@end

//@implementation UIViewController (s_1_)
//+ (void)load {
//    sleep(1);
//    NSLog(@"s_1_");
//}
//@end
//
//@implementation DynamicFramework (s_2_)
//+ (void)load {
//    sleep(2);
//    NSLog(@"Main UIViewController load");
//}
//@end
