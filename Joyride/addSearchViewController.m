//
//  addSearchViewController.m
//  Joyride
//
//  Created by sandeep perkari on 5/27/14.
//
//

#import "addSearchViewController.h"
#define kDatePickerIndex 2
#define kEndDatePickerIndex 5
#define kDatePickerCellHeight 164

@interface addSearchViewController ()

@end

@implementation addSearchViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.startingPoint.delegate=self;
    self.destinationPoint.delegate=self;
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
    self.endDateTimeLabel.text=[self.dateFormatter stringFromDate:defaultDate];
    self.endDateTimeLabel.textColor=[self.tableView tintColor];
    self.selectedStartDateTime=defaultDate;
    

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height=self.tableView.rowHeight;
    
    if(indexPath.row==kDatePickerIndex )
    {
        height=self.datePickerIsShowing ?  kDatePickerCellHeight:0.0f;
        
    }
    else if (indexPath.row==kEndDatePickerIndex)
    {
    height=self.endDatePickerIsShowing ?  kDatePickerCellHeight:0.0f;
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
            //self.endDatePicker.hidden=YES;
            
        }
    }
    else if (indexPath.row==4)
    {
       if(self.endDatePickerIsShowing )
       {
           [self hideEndDatePickerCell];
       }
       else
        {
            [self.activeTextField resignFirstResponder];
            [self showEndDatePickerCell];
            self.endDatePicker.hidden=NO;
            
        }
    
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)showDatePickerCell
{
    
    self.datePickerIsShowing=YES;
    [self.tableView beginUpdates];
    self.startDatePicker.hidden=NO;
    self.startDatePicker.alpha=0.0f;
    [UIView animateWithDuration:0.25 animations:^{
        self.startDatePicker.alpha=1.0f;
    }];
    [self.tableView endUpdates];
}

-(void)showEndDatePickerCell
{
    self.endDatePickerIsShowing =YES;
    [self.tableView beginUpdates];
    self.endDatePicker.hidden=NO;
    self.endDatePicker.alpha=0.0f;
    [UIView animateWithDuration:0.25 animations:^{
        self.endDatePicker.alpha=1.0f;
    }];
    
    [self.tableView endUpdates];
    
}
-(void)hideEndDatePickerCell
{
    self.endDatePickerIsShowing =NO;
    [self.tableView beginUpdates];
    
    [UIView animateWithDuration:0.25
                     animations:^{
                         
                         self.endDatePicker.alpha=0.0f;
                     }
                     completion:^(BOOL finished)
                    {
                        
                        self.endDatePicker.hidden=YES;
         
                    }];
    [self.tableView endUpdates];

}
-(void)hideDatePickerCell
{
    self.datePickerIsShowing=NO;
    [self.tableView beginUpdates];
   
    
    [UIView animateWithDuration:0.25
    animations:^{
        self.startDatePicker.alpha=0.0f;
        
    }
    completion:^(BOOL finished)
    {
        self.startDatePicker.hidden=YES;
    }];
    
     [self.tableView endUpdates];

}
-(IBAction)startDatePickerChange:(UIDatePicker *)sender
{
    self.startDateTimeLabel.text= [self.dateFormatter stringFromDate:sender.date];
    self.selectedStartDateTime=sender.date;
    

}
-(IBAction)endDatePickerChange:(UIDatePicker *)sender
{
    self.endDateTimeLabel.text= [self.dateFormatter stringFromDate:sender.date];
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
