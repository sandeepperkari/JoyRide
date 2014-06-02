//
//  CreateGroupViewController.h
//  Joyride
//
//  Created by sandeep perkari on 6/1/14.
//
//

#import <UIKit/UIKit.h>
@class CreateGroupViewController;
@protocol createGroupDelegate <NSObject>

-(void)createdGroupViewControllerDidCancel:(CreateGroupViewController *)controller;
-(void)createdGroupViewControllerDidCreate:(CreateGroupViewController *)controller;

@end

@interface CreateGroupViewController : UIViewController
@property(nonatomic,weak)id<createGroupDelegate>delegate;
@property(nonatomic,strong)IBOutlet UITextField *createGroup;
-(IBAction)Cancel:(id)sender;
-(IBAction)Done:(id)sender;
@end
