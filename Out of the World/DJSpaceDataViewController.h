//
//  DJSpaceDataViewController.h
//  Out of the World
//
//  Created by Divakaran Jeyachandran on 6/23/14.
//
//

#import <UIKit/UIKit.h>
#import "DJSpaceObject.h"

@interface DJSpaceDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) DJSpaceObject *SpaceObject;

@end
