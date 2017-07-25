//
//  PLPatient.m
//  Blocks
//
//  Created by Павел Лахно on 24.07.17.
//  Copyright © 2017 Pavel Lakhno. All rights reserved.
//

#import "PLPatient.h"

@implementation PLPatient

-(id)initWithBlock:(NSString * (^)(PLPatient *)) patientBlock
{
    self = [super init];
    if (self) {
        NSInteger delay = arc4random()%5+10;
        [self performSelector:@selector(patientFeelWorst:) withObject:patientBlock afterDelay:delay];
    }
    return self;
}

- (void) patientFeelWorst:(NSString*(^)(PLPatient*)) patientBlock {
    
    self.temperature = ((arc4random()%35)+366)/10.f;
    NSLog(@"%@ \n", patientBlock(self));
    
}

- (void) patientFeelBad:(void (^)(PLPatient*)) patientBlock2 {
    
    NSLog(@"Patient %@ %@ have a temperature: %1.1f", self.firstName, self.lastName, self.temperature);
    patientBlock2(self);
    
}

- (void) takePill {
    
    NSLog(@"Patient %@ drink a pill", self.firstName);
    
}
- (void) makeShot {
    
    NSLog(@"Patient %@ make shot", self.firstName);
    
}


@end
