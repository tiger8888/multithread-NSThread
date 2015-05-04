//
//  main.m
//  multithread-NSThread
//
//  Created by sbx_fc on 15-5-4.
//  Copyright (c) 2015年 RG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindMinMaxThread.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        const NSInteger count = 100000;
        NSMutableArray* inputValues = [[NSMutableArray alloc] initWithCapacity:count];
        
        for (NSInteger i = 0; i < count; ++i) {
            [inputValues addObject:@(arc4random())];
        }
        
        NSMutableSet *threads = [NSMutableSet set];
        NSUInteger numberCount = inputValues.count;
        NSUInteger threadCount = 4;
        for (NSUInteger i = 0; i < threadCount; i++) {
            NSUInteger offset = (count / threadCount) * i;
            NSUInteger count = MIN(numberCount - offset, numberCount / threadCount);
            NSRange range = NSMakeRange(offset, count);
            NSArray *subset = [inputValues subarrayWithRange:range];
            FindMinMaxThread *thread = [[FindMinMaxThread alloc] initWithNumbers:subset];
            [threads addObject:thread];
            [thread start];
        }
        
        NSUInteger min = UINT32_MAX;
        NSUInteger max = 0;
        for (FindMinMaxThread *thread in threads) {
            min = MIN(min, thread.min);
            max = MAX(max, thread.max);
        }
        
        NSLog(@"min = %ld", min);
        NSLog(@"max = %ld", max);
        
    }
    return 0;
}
