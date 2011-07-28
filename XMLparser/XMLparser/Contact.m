//
//  Contact.m
//  XMLparser
//
//  Created by Jérôme Kraft on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@synthesize prenom;
@synthesize nom;
@synthesize tel;
@synthesize email;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
