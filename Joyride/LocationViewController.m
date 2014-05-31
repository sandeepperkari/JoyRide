//
//  LocationViewController.m
//  Joyride
//
//  Created by sandeep perkari on 5/23/14.
//
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController
@synthesize locationManager;
@synthesize delegate;
@synthesize geocoder;
   
    


@synthesize latitude;
@synthesize longitude;
@synthesize address;




- (id)init
{
    self=[super init];
    if(self!=nil)
    {
        self.locationManager=[[CLLocationManager alloc]init];
        self.locationManager.delegate=self;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        self.geocoder=[[CLGeocoder alloc]init];
    }
    return self;
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
        
        NSLog(@" latitude%@",self.latitude);
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
            
            
            [self.delegate locationUpdates:self.address];
        }
        else
        {
             [self.delegate locationError:error.debugDescription];
          //  NSLog(@"%@", error.debugDescription);
        }
    } ];
}




@end
