//
//  ViewController.h
//  test
//
//  Created by Jérôme Kraft on 18/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface ViewController : UIViewController <CPTPieChartDataSource> 
{
    NSMutableArray *dataForPlot;
    CPTXYGraph *graph;
}

@property(readwrite, retain, nonatomic) NSMutableArray *dataForPlot;

@end
