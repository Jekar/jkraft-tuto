//
//  Contact.h
//  XMLparser
//
//  Created by Jérôme Kraft on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject {
    NSString *prenom;
	NSString *nom;
	NSString *tel;
	NSString *email;
}

@property (nonatomic, retain) NSString *prenom;
@property (nonatomic, retain) NSString *nom;
@property (nonatomic, retain) NSString *tel;
@property (nonatomic, retain) NSString *email;

@end
