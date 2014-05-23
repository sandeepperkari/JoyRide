//
//  Ride.m
//  Joyride
//
//  Created by sandeep perkari on 5/17/14.
//
//

#import "Ride.h"

@implementation Ride

@synthesize startingPoint;
@synthesize destinationPoint;
@synthesize startPointDtTm;
@synthesize vechileId;
@synthesize rideId;
@synthesize destinationPointDtTm;
@synthesize seatsAvailable;



+(id)ridesfromStartingPOint:(NSString *)startingPoint destinationPoint:(NSString *)destinationPoint startingPointDtTm:(NSString *)startingPointDtTm destinationPointDtTm:(NSString *)destinationPointDtTm vechileId:(NSString *)vechileId rideId:(NSString *)rideId seatsAvailable:(NSString *)seatsAvailable
{

    Ride *newRide=[[self alloc] init];
    [newRide setStartingPoint:startingPoint];
    [newRide setDestinationPoint:destinationPoint];
    [newRide setStartPointDtTm:startingPointDtTm];
    [newRide setDestinationPointDtTm:destinationPointDtTm];
    [newRide setVechileId:vechileId];
    [newRide setRideId:rideId];
    [newRide setSeatsAvailable:seatsAvailable];
    return newRide;
}
@end
