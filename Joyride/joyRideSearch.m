//
//  joyRideSearch.m
//  Joyride
//
//  Created by sandeep perkari on 5/17/14.
//
//

#import "joyRideSearch.h"
#import "TestDataCollection.h"

@interface joyRideSearch ()

@end

@implementation joyRideSearch


/*
- (void)viewDidLoad
{
    [super viewDidLoad];
    
   [self fetchRides];
	// Do any additional setup after loading the view.
}

-(void)fetchRides{
    
    
    dispatch_queue_t fetchQ=dispatch_queue_create("ridesQ", NULL);
    dispatch_async(fetchQ, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{});
    
    });
    
    
    TestDataCollection *testDataCollection=[[TestDataCollection alloc] init];
    
    NSData * data = [testDataCollection.getJsonData dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *propertyListResults=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL] ;
    
    NSMutableArray *rides=[propertyListResults valueForKey:@"lists"];
    
    NSLog(@" lists%@",rides);
    
   // self.ridesArray=rides;
    
    
    
}*/


@end
