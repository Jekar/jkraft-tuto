//
//  XMLToObjectParser.h
//  XMLparser
//
//  Created by Jérôme Kraft on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLToObjectParser : NSObject <NSXMLParserDelegate> {
    NSString *className;
	NSMutableArray *items;
	NSObject *item; // stands for any class    
	NSString *currentNodeName;
	NSMutableString *currentNodeContent;
}

- (NSArray *)items;
- (id)parseXMLAtURL:(NSURL *)url 
		   toObject:(NSString *)aClassName 
		 parseError:(NSError **)error;

@end
