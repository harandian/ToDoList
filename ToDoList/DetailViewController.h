//
//  DetailViewController.h
//  ToDoList
//
//  Created by Hirad on 2017-08-08.
//  Copyright © 2017 Hirad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController  

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

