//
//  FindMinMaxThread.m
//  multithread-NSThread
//
//  Created by sbx_fc on 15-5-4.
//  Copyright (c) 2015年 RG. All rights reserved.
//

#import "FindMinMaxThread.h"

@implementation FindMinMaxThread{
    NSArray *_numbers;
}

- (instancetype)initWithNumbers:(NSArray *)numbers
{
    self = [super init];
    if (self) {
        _numbers = numbers;
        
        NSInteger min = UINT32_MAX;
        NSInteger max = 0;
        for (NSInteger i = 0; i < numbers.count; ++i) {
            NSNumber* val = [numbers objectAtIndex:i];
            min = MIN(min, val.integerValue);
            max = MAX(max, val.integerValue);
        }

        self.min = min;
        self.max = max;
    }
    return self;
}
@end
