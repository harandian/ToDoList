//
//  SecondViewController.h
//  ToDoList
//
//  Created by Hirad on 2017-08-08.
//  Copyright © 2017 Hirad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol AddItemViewControllerDelegate <NSObject>

- (void) didSaveNewTodo:(ToDo *)todoText;

@end


@interface SecondViewController : UIViewController <UITextFieldDelegate>


//@property ToDo *Todo;
@property (nonatomic) id <AddItemViewControllerDelegate> delegate; 
@end



