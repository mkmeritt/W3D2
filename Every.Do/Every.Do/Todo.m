//
//  Todo.m
//  Every.Do
//
//  Created by Mark Meritt on 2016-07-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)init:(NSString *)title desc:(NSString *)desc num:(int)num{
    
    if(self = [super init]){
        _title = title;
        _todoDesc = desc;
        _priorityNum = num;
        _isCompleted = NO;
    }
    
    return self;
    
}



@end
