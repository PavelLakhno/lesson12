//
//  PLAppDelegate.m
//  Blocks
//
//  Created by Pavel on 30/06/2016.
//  Copyright (c) 2016 Pavel Lakhno. All rights reserved.
//

#import "PLAppDelegate.h"
#import "PLStudent.h"
#import "PLPatient.h"

typedef void (^PLPatientBlock)(PLPatient *);
typedef NSString* (^PLPatientBlock2)(PLPatient *);

@implementation PLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    void (^testBlock) (void);
    
    testBlock = ^{
        NSLog(@"testBlock");
    };
    
    testBlock();
    ////////////////////////Blosk1////////////
    void (^testBlock2) (NSString*, NSString*);
    
    testBlock2 = ^(NSString* string, NSString* string2){
        NSLog(@"it's my new testBlock: %@ , %@", string, string2);
    };
    
    testBlock2(@"string1", @"string2");
    ////////////////////////Blosk2//////////////
        
    [self methodCallsTestBlock3:^{
        NSLog(@"Blocks!!!!!");
    }];
    ////////////////////////Blosk3//////////////
    
    
    PLStudent* student1 = [[PLStudent alloc]init];
    PLStudent* student2 = [[PLStudent alloc]init];
    PLStudent* student3 = [[PLStudent alloc]init];
    PLStudent* student4 = [[PLStudent alloc]init];
    PLStudent* student5 = [[PLStudent alloc]init];
    PLStudent* student6 = [[PLStudent alloc]init];
    PLStudent* student7 = [[PLStudent alloc]init];
    PLStudent* student8 = [[PLStudent alloc]init];
    PLStudent* student9 = [[PLStudent alloc]init];
    PLStudent* student10 = [[PLStudent alloc]init];
    
    student1.name = @"Pavel";
    student2.name = @"Ivan";
    student3.name = @"Igor";
    student4.name = @"Adolf";
    student5.name = @"Lord";
    student6.name = @"Ios";
    student7.name = @"Petr1";
    student8.name = @"Nick";
    student9.name = @"Iodine";
    student10.name = @"NoName";
    
    student1.lastName = student3.lastName = student4.lastName = @"Ivanov";
    student2.lastName = student5.lastName = @"Petrov";
    student6.lastName = @"Ian";
    student7.lastName = @"Minsk";
    student8.lastName = @"Mor";
    student9.lastName = @"Neapol";
    student10.lastName = @"Oppapap";
    
    NSArray* array = [[NSArray alloc] initWithObjects:student1,
                      student2, student3, student4, student5,
                      student6, student7, student8, student9, student10, nil];
    
       
    
    array = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        if  ([[obj1 lastName] isEqualToString: [obj2 lastName]] ){
            return [[obj1 name] compare:[obj2 name]];
        }
        else return [[obj1 lastName] compare: [obj2 lastName]];
    }];

    for (PLStudent* obj in array){
        NSLog(@"name = %@, lastname = %@", obj.name, obj.lastName);
    }
    
    //////////////////////////////////////
    
    PLPatient *patient1 = [[PLPatient alloc] init];
    patient1.firstName = @"Alex";
    patient1.lastName = @"Ivanov";
    patient1.temperature = 37.2f;
    
    PLPatient *patient2 = [[PLPatient alloc] init];
    patient2.firstName = @"Nick";
    patient2.lastName = @"Petrov";
    patient2.temperature = 40.1f;
    
    
    PLPatientBlock patientBlock = ^(PLPatient *anyPatient) {
        
        if (anyPatient.temperature > 36.6f && anyPatient.temperature <= 38.1f) {
            [anyPatient takePill];
        } else if (anyPatient.temperature > 38.1f) [anyPatient makeShot];
    };
    
    [patient1 patientFeelBad:patientBlock];
    [patient2 patientFeelBad:patientBlock];
    
    PLPatientBlock2 patientBlock2 = ^(PLPatient *patient) {
      
        if (patient.temperature > 36.6f && patient.temperature <= 38.1f) {
            [patient takePill];
            
            return [NSString stringWithFormat:@"You are drink a pill"];
        } else if (patient.temperature > 38.1f) {
            [patient makeShot];
            return [NSString stringWithFormat:@"You make shot"];
        }        
        return [NSString stringWithFormat:@"You are healthy"];
    };
    
    PLPatient *patient3 = [[PLPatient alloc] initWithBlock:patientBlock2];
    patient3.firstName = @"Egor";
    
    PLPatient *patient4 = [[PLPatient alloc] initWithBlock:patientBlock2];
    patient4.firstName = @"Anrew";
    
    PLPatient *patient5= [[PLPatient alloc] initWithBlock:patientBlock2];
    patient5.firstName = @"NoName";
    
    return YES;
}

- (void) methodCallsTestBlock3:(void(^)(void)) testBlock3 {
    NSLog(@"test block methods!!!");
    testBlock3();
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
