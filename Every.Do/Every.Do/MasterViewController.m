//
//  MasterViewController.m
//  Every.Do
//
//  Created by Mark Meritt on 2016-07-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AddToDoViewController.h"

@interface MasterViewController ()<AddToDoViewControllerDelegate>

@property NSMutableArray *objects;


@end

@implementation MasterViewController

Todo *item1;
Todo *item2;
Todo *item3;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    item1 = [[Todo alloc] init:@"Clean Room" desc:@"Upstairs" num:2];
    item2 = [[Todo alloc] init:@"Fix Car" desc:@"Bring to Mechanic" num:3];
    item3 = [[Todo alloc] init:@"Gardening" desc:@"Water Grass" num:6];
    
    self.objects = [@[item1, item2, item3] mutableCopy];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

// control drag from the add button to the detailViewController to create the segue

// get rid of the old connection


//- (void)insertNewObject:(id)sender {
//    if (!self.objects) {
//        self.objects = [[NSMutableArray alloc] init];
//    }
//    
////    [self.objects insertObject:[Todo date] atIndex:0];
////    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
////    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    }
    if ([segue.identifier isEqualToString:@"AddToDoViewController"]) {
        AddToDoViewController *addTodoVC = segue.destinationViewController;
        addTodoVC.delegate = self;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];

    Todo *object = self.objects[indexPath.row];
    cell.titleLbl.text = object.title;
    cell.descLbl.text = object.todoDesc;
    cell.priorityLbl.text = [NSString stringWithFormat:@"%d" ,object.priorityNum];
    return cell;
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
    }
}



- (void)addTodoViewController:(AddToDoViewController *)addViewcontroller dismissWithToDo:(Todo *)todo {
    [self dismissViewControllerAnimated:addViewcontroller completion:nil];
    [self.objects addObject:todo];
    [self.tableView reloadData];
}

@end
