//
//  GeneratedData.m
//  PrimeNumber
//
//  Created by Maxvale on 24.06.15.
//  Copyright (c) 2015 e.g. Arya Stark. All rights reserved.
//

#import "GeneratedData.h"

@interface GeneratedData()

@property (nonatomic, copy) NSNumber *maxValue;
@property (strong, nonatomic) NSMutableArray *arrayOfNumbers;
@end

@implementation GeneratedData


+ (instancetype) sharedGeneratedData
{
    static GeneratedData *data = nil;
    static dispatch_once_t p;
    dispatch_once(&p, ^{
        data = [GeneratedData new];
    });
    return data;
}

- (void) addGeneratedResults: (NSArray*) array
{
    if (!_maxValue) {
        _maxValue = [NSNumber numberWithInteger:0];
    }
    if (array[[array count] - 1] > _maxValue) {
        _arrayOfNumbers = [array mutableCopy];
        _maxValue = array[[array count] - 1];
    }
    //NSLog(@"%@", _arrayOfNumbers);
}

- (NSMutableArray*) getCachedGeneratedArray
{
    return [_arrayOfNumbers mutableCopy];
}

@end
