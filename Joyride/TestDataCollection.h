//
//  TestDataCollection.h
//  Joyride
//
//  Created by sandeep perkari on 5/17/14.
//
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Ride.h"
#import "RideEnrollment.h"
#import "Vehcile.h"

@interface TestDataCollection : NSObject
/*-(NSMutableArray *) getUsers;
-(NSMutableArray *) getVehciles;
-(NSMutableArray *) getRides;
-(NSMutableArray *) getRidesEnrollment;*/
-(NSString *)getJsonData;
@end
