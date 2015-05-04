//
//  FindMinMaxThread.h
//  multithread-NSThread
//
//  Created by sbx_fc on 15-5-4.
//  Copyright (c) 2015年 RG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FindMinMaxThread : NSThread
@property (nonatomic) NSUInteger min;
@property (nonatomic) NSUInteger max;

- (instancetype)initWithNumbers:(NSArray *)numbers;

@end
