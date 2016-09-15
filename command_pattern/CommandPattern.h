//
//  CommandPattern.h
//  command_pattern
//
//  Created by Dmitriy Arkhipov on 09.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICommand <NSObject>

- (void) execute;
- (void) undo;

@end



/**
 Receiver - Получатель
 */
@interface AppleTV : NSObject

- (void) on;
- (void) off;

@end




@interface MyTVOnCommand : NSObject <ICommand>

@property (strong, nonatomic) AppleTV *tv;

- (instancetype) initWithTV:(AppleTV *)tvSet;

- (void) execute;
- (void) undo;

@end

/**
 Invoker - инициатор
 */
@interface SiriRemote : NSObject

@property (weak, nonatomic) id<ICommand> command;


- (void) setCommand:(id<ICommand>)myCommand;

- (void) pressButton;

- (void) pressUndoButton;

@end
