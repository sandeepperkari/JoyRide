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

/*
 
 ,CLLocationManagerDelegate
@property(nonatomic,strong)CLLocationManager *loactionManager;
@property(nonatomic,strong)CLLocation *startLocation;
@property(nonatomic,strong) NSString *longitude;
@property(nonatomic,strong) NSString *latitude;
@property(nonatomic,strong) NSString *address;
-(void)getCurrentLocation;

*/
-(IBAction)enterEditMode:(id)sender;
-(IBAction)cancelButton:(id)sender;
- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
/*
@property (nonatomic,strong)IBOutlet UIBarButtonItem *groupBarButton;
@property(nonatomic,strong) UIBarButtonItem *groupBarButtonSelectItems;
@property(nonatomic,strong) UIBarButtonItem *cancelBarButton;
*/

@end
