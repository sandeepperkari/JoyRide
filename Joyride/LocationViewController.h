//
//  LocationViewController.h
//  Joyride
//
//  Created by sandeep perkari on 5/23/14.
//
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController : UIViewController<CLLocationManagerDelegate>


@property(nonatomic,strong)CLLocationManager *loactionManager;
@property(nonatomic,strong)CLLocation *startLocation;
@property(nonatomic,strong) NSString *longitude;
@property(nonatomic,strong) NSString *latitude;
@property(nonatomic,strong) NSString *address;
-(void)getCurrentLocation;

@end
