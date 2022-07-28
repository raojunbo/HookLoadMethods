//
//  DynamicFramework.m
//  DynamicFramework
//
//  Created by tripleCC on 5/23/19.
//  Copyright © 2019 tripleCC. All rights reserved.
//

#import "DynamicFramework.h"

@implementation DynamicFramework
__attribute__((constructor)) static void testDynamic_Initializer(void) {
    NSLog(@"DynamicFramework的");
    sleep(2);
}
+ (void)load {
//    NSLog(@"DynamicFramework");
}
@end


@implementation DynamicFramework(sleep_1_s)
+ (void)load {
    sleep(1);
}
@end
