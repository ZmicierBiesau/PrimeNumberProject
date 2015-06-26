//
//  PrimeNumberProvider.m
//  PrimeNumber
//
//  Created by Maxvale on 24.06.15.
//  Copyright (c) 2015 e.g. Arya Stark. All rights reserved.
//

#import "PrimeNumberProvider.h"
#import "GeneratedData.h"

@implementation PrimeNumberProvider

- (instancetype) initWithDelegate: (id) delegate
{
    self = [super init];
    if (self) {
        _delegate = delegate;
    }
    return self;
}


- (void) startGeneratingNumbersLessThen: (NSInteger) limit
{
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        
        NSInteger startNumber = 2;
        NSMutableArray *array = [[GeneratedData sharedGeneratedData] getCachedGeneratedArray];
        if (!array) {
            array = [NSMutableArray new];
        }
        else
        {
            startNumber = [array[[array count] - 1] integerValue];
        }
        
        if (startNumber >= limit) {
            while ([array[[array count] - 1] integerValue] > limit) {
                [array removeObjectAtIndex:[array count] - 1];
            }
        }
        else
        {
            for (NSInteger i = startNumber; i <= limit; i++) {
                if ([self checkIfNumberPrime:i]) {
                    [array addObject:[NSNumber numberWithInteger:i]];
                }
            }
        }
        [[GeneratedData sharedGeneratedData] addGeneratedResults:array];
        if ([_delegate respondsToSelector:@selector(primeNumberProvider:didGenerateArray:)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_delegate primeNumberProvider:self didGenerateArray:[array copy]];
            });
        }
    });
    //NSLog(@"%@", array);
}



- (BOOL) checkIfNumberPrime: (NSInteger) number
{
    for (NSInteger i = 2; i <= sqrt(number); i++) {
        if (number % i == 0) {
            return NO;
        }
    }
    return YES;
}

@end
