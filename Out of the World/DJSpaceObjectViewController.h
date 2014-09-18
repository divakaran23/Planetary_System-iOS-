//
//  DJSpaceObjectViewController.h
//  Out of the World
//
//  Created by Divakaran Jeyachandran on 6/22/14.
//
//

#import <UIKit/UIKit.h>
#import "DJSpaceObject.h"

@interface DJSpaceObjectViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) DJSpaceObject *spaceObject;

@end
