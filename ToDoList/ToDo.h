//
//  ToDo.h
//  ToDoList
//
//  Created by Hirad on 2017-08-08.
//  Copyright © 2017 Hirad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic) BOOL isCompleted;
@property (nonatomic, assign) int priorityNumber;
@property (nonatomic, strong) NSString *todoDesc;
@property (nonatomic, strong) NSString *todoTitle;

//- (NSMutableArray *) todoGeneration;
- (instancetype)initWithTitle: (NSString*) title andDescription: (NSString*) description andPriorityNumber: (int) priorityNumber;

@end
