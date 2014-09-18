//
//  DJSpaceObject.h
//  Out of the World
//
//  Created by Divakaran Jeyachandran on 6/21/14.
//
//

#import <Foundation/Foundation.h>

@interface DJSpaceObject : NSObject

@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)UIImage *spaceImage;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;
@property (strong, nonatomic) NSString *interestFact;
@property (strong, nonatomic) NSString *nickname;

-(id)initWithObjects:(NSDictionary *)data andImage:(UIImage *)image;

@end
