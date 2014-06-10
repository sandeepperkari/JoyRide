//
//  joyRideSearchController.h
//  Joyride
//
//  Created by sandeep perkari on 5/16/14.
//
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "detailsViewController.h"
#import "TestDataCollection.h"
#import "LocationViewController.h"
#import "addRideViewController.h"
#import "addSearchViewController.h"
#import "CreateGroupViewController.h"
@interface joyRideSearchController : UITableViewController<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate,addSearchViewControllerDelegate,addRideViewControllerDelegate,MYCLControllerDelegate,createGroupDelegate>

@property(nonatomic,strong) NSMutableArray *ridesRefinedArray;
@property IBOutlet UISearchBar *ridesSearchBar;
@property(nonatomic,strong) NSArray *ridesArray;
@property(nonatomic,strong)NSMutableArray *selectedRidesForGroupArray;
@property(nonatomic,strong) IBOutlet UIBarButtonItem *doneBarButtonItem;
@property(nonatomic,strong) IBOutlet UIBarButtonItem *searchBarButtonItem;
@property(nonatomic,strong) IBOutlet UIBarButtonItem *cancelBarButtonItem;
@property(nonatomic,strong) IBOutlet UIBarButtonItem *groupBarButtonItem;
@property(nonatomic,assign)BOOL *isRowsSelected;


//-(IBAction)groupBarButtonClicked:(id)sender;
-(IBAction)searchBarButtonClicked:(id)sender;
-(IBAction)cancelBarButtonClicked:(id)sender;
-(IBAction)doneBarButtonClicked:(id)sender;
-(IBAction)enterEditMode:(id)sender;



-(void)locationUpdates:(NSString *)address;
-(void)locationError:(NSString *)error;


@end
