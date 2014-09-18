//
//  DJAddSpaceObjectViewController.h
//  Out of the World
//
//  Created by Divakaran Jeyachandran on 6/25/14.
//
//

#import <UIKit/UIKit.h>
#import "DJSpaceObject.h"

@protocol DJaddSpaceObjectViewControllerDelegate <NSObject>
@required
-(void)addSpaceObject:(DJSpaceObject *)spaceObject;
-(void)didCancel;

@end

@interface DJAddSpaceObjectViewController : UIViewController

@property (weak, nonatomic) id <DJaddSpaceObjectViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberofMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestTextField;

- (IBAction)cancelButton:(UIButton *)sender;
- (IBAction)addButton:(UIButton *)sender;
@end
