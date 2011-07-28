//
//  XMLToObjectParser.m
//  XMLparser
//
//  Created by Jérôme Kraft on 28/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XMLToObjectParser.h"

@implementation XMLToObjectParser

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSArray *)items
{
	return items;
}

- (id)parseXMLAtURL:(NSURL *)url 
		   toObject:(NSString *)aClassName 
		 parseError:(NSError **)error
{
        //[items release];
	items = [[NSMutableArray alloc] init];
	className = aClassName;
	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
	[parser parse];
    
	if([parser parserError] && error) {
		*error = [parser parserError];
	}
        //[parser release];
	return self;
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
	attributes:(NSDictionary *)attributeDict
{
	NSLog(@"Open tag: %@", elementName);
	if([elementName isEqualToString:className]) {
            // create an instance of a class on run-time  
		item = [[NSClassFromString(className) alloc] init];
	}
	else {
		currentNodeName = [elementName copy];
		currentNodeContent = [[NSMutableString alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
	NSLog(@"Close tag: %@", elementName);	
	if([elementName isEqualToString:className]) {
		[items addObject:item];		
            //[item release];
		item = nil;
	}
	else if([elementName isEqualToString:currentNodeName]) {
            // use key-value coding     
		[item setValue:currentNodeContent forKey:elementName];
        
            //[currentNodeContent release];
		currentNodeContent = nil;
        
            //[currentNodeName release];
		currentNodeName = nil;
	}
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string
{   
	[currentNodeContent appendString:string];
}

- (void)dealloc
{
        //[items release];
        //[super dealloc];
}

@end
