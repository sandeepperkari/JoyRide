//
//  TestDataCollection.m
//  Joyride
//
//  Created by sandeep perkari on 5/17/14.
//
//

#import "TestDataCollection.h"

@implementation TestDataCollection

/*
-(NSMutableArray *) getUsers{
    /*
    {userId:"111",firstName:"sandeep",lastName:"perkari",emailId:"s.p@joyride.com"}
    {userId:"222",firstName:"rahul",lastName:"singi",emailId:"r.s@joyride.com"}
    {userId:"333",firstName:"sunilreddy",lastName:"konreddy",emailId:"rs.kr@joyride.com"}
    {userId:"444",firstName:"ashish",lastName:"kontham",emailId:"a.k@joyride.com"}
    {userId:"555",firstName:"kalyan",lastName:"ganjam",emailId:"k.g@joyride.com"}
    {userId:"666",firstName:"tejasai",lastName:"gubala",emailId:"t.s@joyride.com"}
    {userId:"777",firstName:"beniet",lastName:"uthayaraj",emailId:"b.u@joyride.com"}
    {userId:"888",firstName:"krishna",lastName:"tula",emailId:"k.t@joyride.com"}
    {userId:"999",firstName:"ashish",lastName:"alugadala",emailId:"as.al@joyride.com"}




}
-(NSMutableArray *) getVehciles{
    
   /* {vechileId:"coh001",ownedByUser:"sandeepperkari",capacity:"4",userId:"111"};
    {vechileId:"coh002",ownedByUser:"rahulsingi",capacity:"4",userId:"222"};
    {vechileId:"coh003",ownedByUser:"sunilreddykonreddy",capacity:"4",userId:"333"};
    {vechileId:"coh004",ownedByUser:"ashishkontham",capacity:"4",userId:"444"};*/
    /*
     
     {vechileId:"coh005",ownedByUser:"kalyanganjam",capacity:"4"};
     {vechileId:"coh006",ownedByUser:"tejasaigubbala",capacity:"4"};
     {vechileId:"coh007",ownedByUser:"benietuthayaraj",capacity:"4"}
     {vechileId:"coh008",ownedByUser:"krishnatula",capacity:"4"}
     {vechileId:"coh009",ownedByUser:"ashishalugadala",capacity:"4"}
     
     
}
-(NSMutableArray *) getRides{
   /*
    "{'list':[{'startingPoint':'easton','destinationPoint':'lewiscenter','startPointDtTm':'05/17/14 15:30:00','destinationPointDtTm':'05/18/14 17:36:00','vechileId':'coh001','seatsAvailable':'1','rideId':'1001'},{'startingPoint':'dublin','destinationPoint':'lewiscenter','startPointDtTm':'05/18/14 15:30:00','destinationPointDtTm':'05/19/14 17:36:00','vechileId':'coh002','seatsAvailable':'1','rideId':'1002'},{'startingPoint':'polaris','destinationPoint':'easton','startPointDtTm':'05/20/14 15:30:00','destinationPointDtTm':'05/21/14 17:36:00','vechileId':'coh003','seatsAvailable':'1','rideId':'1003'},{'startingPoint':'lewiscenter','destinationPoint':'stanfordchase','startPointDtTm':'05/11/14 15:30:00','destinationPointDtTm':'05/12/14 17:36:00','vechileId':'coh004','seatsAvailable':'1','rideId':'1004'},{'startingPoint':'gahana','destinationPoint':'dublin','startPointDtTm':'05/13/14 15:30:00','destinationPointDtTm':'05/14/14 17:36:00','vechileId':'coh005','seatsAvailable':'1','rideId':'1005'},{'startingPoint':'alumcreek','destinationPoint':'easton','startPointDtTm':'05/18/14 15:30:00','destinationPointDtTm':'06/16/14 17:36:00','vechileId':'coh006','seatsAvailable':'1','rideId':'1006'},{'startingPoint':'cincinaity','destinationPoint':'atlanta','startPointDtTm':'05/19/14 15:30:00','destinationPointDtTm':'05/20/14 17:36:00','vechileId':'coh007','seatsAvailable':'1','rideId':'1007'},{'startingPoint':'sandiego','destinationPoint':'losangeles','startPointDtTm':'05/21/14 15:30:00','destinationPointDtTm':'05/22/14 17:36:00','vechileId':'coh008','seatsAvailable':'1','rideId':'1008'},{'startingPoint':'sanfrasicco','destinationPoint':'sacramento','startPointDtTm':'05/22/14 15:30:00','destinationPointDtTm':'05/23/14 17:36:00','vechileId':'coh009','seatsAvailable':'1','rideId':'1009'}]}"

}

-(NSMutableArray *) getRidesEnrollment{
    
  /*
    {rideId:"1001",userId:"555",status:"true",offerId:"111"}
    {rideId:"1002",userId:"666",status:"true",offerId:"222"}
    {rideId:"1003",userId:"777",status:"true",offerId:"333"}
    {rideId:"1004",userId:"888",status:"true",offerId:"444"}
    {rideId:"1005",userId:"999",status:"true",offerId:"111"}
 



}  */
-( NSString*)getJsonData{

     return @"{'list':[{'startingPoint':'easton','destinationPoint':'lewiscenter','startPointDtTm':'05/17/14 15:30:00','destinationPointDtTm':'05/18/14 17:36:00','vechileId':'coh001','seatsAvailable':'1','rideId':'1001'},{'startingPoint':'dublin','destinationPoint':'lewiscenter','startPointDtTm':'05/18/14 15:30:00','destinationPointDtTm':'05/19/14 17:36:00','vechileId':'coh002','seatsAvailable':'1','rideId':'1002'},{'startingPoint':'polaris','destinationPoint':'easton','startPointDtTm':'05/20/14 15:30:00','destinationPointDtTm':'05/21/14 17:36:00','vechileId':'coh003','seatsAvailable':'1','rideId':'1003'},{'startingPoint':'lewiscenter','destinationPoint':'stanfordchase','startPointDtTm':'05/11/14 15:30:00','destinationPointDtTm':'05/12/14 17:36:00','vechileId':'coh004','seatsAvailable':'1','rideId':'1004'},{'startingPoint':'gahana','destinationPoint':'dublin','startPointDtTm':'05/13/14 15:30:00','destinationPointDtTm':'05/14/14 17:36:00','vechileId':'coh005','seatsAvailable':'1','rideId':'1005'},{'startingPoint':'alumcreek','destinationPoint':'easton','startPointDtTm':'05/18/14 15:30:00','destinationPointDtTm':'06/16/14 17:36:00','vechileId':'coh006','seatsAvailable':'1','rideId':'1006'},{'startingPoint':'cincinaity','destinationPoint':'atlanta','startPointDtTm':'05/19/14 15:30:00','destinationPointDtTm':'05/20/14 17:36:00','vechileId':'coh007','seatsAvailable':'1','rideId':'1007'},{'startingPoint':'sandiego','destinationPoint':'losangeles','startPointDtTm':'05/21/14 15:30:00','destinationPointDtTm':'05/22/14 17:36:00','vechileId':'coh008','seatsAvailable':'1','rideId':'1008'},{'startingPoint':'sanfrasicco','destinationPoint':'sacramento','startPointDtTm':'05/22/14 15:30:00','destinationPointDtTm':'05/23/14 17:36:00','vechileId':'coh009','seatsAvailable':'1','rideId':'1009'}]}";

}








@end
