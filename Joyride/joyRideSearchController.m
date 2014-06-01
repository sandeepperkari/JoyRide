//
//  joyRideSearchController.m
//  Joyride
//
//  Created by sandeep perkari on 5/16/14.
//
//

#import "joyRideSearchController.h"

@interface joyRideSearchController ()
{
    LocationViewController *locationViewController;

}

@end


@implementation joyRideSearchController

@synthesize ridesRefinedArray;
@synthesize ridesSearchBar;


-(void)setRides:(NSArray *)ridesArray{
    _ridesArray=ridesArray;
    [self.tableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    locationViewController=[[LocationViewController alloc] init];
    locationViewController.delegate=self;
    [locationViewController.locationManager startUpdatingLocation];
    // Hide the search bar until user scrolls up
    CGRect newBounds = [[self tableView] bounds];
    newBounds.origin.y = newBounds.origin.y + ridesSearchBar.bounds.size.height;
    [[self tableView] setBounds:newBounds];
    
    [self fetchRides];
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    self.ridesRefinedArray=[NSMutableArray arrayWithCapacity:[self.ridesArray count]];
    [self createBarButtonItems];
    
}

-(void)createBarButtonItems{
    
    

}

-(IBAction)fetchRides{
    
    [self.refreshControl beginRefreshing];
     self.ridesArray=[NSArray arrayWithObjects:
                [Ride ridesfromStartingPOint:@"easton" destinationPoint:@"lewiscenter" startingPointDtTm:@"05/17/14 15:30:00" destinationPointDtTm:@"05/18/14 17:36:00" vechileId:@"coh001" rideId:@"1001" seatsAvailable:@"1"],
                [Ride ridesfromStartingPOint:@"dublin" destinationPoint:@"lewiscenter" startingPointDtTm:@"05/18/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh002" rideId:@"1002" seatsAvailable:@"1"],
                [Ride ridesfromStartingPOint:@"polaris" destinationPoint:@"easton" startingPointDtTm:@"05/20/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh003" rideId:@"1003" seatsAvailable:@"1"],
                [Ride ridesfromStartingPOint:@"lewiscenter" destinationPoint:@"stanfordchase" startingPointDtTm:@"05/19/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh004" rideId:@"1004" seatsAvailable:@"1"],
                [Ride ridesfromStartingPOint:@"gahana" destinationPoint:@"dublin" startingPointDtTm:@"05/19/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh005" rideId:@"1005" seatsAvailable:@"1"],
                [Ride ridesfromStartingPOint:@"alumcreek" destinationPoint:@"easton" startingPointDtTm:@"05/19/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh006" rideId:@"1006" seatsAvailable:@"1"],
                [Ride ridesfromStartingPOint:@"cincinaity" destinationPoint:@"atlanta" startingPointDtTm:@"05/19/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh007" rideId:@"1007" seatsAvailable:@"1"],
                [Ride ridesfromStartingPOint:@"sandiego" destinationPoint:@"losangeles" startingPointDtTm:@"05/19/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh008" rideId:@"1008" seatsAvailable:@"1"],
                [Ride ridesfromStartingPOint:@"sanfrasicco" destinationPoint:@"sacramento" startingPointDtTm:@"05/22/14 15:30:00" destinationPointDtTm:@"05/23/14 17:36:00" vechileId:@"coh009" rideId:@"1009" seatsAvailable:@"1"], nil];
                
                
     ridesRefinedArray=[NSMutableArray arrayWithCapacity:[self.ridesArray count]];
     [self.refreshControl endRefreshing];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
  
    // Return the number of rows in the section.
    if(tableView ==self.searchDisplayController.searchResultsTableView){
        return [ridesRefinedArray count] ;
    }
    else{
        return [self.ridesArray count];
    }
   
   }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"searchResultCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Ride *rideObj=Nil;
    
    if(tableView==self.searchDisplayController.searchResultsTableView){
        
        NSLog(@"index row%ld",(long)indexPath.row);
        rideObj=[ridesRefinedArray objectAtIndex:indexPath.row];
     
    }
    else{
        rideObj=[self.ridesArray objectAtIndex:[indexPath row]];
    }
    
    
     cell.textLabel.text=rideObj.startingPoint;
     cell.detailTextLabel.text=rideObj.destinationPoint;
    return cell;
}



#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if(![self.tableView isEditing])
    {
         // Perform segue to candy detail
        [self performSegueWithIdentifier:@"displayDetails" sender:tableView];
    }
}

#pragma mark - Segue

-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return YES;

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"displayDetails"])
    {
        
        detailsViewController *detailsViewController = [segue destinationViewController];
        // In order to manipulate the destination view controller, another check on which table (search or normal) is displayed is needed
        if(sender == self.searchDisplayController.searchResultsTableView)
        {
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            NSString *destinationTitle = [[ridesRefinedArray objectAtIndex:[indexPath row]] startingPoint];
            [detailsViewController setTitle:destinationTitle ];
        }
        else
        {
            NSLog(@"%lu",(unsigned long)ridesRefinedArray.count);
            if(self.ridesArray.count>0 )
            {
                NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
                NSString *destinationTitle = [[self.ridesArray objectAtIndex:[indexPath row]] startingPoint];
                [detailsViewController setTitle:destinationTitle ];
                
            }
        }
        
    }
    
    if ([segue.identifier isEqualToString:@"AddRide"])
    {
        
        UINavigationController *navigationController = segue.destinationViewController;
        addRideViewController *addRideViewController = [navigationController viewControllers][0];
        addRideViewController.delegate = self;
    }
    if ([segue.identifier isEqualToString:@"addSearch"])
    {
        
        UINavigationController *navigationController = segue.destinationViewController;
        addSearchViewController *addSearchViewController = [navigationController viewControllers][0];
        addSearchViewController.delegate = self;
    }
    
}



#pragma mark - search rides filtering

-(void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope{
    
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.ridesRefinedArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF.startingPoint contains %@",searchText];
    ridesRefinedArray=[NSMutableArray arrayWithArray:[self.ridesArray filteredArrayUsingPredicate:predicate]];
    
}



#pragma mark -UISearchDisplayController Delegate Methods

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}
/*

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption{
    
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text  scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    return YES;
    
}
 */

/*

#pragma mark add ride viewcontroller delegate

-(void)addRideViewControllerDidCancel:(addRideViewController *)controller{
    [self dismissViewControllerAnimated:yes completion:nil];
}

-(void)addRideViewControllerDidSave:(addRideViewController *)controller{
        [self dismissViewControllerAnimated:yes completion:nil];
}


*/

#pragma mark Grouping cell

//Group button clicked for grouping cells
-(IBAction)enterEditMode:(id)sender{
    
   if([self.tableView isEditing])
   {
        //Editing mode. Set to no editing mode
        [self.tableView setEditing:NO animated:NO];
       // NSArray *selectedRows = [self.tableView indexPathsForSelectedRows];
       //NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
        //[self.editButtonItem]
        
    }
    else
    {
        //No Editing mode.Set to editng mode
        [self.tableView setEditing:YES animated:YES];
        //UIBarButtonItem *myBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelEditingTableViewCells)];
        //myBarButtonItem.title = @"Cancel";
        //self.navigationItem.leftBarButtonItem = myBarButtonItem;
        //self.navigationItem.leftBarButtonItem=
       // [self.group setTitle:@"cancel" forState:UIControlStateNormal];
    }
    

}
-(IBAction)cancelButton:(id)sender
{
}

-(void)cancelEditingTableViewCells{
[self.tableView setEditing:NO animated:NO];
    UIBarButtonItem *myBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"cancel" style:UIBarButtonItemStyleDone target:self action:nil];
    myBarButtonItem.title = @"Group";
    self.navigationItem.leftBarButtonItem = myBarButtonItem;
}



#pragma mark - AddRideViewControllerDelegate

- (void)addRideViewControllerDidCancel:(addRideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addRideViewControllerDidAdd:(addRideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - AddSearchViewControllerDelegate

- (void)addSearchViewControllerDidCancel:(addSearchViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addSearchViewControllerDidSearch:(addSearchViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Location Updates

-(void)locationUpdates:(NSString *)address
{
    NSLog(@"Address %@",address);
}
-(void)locationError:(NSString *)error
{
    NSLog(@"Error %@",error);
}

@end





/*

-(void)getCurrentLocation
{
    if([CLLocationManager locationServicesEnabled])
    {
        locationManager.delegate=self;
        locationManager.desiredAccuracy=kCLLocationAccuracyBest;
       // [locationManager startUpdatingLocation];
    }
}

#pragma mark- CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"did fail with error %@",error);
    
    UIAlertView *errorAlert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [errorAlert show];
    
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        self.longitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        self.latitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        
        NSLog(@" address%@",self.latitude);
        NSLog(@"Longitude %@",self.longitude);
    }
    [locationManager stopUpdatingLocation];
    
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            self.address = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                            placemark.subThoroughfare, placemark.thoroughfare,
                            placemark.postalCode, placemark.locality,
                            placemark.administrativeArea,
                            placemark.country];
            
            
            NSLog(@" address%@",self.address);
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
}

*/

/*

-(IBAction)groupItemsAction:(id)sender
{

}


-(void)updateButtonToMatchTableState
{
    
    if(self.tableView.isEditing)
    {
        //Change left barbutton on left to cancel
        self.navigationItem.leftBarButtonItem=self.cancelBarButton;
        
        //Change left barbutton on right to Group
        self.navigationItem.rightBarButtonItem=self.groupBarButtonSelectItems;
        
    
    
    }
    else
    {
        
        //Not in editing mode
        //self.navigationItem.leftBarButtonItem=self.
    }

}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return <#expression#>
}



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle== UITableViewCellEditingStyleNone){
    
    }


}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;

}
*/





/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 
 //UITableviewDelegate method sent  when row is selected
 -(void)tableView:(UITableView *)sender didSelectRowAtIndexPath:(NSIndexPath *)path
 {
 }
 -(void)beginRefreshing{}
 -(void)endRefreshing{}
 
 -(void)reloadData;//causes the table to call numberOfSectionsInTableView: and numberOfRowsInSection:
 all over again and then call cellForRowAtIndexPath;
 
 //if only part of your model changes
 -(void)reloadRowsAtIndexPaths:(NSArray *)indexPaths
 withRowAnimation:(UITableViewRowAnimation)animationStyle;
 
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
/*
 
 #pragma mark - Navigation
 
 -(void)prepareDetailsViewController:(detailsViewController *)dvc toDisplayRideDetails:(NSDictionary *)ride{
 
 
 
 }
 
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 if([sender isKindOfClass:[UITableViewCell class]]){
 NSIndexPath *indexPath=[self.tableView indexPathForCell:sender];
 if(indexPath){
 if([segue.identifier isEqualToString:@"displayDetails"]){
 if([segue.destinationViewController isKindOfClass:[detailsViewController class]]){
 [self prepareDetailsViewController:segue.destinationViewController toDisplayRideDetails:self.ridesArray[indexPath.row]];
 
 }
 }
 }
 }
 }
 
 
 */

