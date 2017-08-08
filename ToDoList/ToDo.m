//
//  ToDo.m
//  ToDoList
//
//  Created by Hirad on 2017-08-08.
//  Copyright © 2017 Hirad. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithTitle: (NSString*) title andDescription: (NSString*) description andPriorityNumber: (int) priorityNumber;
{
    self = [super init];
    if (self) {
        _todoTitle = title;
        _todoDesc = description;
        _priorityNumber = priorityNumber;
    }
    return self;
}






@end
