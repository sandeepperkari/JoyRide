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
-(IBAction)enterEditMode:(id)sender;
-(IBAction)cancelButton:(id)sender;
-(void)locationUpdates:(NSString *)address;
-(void)locationError:(NSString *)error;


@end
