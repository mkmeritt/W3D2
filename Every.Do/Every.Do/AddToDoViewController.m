//
//  AddToDoViewController.m
//  Every.Do
//
//  Created by Mark Meritt on 2016-07-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import "AddToDoViewController.h"
#import "Todo.h"

@interface AddToDoViewController ()

@end

// make outlets to the textFields
// make a save button method

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// [self.delegate detailViewController:self dismissWithToDo:[Todo new]];


- (IBAction)saveTapped:(UIButton *)sender {
    Todo *todo = [[Todo alloc] init:self.firstName.text desc:self.lastName.text num:[self.priorityNum.text intValue]];
    [self.delegate addTodoViewController:self dismissWithToDo:todo];
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [textView resignFirstResponder];
    return true;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

// save button action
//

@end
