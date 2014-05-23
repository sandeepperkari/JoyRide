//
//  Ride.h
//  Joyride
//
//  Created by sandeep perkari on 5/17/14.
//
//

#import <Foundation/Foundation.h>

@interface Ride : NSObject
{
    
    
    NSString *startingPoint;
    NSString *destinationPoint;
    NSString    *startPointDtTm;
    NSString *destinationPointDtTm;
    NSString *vehicleId;
    NSString *rideId;
    NSString *seatsAvailable;
}
@property(nonatomic,strong) NSString *startingPoint;
@property(nonatomic,strong) NSString *destinationPoint;
@property(nonatomic,strong) NSString *startPointDtTm;
@property(nonatomic,strong) NSString *destinationPointDtTm;
@property(nonatomic,strong) NSString *vechileId;
@property(nonatomic,strong) NSString *rideId;
@property(nonatomic,strong) NSString *seatsAvailable;
+(id)ridesfromStartingPOint:(NSString *)startingPoint
         destinationPoint:(NSString *)destinationPoint
        startingPointDtTm:(NSString *)startingPointDtTm
     destinationPointDtTm:(NSString *)destinationPointDtTm
                vechileId:(NSString *)vechileId
                   rideId:(NSString *)rideId
           seatsAvailable:(NSString *)seatsAvailable;


@end
