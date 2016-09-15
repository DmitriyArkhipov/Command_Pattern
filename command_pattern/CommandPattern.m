//
//  CommandPattern.m
//  command_pattern
//
//  Created by Dmitriy Arkhipov on 09.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "CommandPattern.h"


#pragma mark - Получатель команд

//
//@implementation ICommand
//
//- (void) execute {[self doesNotRecognizeSelector:_cmd];}
//- (void) undo {[self doesNotRecognizeSelector:_cmd];}
//
//@end




@implementation AppleTV

- (void) on {

    NSLog(@"AppleTV: телевизор включен");
}

- (void) off {

    NSLog(@"AppleTV: телевизор выключен");
}

@end

@implementation MyTVOnCommand

- (instancetype) initWithTV:(AppleTV *)tvSet {
    
    self = [super init];

    if (self)
    {
        _tv = tvSet;
    }
    
    return self;
    
}

- (void) execute {
    
    [_tv on];

}


- (void) undo {

    [_tv off];
}

@end


#pragma mark - Инициатор

@implementation SiriRemote


- (void) setCommand:(id<ICommand>)myCommand {
    
    _command = myCommand;

}

- (void) pressButton {
    
    if (!_command) {
        return;
    }

    [_command execute];

}

- (void) pressUndoButton {
    
    if (!_command) {
        return;
    }
    
    [_command undo];

}

@end