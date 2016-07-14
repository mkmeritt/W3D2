//
//  AddToDoViewController.h
//  Every.Do
//
//  Created by Mark Meritt on 2016-07-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddToDoViewController;
@class Todo;

@protocol AddToDoViewControllerDelegate <NSObject>
- (void)addTodoViewController:(AddToDoViewController *)addViewcontroller dismissWithToDo:(Todo *)todo;

@end
@interface AddToDoViewController : UIViewController <UITextViewDelegate>
@property (nonatomic, weak) id<AddToDoViewControllerDelegate>delegate;

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *priorityNum;




@end
