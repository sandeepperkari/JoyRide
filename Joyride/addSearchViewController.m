//
//  addSearchViewController.m
//  Joyride
//
//  Created by sandeep perkari on 5/27/14.
//
//

#import "addSearchViewController.h"

@interface addSearchViewController ()

@end

@implementation addSearchViewController

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
    [self.delegate addSearchViewControllerDidCancel:self];

}
-(IBAction)search:(id)sender
{
    [self.delegate addSearchViewControllerDidSearch:self];
    
}
@end
