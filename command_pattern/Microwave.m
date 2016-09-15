//
//  Microwave.m
//  command_pattern
//
//  Created by Dmitriy Arkhipov on 10.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "Microwave.h"



@implementation Microwave

- (void) startCookingWithTime:(int)time {

    NSLog(@"Microwave: Подогреваем еду, таймер установлен на %i мин", time);

}

- (void) stopCooking {
    
    NSLog(@"Microwave: Еда подогрета");
}

@end


@implementation MicrowaveCommand

- (instancetype) initWithMicrowave:(Microwave *)m AndTime:(int)time {


    self = [super init];
    
    if (self) {
        
        _microwave = m;
        _time = time;
    
    }
    return self;
}

- (void) execute {
    
    [_microwave startCookingWithTime:10];

}

- (void) undo {

    [_microwave stopCooking];
}

@end