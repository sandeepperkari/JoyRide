//
//  joyRideSearchController.h
//  Joyride
//
//  Created by sandeep perkari on 5/16/14.
//
//

#import <UIKit/UIKit.h>
#import "detailsViewController.h"
#import "TestDataCollection.h"
#import "LocationViewController.h"
#import "addRideViewController.h"
@interface joyRideSearchController : UITableViewController<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate,addRideViewControllerDelegate>

@property(nonatomic,strong) NSMutableArray *ridesRefinedArray;
@property IBOutlet UISearchBar *ridesSearchBar;
@property(nonatomic,strong) NSArray *ridesArray;
-(IBAction)enterEditMode:(id)sender;

/*
@property (nonatomic,strong)IBOutlet UIBarButtonItem *groupBarButton;
@property(nonatomic,strong) UIBarButtonItem *groupBarButtonSelectItems;
@property(nonatomic,strong) UIBarButtonItem *cancelBarButton;
*/

@end
