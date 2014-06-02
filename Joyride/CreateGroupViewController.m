//
//  CreateGroupViewController.m
//  Joyride
//
//  Created by sandeep perkari on 6/1/14.
//
//

#import "CreateGroupViewController.h"

@interface CreateGroupViewController ()

@end

@implementation CreateGroupViewController
@synthesize delegate;


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(IBAction)Cancel:(id)sender
{
    [self.delegate createdGroupViewControllerDidCancel:self ];

}
-(IBAction)Done:(id)sender
{
    [self.delegate createdGroupViewControllerDidCreate:self ];

}
@end