//
//  main.m
//  HookLoadMethods
//
//  Created by tripleCC on 5/21/19.
//  Copyright © 2019 tripleCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "A4BBLoadMeasure.h"
int main(int argc, char * argv[]) {
    printf("finish pre-main");
    [A4BBLoadMeasure makeDidFinishStartTime];
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
