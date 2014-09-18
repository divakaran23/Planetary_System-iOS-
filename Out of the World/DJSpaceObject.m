//
//  DJSpaceObject.m
//  Out of the World
//
//  Created by Divakaran Jeyachandran on 6/21/14.
//
//

#import "DJSpaceObject.h"
#import "AstronomicalData.h"

@implementation DJSpaceObject

-(id)init
{
    self = [self initWithObjects:nil andImage:nil];
    return self;
}

-(id)initWithObjects:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];
    self.name = data[PLANET_NAME];
    self.gravitationalForce = [data[PLANET_GRAVITY]floatValue];
    self.diameter = [data[PLANET_DIAMETER]floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH]floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH]floatValue];
    self.temperature = [data[PLANET_TEMPERATURE]floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS]floatValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestFact = data[PLANET_INTERESTING_FACT];
    
    self.spaceImage = image;
    
    return self;
}


@end
