//
//  PrimeNumberProvider.h
//  PrimeNumber
//
//  Created by Maxvale on 24.06.15.
//  Copyright (c) 2015 e.g. Arya Stark. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PrimeNumberProvider;
@protocol PrimeNumberProviderDelegate<NSObject>
@required
- (void) primeNumberProvider: (PrimeNumberProvider*) provider didGenerateArray: (NSArray*) generatedArray;
@end

@interface PrimeNumberProvider : NSObject

@property (nonatomic, assign) id <PrimeNumberProviderDelegate> delegate;

- (instancetype) initWithDelegate: (id) delegate;
- (void) startGeneratingNumbersLessThen: (NSInteger) limit;
@end
