//
//  DJOutOfTheWorldTableViewController.h
//  Out of the World
//
//  Created by Divakaran Jeyachandran on 6/20/14.
//
//

#import <UIKit/UIKit.h>
#import "DJAddSpaceObjectViewController.h"

@interface DJOutOfTheWorldTableViewController : UITableViewController <DJaddSpaceObjectViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addedSpaceObject;

@end
