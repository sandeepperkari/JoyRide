//
//  LocationViewController.h
//  Joyride
//
//  Created by sandeep perkari on 5/23/14.
//
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class LocationViewController;
@protocol MYCLControllerDelegate <NSObject>
@required
-(void)locationUpdates:(NSString *)address;
-(void)locationError:(NSString *)error;


@end
@interface LocationViewController : NSObject<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    
    

}
@property (nonatomic,weak)id<MYCLControllerDelegate>delegate;
@property(nonatomic,strong)CLLocationManager *locationManager;
@property(nonatomic,strong)CLGeocoder *geocoder;

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error;



@property(nonatomic,strong)CLLocation *startLocation;
@property(nonatomic,strong) NSString *longitude;
@property(nonatomic,strong) NSString *latitude;
@property(nonatomic,strong) NSString *address;


@end
