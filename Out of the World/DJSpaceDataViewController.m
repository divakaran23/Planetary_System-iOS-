//
//  DJSpaceDataViewController.m
//  Out of the World
//
//  Created by Divakaran Jeyachandran on 6/23/14.
//
//

#import "DJSpaceDataViewController.h"

@interface DJSpaceDataViewController ()

@end

@implementation DJSpaceDataViewController

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
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier forIndexPath:indexPath];
    
    // Write a switch statement to display content seperately for each planet
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"NickName:";
            cell.detailTextLabel.text = self.SpaceObject.nickname;
            break;
        case 1:
            cell.textLabel.text = @"Diameter:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.SpaceObject.diameter];
            break;
        case 2:
            cell.textLabel.text = @"Gravitational Force:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.SpaceObject.gravitationalForce];
            break;
        case 3:
            cell.textLabel.text = @"Length of a year:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.SpaceObject.yearLength];
            break;
        case 4:
            cell.textLabel.text = @"Length of a day:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.SpaceObject.dayLength];
            break;
        case 5:
            cell.textLabel.text = @"Temperature";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.SpaceObject.temperature];
            break;
        case 6:
            cell.textLabel.text = @"Number of Moons:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", self.SpaceObject.numberOfMoons];
            break;
        case 7:
            cell.textLabel.text = @"Interesting fact:";
            cell.detailTextLabel.text = self.SpaceObject.interestFact;
            break;
        default:
            break;
    }
    return cell;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
