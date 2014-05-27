//
//  addSearchViewController.h
//  Joyride
//
//  Created by sandeep perkari on 5/27/14.
//
//

#import <UIKit/UIKit.h>
@class addSearchViewController;

@protocol addSearchViewControllerDelegate<NSObject>

-(void)addSearchViewControllerDidCancel:(addSearchViewController *)controller;
-(void)addSearchViewControllerDidSearch:(addSearchViewController *)controller;

@end

@interface addSearchViewController : UITableViewController

@property (nonatomic,weak)id<addSearchViewControllerDelegate>delegate;

@property (nonatomic,strong) IBOutlet UITextField *startingPoint;
@property (nonatomic,strong) IBOutlet UITextField *destinationPoint;


-(IBAction)cancel:(id)sender;
-(IBAction)search:(id)sender;

@end
