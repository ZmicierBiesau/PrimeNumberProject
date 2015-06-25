//
//  GeneratedData.h
//  PrimeNumber
//
//  Created by Maxvale on 24.06.15.
//  Copyright (c) 2015 e.g. Arya Stark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeneratedData : NSObject

@property (nonatomic, readonly, copy) NSNumber *maxValue;

+ (instancetype) sharedGeneratedData;
- (void) addGeneratedResults: (NSArray*) array;
@end
