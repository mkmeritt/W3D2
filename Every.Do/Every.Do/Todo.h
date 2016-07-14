//
//  Todo.h
//  Every.Do
//
//  Created by Mark Meritt on 2016-07-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *todoDesc;
@property (nonatomic, assign) int priorityNum;
@property (nonatomic, assign) BOOL isCompleted;

-(instancetype)init:(NSString*)title desc:(NSString*)desc num:(int)num;

@end
