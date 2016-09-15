//
//  Microwave.h
//  command_pattern
//
//  Created by Dmitriy Arkhipov on 10.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "CommandPattern.h"

#import <Foundation/Foundation.h>

/**
 Объект микроволновки. Демонстрационный объект для паттерна команды.
 */
@interface Microwave : NSObject

- (void) startCookingWithTime:(int)time;
- (void) stopCooking;

@end


@interface MicrowaveCommand : NSObject <ICommand>

@property (strong, nonatomic) Microwave *microwave;
@property (assign, nonatomic) int time;

- (instancetype) initWithMicrowave:(Microwave *)m AndTime:(int)time;
- (void) execute;
- (void) undo;

@end