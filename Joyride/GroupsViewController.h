//
//  GroupsViewController.h
//  Joyride
//
//  Created by sandeep perkari on 5/31/14.
//
//

#import <UIKit/UIKit.h>
#import "Ride.h"
#import "GroupListViewController.h"
@interface GroupsViewController : UITableViewController<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSMutableArray *ridesGroupArray;
@property(nonatomic,strong)NSMutableArray *ridesGroupRefinedArray;

@property (strong, nonatomic) IBOutlet UISearchBar *groupRidesSearchBar;

-(void)selectedRidesForGroup:(NSMutableArray *)groups;
-(IBAction)groupRidesEnterEditMode:(id)sender;
-(IBAction)groupRidesDoneEditMode:(id)sender;



@end
