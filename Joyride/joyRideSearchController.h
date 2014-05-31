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
@interface joyRideSearchController : UITableViewController<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate,addSearchViewControllerDelegate,addRideViewControllerDelegate,MYCLControllerDelegate>

@property(nonatomic,strong) NSMutableArray *ridesRefinedArray;
@property IBOutlet UISearchBar *ridesSearchBar;
@property(nonatomic,strong) NSArray *ridesArray;

-(IBAction)enterEditMode:(id)sender;
-(IBAction)cancelButton:(id)sender;
-(void)locationUpdates:(NSString *)address;
-(void)locationError:(NSString *)error;


@end
