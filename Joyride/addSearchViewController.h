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

@interface addSearchViewController : UITableViewController<UITextFieldDelegate>

@property (nonatomic,weak)id<addSearchViewControllerDelegate>delegate;
@property (assign) BOOL datePickerIsShowing;
@property (nonatomic,strong) IBOutlet UITextField *startingPoint;
@property (strong, nonatomic) IBOutlet UITextField *destinationPoint;
@property(nonatomic,strong) IBOutlet UILabel *StartDateTime;
@property(nonatomic,strong) IBOutlet UIDatePicker *startDatePicker;
@property(nonatomic,strong) IBOutlet UIDatePicker *endDatePicker;
@property (strong, nonatomic) IBOutlet UITableViewCell *startDatePickerCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *endDatePickerCell;
@property (nonatomic,strong) NSDateFormatter *dateFormatter;
@property(nonatomic,strong) IBOutlet  UILabel *startDateTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *endDateTimeLabel;
@property(nonatomic,strong) NSDate *selectedStartDateTime;
@property(nonatomic,strong) UITextField *activeTextField;

-(IBAction)cancel:(id)sender;
-(IBAction)search:(id)sender;
-(IBAction)startDatePickerChange:(UIDatePicker *)sender;
-(IBAction)endDatePickerChange:(UIDatePicker *)sender;

@end
