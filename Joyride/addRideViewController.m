//
//  addRideViewController.m
//  Joyride
//
//  Created by sandeep perkari on 5/22/14.
//
//

#import "addRideViewController.h"

@interface addRideViewController ()

@end

@implementation addRideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancel:(id)sender
{
    [self.delegate addRideViewControllerDidCancel:self];    
    
}
-(IBAction)add:(id)sender
{
    [self.delegate addRideViewControllerDidAdd:self];
    
}

@end
