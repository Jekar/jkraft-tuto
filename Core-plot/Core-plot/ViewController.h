//
//  ViewController.h
//  Core-plot
//
//  Created by Jérôme Kraft on 15/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface ViewController : UIViewController <CPTPlotDataSource>
{
    NSMutableArray *dataForPlot;
    CPTXYGraph *graph;
}

@property(readwrite, retain, nonatomic) NSMutableArray *dataForPlot;

@end
