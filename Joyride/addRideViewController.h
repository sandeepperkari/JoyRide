//
//  addRideViewController.h
//  Joyride
//
//  Created by sandeep perkari on 5/22/14.
//
//

#import <UIKit/UIKit.h>


@class addRideViewController;
@protocol addRideViewControllerDelegate <NSObject>

-(void)addRideViewControllerDidCancel:(addRideViewController *)controller;
-(void)addRideViewControllerDidAdd:(addRideViewController *)controller;

@end
@interface addRideViewController : UIViewController

@property(nonatomic,weak)id<addRideViewControllerDelegate>delegate;

/*
@property IBOutlet UIBarButtonItem *cancel;
@property IBOutlet UIBarButtonItem *done;

*/
-(IBAction)cancel:(id)sender;
-(IBAction)add:(id)sender;


@end
