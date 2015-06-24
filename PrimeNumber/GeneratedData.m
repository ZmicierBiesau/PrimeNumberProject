//
//  GeneratedData.m
//  PrimeNumber
//
//  Created by Maxvale on 24.06.15.
//  Copyright (c) 2015 e.g. Arya Stark. All rights reserved.
//

#import "GeneratedData.h"

@interface GeneratedData()

@property (assign, nonatomic) NSInteger maxValue;
@property (strong, nonatomic) NSMutableArray *arrayOfNumbers;
@end

@implementation GeneratedData


- (instancetype) sharedGeneratedData
{
    static GeneratedData *data = nil;
    static dispatch_once_t p;
    dispatch_once(&p, ^{
        data = [GeneratedData new];
    });
    return data;
}
@end
