//
//  ViewController.m
//  command_pattern
//
//  Created by Dmitriy Arkhipov on 09.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "ViewController.h"

#import "CommandPattern.h"
#import "Microwave.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    SiriRemote *siriRemote = [[SiriRemote alloc] init];
    
    AppleTV *tv = [[AppleTV alloc] init];
    
    MyTVOnCommand *tvCommand = [[MyTVOnCommand alloc] initWithTV:tv];
    
    [siriRemote setCommand:tvCommand];

    [siriRemote pressButton];
    [siriRemote pressUndoButton];
    
    //использование пульта для микроволновки
    
    Microwave *microwave = [[Microwave alloc] init];
    
    MicrowaveCommand *microwaveCommand = [[MicrowaveCommand alloc] initWithMicrowave:microwave AndTime:10];
    
    [siriRemote setCommand:microwaveCommand];
    
    [siriRemote pressButton];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
