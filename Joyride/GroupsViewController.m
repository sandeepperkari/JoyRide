//
//  GroupsViewController.m
//  Joyride
//
//  Created by sandeep perkari on 5/31/14.
//
//

#import "GroupsViewController.h"
#import "Ride.h"
@interface GroupsViewController ()

@end

@implementation GroupsViewController
@synthesize ridesGroupArray;
@synthesize ridesGroupRefinedArray;
@synthesize groupRidesSearchBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.refreshControl beginRefreshing];
   
    
    // Hide the search bar until user scrolls up
    CGRect newBounds = [[self tableView] bounds];
    newBounds.origin.y = newBounds.origin.y + groupRidesSearchBar.bounds.size.height;
    [[self tableView] setBounds:newBounds];
    
    self.ridesGroupArray=[NSMutableArray arrayWithObjects:
    
    [Ride ridesfromStartingPOint:@"easton" destinationPoint:@"lewiscenter" startingPointDtTm:@"05/17/14 15:30:00" destinationPointDtTm:@"05/18/14 17:36:00" vechileId:@"coh001" rideId:@"1001" seatsAvailable:@"1"],
    [Ride ridesfromStartingPOint:@"dublin" destinationPoint:@"lewiscenter" startingPointDtTm:@"05/18/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh002" rideId:@"1002" seatsAvailable:@"1"],
    [Ride ridesfromStartingPOint:@"polaris" destinationPoint:@"easton" startingPointDtTm:@"05/20/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh003" rideId:@"1003" seatsAvailable:@"1"],
    [Ride ridesfromStartingPOint:@"lewiscenter" destinationPoint:@"stanfordchase" startingPointDtTm:@"05/19/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh004" rideId:@"1004" seatsAvailable:@"1"],
    [Ride ridesfromStartingPOint:@"gahana" destinationPoint:@"dublin" startingPointDtTm:@"05/19/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh005" rideId:@"1005" seatsAvailable:@"1"],
    [Ride ridesfromStartingPOint:@"alumcreek" destinationPoint:@"easton" startingPointDtTm:@"05/19/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh006" rideId:@"1006" seatsAvailable:@"1"],
    [Ride ridesfromStartingPOint:@"cincinaity" destinationPoint:@"atlanta" startingPointDtTm:@"05/19/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh007" rideId:@"1007" seatsAvailable:@"1"],
    [Ride ridesfromStartingPOint:@"sandiego" destinationPoint:@"losangeles" startingPointDtTm:@"05/19/14 15:30:00" destinationPointDtTm:@"05/19/14 17:36:00" vechileId:@"coh008" rideId:@"1008" seatsAvailable:@"1"],
    [Ride ridesfromStartingPOint:@"sanfrasicco" destinationPoint:@"sacramento" startingPointDtTm:@"05/22/14 15:30:00" destinationPointDtTm:@"05/23/14 17:36:00" vechileId:@"coh009" rideId:@"1009" seatsAvailable:@"1"], nil];
    
     self.ridesGroupRefinedArray=[NSMutableArray arrayWithCapacity:[self.ridesGroupArray count]];
    
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];

}

-(void)selectedRidesForGroup:(NSMutableArray *)groups
{

   // self.ridesGroupArray=[[NSMutableArray alloc] initWithArray:groups];
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
    if(tableView ==self.searchDisplayController.searchResultsTableView)
    {
        return [ridesGroupRefinedArray count] ;
    }
    else
    {
        return [self.ridesGroupArray count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"groupRides";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == Nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    Ride *rideObj=Nil;
    if(tableView ==self.searchDisplayController.searchResultsTableView)
    {
        rideObj=[ridesGroupRefinedArray objectAtIndex:indexPath.row];
    }
    else
    {
        rideObj=[ridesGroupArray objectAtIndex:[indexPath row]];
    }
    // Configure the cell...
    
    cell.textLabel.text=rideObj.startingPoint;
    cell.detailTextLabel.text=rideObj.destinationPoint;
    
    return cell;
}
#pragma mark TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(![self.tableView isEditing])
    {
         [self performSegueWithIdentifier:@"GroupList" sender:tableView];
        
    }

}

- (void)tableView: (UITableView *)tableView commitEditingStyle: (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath: (NSIndexPath *)indexPath
{
    if(editingStyle==UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        [self.ridesGroupArray removeObjectAtIndex:[indexPath row]];
        
        // Delete row using the cool literal version of [NSArray arrayWithObject:indexPath]
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    }

}

#pragma mark Perform Segue


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"GroupList"])
    {
        GroupListViewController *groupListViewController= segue.destinationViewController;
        
        if(sender== self.searchDisplayController.searchResultsTableView)
        {
            NSIndexPath *indexPath=[self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            NSString *destinationTitle = [[self.ridesGroupRefinedArray objectAtIndex:[indexPath row]] startingPoint];
            [groupListViewController setTitle:destinationTitle ];
            
            [groupListViewController setGroupRidesList:ridesGroupArray];
        }
        else
        {
            if(self.ridesGroupArray.count>0)
            {
                NSIndexPath  *indexPath=[self.tableView indexPathForSelectedRow];
                NSString *destinationTitle = [[self.ridesGroupArray objectAtIndex:[indexPath row]] startingPoint];
                [groupListViewController setTitle:destinationTitle ];
            
            }
        }
    
    }

}

#pragma mark - search rides filtering

-(void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope{
    
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.ridesGroupRefinedArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF.startingPoint contains %@",searchText];
    self.ridesGroupRefinedArray=[NSMutableArray arrayWithArray:[self.ridesGroupArray filteredArrayUsingPredicate:predicate]];
    
}



#pragma mark -UISearchDisplayController Delegate Methods

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(IBAction)groupRidesEnterEditMode:(id)sender
{
    if([self.tableView isEditing])
    {
        //Editing mode. Set to no editing mode
        [self.tableView setEditing:NO animated:NO];
        
    }
    else
    {
        //No Editing mode.Set to editng mode
        [self.tableView setEditing:YES animated:YES];

    }

}

-(IBAction)groupRidesDoneEditMode:(id)sender
{
    


}


@end
