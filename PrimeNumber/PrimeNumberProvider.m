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
    NSMutableArray *array = [NSMutableArray new];
    for (NSInteger i = 2; i <= limit; i++) {
        if ([self checkIfNumberPrime:i]) {
            [array addObject:[NSNumber numberWithInteger:i]];
        }
    }
    NSLog(@"%@", array);
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
