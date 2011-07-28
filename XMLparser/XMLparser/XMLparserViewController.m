//
//  XMLparserViewController.m
//  XMLparser
//
//  Created by Jérôme Kraft on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XMLparserViewController.h"
#import "Contact.h"
#import "XMLToObjectParser.h"

@implementation XMLparserViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString: @"http://www.jkraft.fr/testXml.xml"];
	XMLToObjectParser *myParser = [[XMLToObjectParser alloc] 
                                   parseXMLAtURL:url toObject:@"Contact" parseError:nil];
    
	for(int i = 0; i < [[myParser items] count]; i++) {
		NSLog(@"Prénom: %@", [(Contact *)[[myParser items] objectAtIndex:i] prenom]);
	}
    
 
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
