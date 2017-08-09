//
//  SecondViewController.m
//  ToDoList
//
//  Created by Hirad on 2017-08-08.
//  Copyright © 2017 Hirad. All rights reserved.
//

#import "SecondViewController.h"

@class MasterViewController;

@interface SecondViewController () 

@property (weak, nonatomic) IBOutlet UITextField *TaskNameTextEntry;
@property (weak, nonatomic) IBOutlet UITextField *taskDescTextEntry;
@property (nonatomic) NSString *taskName;
@property (nonatomic) NSString *taskDescrip;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)dissMissViewController:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dissmissed");
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField.tag == 1) {
        
        [self.TaskNameTextEntry resignFirstResponder];
    
        self.taskName = textField.text;
        
    } else {
        
        [self.taskDescTextEntry resignFirstResponder];
        
        self.taskDescrip = textField.text;

    }
    return YES;
    
}

- (IBAction)createButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
    
        [self setTaskLabels];
        [self didSaveNewTodo: self.Todo];
        
        // - (void)didSaveNewTodo:(NSString *)todoText{
    }];

}



- (ToDo*) setTaskLabels{
    
    self.Todo = [ToDo new];
    
    if ([self.taskName length] != 0 )  {
        
        self.Todo.todoTitle = self.taskName;
        self.Todo.todoDesc = self.taskDescrip;
        self.Todo.priorityNumber = 1;
        NSLog(@"new taks name is %@", self.Todo.todoTitle);
        }
    
    return self.Todo;
}

#pragma Delegate setup

- (void) didSaveNewTodo:(ToDo *)todoText {
    
    
}


@end
