//
//  addSearchViewController.m
//  Joyride
//
//  Created by sandeep perkari on 5/27/14.
//
//

#import "addSearchViewController.h"
#define kDatePickerIndex 2
#define kDatePickerCellHeight 164

@interface addSearchViewController ()

@end

@implementation addSearchViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //self.startingPoint.text=@" ";
    self.startingPoint.delegate=self;
    [self setupDefaultStartDate];
    [self signUpForKeyboardNotifications];
}



-(IBAction)cancel:(id)sender
{
    [self.delegate addSearchViewControllerDidCancel:self];

}
-(IBAction)search:(id)sender
{
    [self.delegate addSearchViewControllerDidSearch:self];
    
}


-(void)setupDefaultStartDate
{
    self.dateFormatter=[[NSDateFormatter alloc] init];
    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [self.dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSDate *defaultDate=[NSDate date];
    
    self.startDateTimeLabel.text=[self.dateFormatter stringFromDate:defaultDate];
    self.startDateTimeLabel.textColor=[self.tableView tintColor];
    self.selectedStartDateTime=defaultDate;
    

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height=self.tableView.rowHeight;
    
    if(indexPath.row==kDatePickerIndex)
    {
        height=self.datePickerIsShowing ?  kDatePickerCellHeight:0.0f;
        
    }
    return height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==1)
    {
        if(self.datePickerIsShowing)
        {
            [self hideDatePickerCell];
        }
        else
        {
            [self.activeTextField resignFirstResponder];
            [self showDatePickerCell];
        }
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)showDatePickerCell
{
    
    self.datePickerIsShowing=YES;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    self.startDatePicker.hidden=NO;
    self.startDatePicker.alpha=0.0f;
    
    [UIView animateWithDuration:0.25 animations:^{
    
        self.startDatePicker.alpha=1.0f;
    
    }];

}
-(void)hideDatePickerCell
{
    self.datePickerIsShowing=NO;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
    [UIView animateWithDuration:0.25
    animations:^{
        self.startDatePicker.alpha=0.0f;
        
    }
    completion:^(BOOL finished)
    {
        self.startDatePicker.hidden=YES;
                     
    }];
    

}
-(IBAction)startDatePickerChange:(UIDatePicker *)sender
{
    self.startDateTimeLabel.text= [self.dateFormatter stringFromDate:sender.date];
    self.selectedStartDateTime=sender.date;
    

}
- (void)signUpForKeyboardNotifications
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
    
}
- (void)keyboardWillShow {
    
    if (self.datePickerIsShowing){
        
        [self hideDatePickerCell];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeTextField=textField;
}

@end
