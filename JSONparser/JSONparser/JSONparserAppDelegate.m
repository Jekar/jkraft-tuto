//
//  JSONparserAppDelegate.m
//  JSONparser
//
//  Created by Jérôme Kraft on 31/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "JSONparserAppDelegate.h"
#import "SBJson.h"

@implementation JSONparserAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
        // Creation du parser
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    
        // Construction de l'url à récupérer
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://twitter.com/statuses/public_timeline.json"]];
    
        // execution de la requête et récupération du JSON via un objet NSData
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
        // On récupère le JSON en NSString depuis la réponse
    NSString *json_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
        // on parse la reponse JSON
    NSArray *statuses = [parser objectWithString:json_string error:nil];
    
    for (NSDictionary *status in statuses)
    {
            // on peut recuperer les valeurs en utilisant objectForKey à partir du status qui est un NSDictionary
            // on log le tweet et le nom de l utilisateur
        NSLog(@"%@ - %@", [status objectForKey:@"text"], [[status objectForKey:@"user"] objectForKey:@"screen_name"]);
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
