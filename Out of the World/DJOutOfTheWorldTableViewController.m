//
//  DJOutOfTheWorldTableViewController.m
//  Out of the World
//
//  Created by Divakaran Jeyachandran on 6/20/14.
//
//

#import "DJOutOfTheWorldTableViewController.h"
#import "AstronomicalData.h"
#import "DJSpaceObject.h"
#import "DJSpaceObjectViewController.h"
#import "DJSpaceDataViewController.h"

@interface DJOutOfTheWorldTableViewController ()

@end

@implementation DJOutOfTheWorldTableViewController

#define ADDED_SPACE_OBJECTS_KEY @"Added Space Objects Array"

#pragma mark - Lazy Instantiation

-(NSMutableArray *)planets
{
    if (!_planets) {
        _planets = [[NSMutableArray alloc]init];
    }
    return _planets;
}
-(NSMutableArray *)addedSpaceObject
{
    if (!_addedSpaceObject) {
        _addedSpaceObject = [[NSMutableArray alloc]init];
    }
    return _addedSpaceObject;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets]) {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg",planetData[PLANET_NAME]];
        DJSpaceObject *planet = [[DJSpaceObject alloc]initWithObjects:planetData andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }
    
    NSArray *myplanetsAsPropertyLists = [[NSUserDefaults standardUserDefaults]arrayForKey:ADDED_SPACE_OBJECTS_KEY];
    for (NSDictionary *dictionary in myplanetsAsPropertyLists) {
        DJSpaceObject *spaceObject = [self spaceObjectForDictionary:dictionary];
        [self.addedSpaceObject addObject:spaceObject];
    }
    
    
//    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
//    NSString *firstColor = @"red";
//    [dictionary setObject:firstColor forKey:@"Fire Truck"];
//    [dictionary setObject:@"Blue" forKey:@"Ocean Color"];
//    [dictionary setObject:@"Yellow" forKey:@"Star Yellow"];
//    NSLog(@"%@",dictionary);
//    NSString *color = [dictionary objectForKey:@"Fire Truck"];
//    NSLog(@"%@", color);
    NSNumber *myNumber = [NSNumber numberWithInt:5];
    NSNumber *floatNumber = [NSNumber numberWithFloat:3.14];
    NSLog(@"%@ and %@", myNumber, floatNumber);
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.destinationViewController isKindOfClass:[DJSpaceObjectViewController class]]) {
            DJSpaceObjectViewController *nextViewController = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            DJSpaceObject *selectedObject;
            if (path.section == 0) {
                selectedObject = self.planets[path.row];
            }else if (path.section == 1)
            {
                selectedObject = self.addedSpaceObject[path.row];
            }
            nextViewController.spaceObject = selectedObject;
        }
    }
    if ([sender isKindOfClass:[NSIndexPath class]]) {
        if ([segue.destinationViewController isKindOfClass:[DJSpaceDataViewController class]]) {
            DJSpaceDataViewController *targetController = segue.destinationViewController;
            NSIndexPath *path = sender;
            DJSpaceObject *selectedObject;
            if (path.section == 0) {
                selectedObject = self.planets[path.row];
            }else if (path.section == 1)
            {
                selectedObject = self.addedSpaceObject[path.row];
            }
            targetController.SpaceObject = selectedObject;
        }
    }
    if ([segue.destinationViewController isKindOfClass:[DJAddSpaceObjectViewController class]]) {
        DJAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Add space object delegate

-(void)didCancel
{
    NSLog(@"Cancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)addSpaceObject:(DJSpaceObject *)spaceObject
{
    NSLog(@"Add object");
    
    [self.addedSpaceObject addObject:spaceObject];
    
    // WIll save to NSUserDefault here
    NSMutableArray *spaceObjectAsPropertyList = [[[NSUserDefaults standardUserDefaults]arrayForKey:ADDED_SPACE_OBJECTS_KEY]mutableCopy];
    if (!spaceObjectAsPropertyList) {
        spaceObjectAsPropertyList = [[NSMutableArray alloc]init];
    }
    // put the dictionary we get from the helper method into a mutable array
    [spaceObjectAsPropertyList addObject:[self spaceObjectAsAPropertyList:spaceObject]];
    // now save the array to NSUserDefaults
    [[NSUserDefaults standardUserDefaults]setObject:spaceObjectAsPropertyList forKey:ADDED_SPACE_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

#pragma  mark - helper methods

-(NSDictionary *)spaceObjectAsAPropertyList:(DJSpaceObject *)spaceObject
{
    NSData *imageData = UIImagePNGRepresentation(spaceObject.spaceImage);
    NSDictionary *addedObject = @{PLANET_NAME: spaceObject.name, PLANET_NICKNAME: spaceObject.nickname, PLANET_DAY_LENGTH: @(spaceObject.dayLength), PLANET_DIAMETER: @(spaceObject.diameter), PLANET_GRAVITY: @(spaceObject.gravitationalForce), PLANET_IMAGE: imageData, PLANET_INTERESTING_FACT: spaceObject.interestFact, PLANET_NUMBER_OF_MOONS: @(spaceObject.numberOfMoons), PLANET_TEMPERATURE: @(spaceObject.temperature), PLANET_YEAR_LENGTH: @(spaceObject.yearLength)};
    return addedObject;
}
-(DJSpaceObject *)spaceObjectForDictionary:(NSDictionary *)dictionary
{
    NSData *dataForImage = dictionary[PLANET_IMAGE];
    UIImage *imageForSpaceObject = [UIImage imageWithData:dataForImage];
    DJSpaceObject *spaceObject = [[DJSpaceObject alloc]initWithObjects:dictionary andImage:imageForSpaceObject];
    return spaceObject;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    if (self.addedSpaceObject) {
        return 2;
    }
    else{
         return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 1) {
        return [self.addedSpaceObject count];
    }
    else
    {
        return [self.planets count];
    }
    }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myCellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 1) {
        DJSpaceObject *planet = [self.addedSpaceObject objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    else{
        DJSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    return cell;
}

#pragma mark - UITableView Delegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"space data" sender:indexPath];
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    if(indexPath.section == 1) return YES;
    else return NO;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.addedSpaceObject removeObjectAtIndex:indexPath.row];
        NSMutableArray *newSavedSpaceObjectData = [[NSMutableArray alloc]init];
        for (DJSpaceObject *spaceObject in self.addedSpaceObject) {
            [newSavedSpaceObjectData addObject:[self spaceObjectAsAPropertyList:spaceObject]];
        }
        [[NSUserDefaults standardUserDefaults]setObject:newSavedSpaceObjectData forKey:ADDED_SPACE_OBJECTS_KEY];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
