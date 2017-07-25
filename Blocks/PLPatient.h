//
//  PLPatient.h
//  Blocks
//
//  Created by Павел Лахно on 24.07.17.
//  Copyright © 2017 Pavel Lakhno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PLPatient : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) CGFloat temperature;

-(id)initWithBlock:(NSString *(^)(PLPatient *)) patientBlock;

- (void) patientFeelBad:(void (^)(PLPatient *)) patientBlock;

- (void) takePill;
- (void) makeShot;

@end
