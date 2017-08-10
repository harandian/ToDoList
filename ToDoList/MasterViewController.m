//
//  MasterViewController.m
//  ToDoList
//
//  Created by Hirad on 2017-08-08.
//  Copyright © 2017 Hirad. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "MyUITableCell.h"
#import "SecondViewController.h"


@interface MasterViewController () <AddItemViewControllerDelegate>

@property NSMutableArray *objects;
@property NSMutableArray *toDoObjects;
@property  UITableViewCell *swipedCell;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    [self todoArrayGeneration];
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(rightSwipe:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.tableView addGestureRecognizer:recognizer];
    
    
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    if (!self.toDoObjects) {
        self.toDoObjects = [[NSMutableArray alloc] init];
    }
    
    SecondViewController *sVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController "];
    sVC.delegate = self;
    
    [sVC setModalInPopover:YES];
    [self presentViewController:sVC animated:YES completion:nil];
    
    //    ToDo *newTask = [ToDo new];
    //
    //    newTask = sVC.delegate;
    //
    //
    //     [self.toDoObjects insertObject:newTask atIndex:0];
    //
    //    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //
    //     [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    //
    
    
    
}

- (void)didSaveNewTodo:(ToDo *)todoText{
    [self.toDoObjects addObject:todoText];
    [self.tableView reloadData];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.toDoObjects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object.todoDesc];
    }
}




#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDoObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyUITableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    ToDo *object = self.toDoObjects[indexPath.row];
    cell.taskNameLabel.text = [object todoTitle];
    cell.taskPriorityNumberLabel.text = [NSString stringWithFormat:@"%i",[object priorityNumber]];
    
    
    if (cell.isStricken == YES) {
        
        
        NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:((ToDo*)self.toDoObjects[indexPath.row]).todoTitle];
        [titleString addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, [titleString length])];
        cell.textLabel.attributedText = titleString;
    }
    
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        ToDo *newTask = [[ToDo alloc] initWithTitle:@"task" andDescription:@"task" andPriorityNumber:5];
        
        [self.toDoObjects addObject:newTask];
        
        [self.tableView reloadData];
        
        
    }
    
}



#pragma mark - Todo List Creation

- (void) todoArrayGeneration {
    
    ToDo *task1 = [[ToDo alloc] initWithTitle:@"Task1" andDescription:@"Do thing 1" andPriorityNumber:1];
    ToDo *task2 = [[ToDo alloc] initWithTitle:@"Task2" andDescription:@"Do thing 2" andPriorityNumber:2];
    ToDo *task3 = [[ToDo alloc] initWithTitle:@"Task3" andDescription:@"Do thing 3" andPriorityNumber:3];
    ToDo *task4 = [[ToDo alloc] initWithTitle:@"Task4" andDescription:@"Do thing 4" andPriorityNumber:4];
    ToDo *task5 = [[ToDo alloc] initWithTitle:@"Task5" andDescription:@"Do thing 5" andPriorityNumber:5];
    
    self.toDoObjects = [[NSMutableArray alloc] initWithObjects:task1,task2,task3, task4, task5, nil];
    
    
}


- (void)rightSwipe:(UISwipeGestureRecognizer *)gestureRecognizer
{
    CGPoint location = [gestureRecognizer locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    MyUITableCell *swipedCell = [self.tableView cellForRowAtIndexPath:indexPath];


    swipedCell.isStricken = YES;
    
    [self.tableView reloadData];
    //show some menu in the cell position( its cell.frame)
}



@end
