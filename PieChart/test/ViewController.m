//
//  ViewController.m
//  test
//
//  Created by Jérôme Kraft on 18/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize dataForPlot;


-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    return [dataForPlot count];
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index  {
    return [dataForPlot objectAtIndex:index];
}

//affiche les valeurs a cote de chaque part
-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot recordIndex:(NSUInteger)index
{
    static CPTMutableTextStyle *whiteText = nil;
    
    if ( !whiteText ) {
        whiteText = [[CPTMutableTextStyle alloc] init];
        whiteText.color = [CPTColor whiteColor];
    }
    
    CPTTextLayer *newLayer = [[[CPTTextLayer alloc] initWithText:[NSString stringWithFormat:@"%3.0f", [[dataForPlot objectAtIndex:index] floatValue]]
                                                           style:whiteText] autorelease];
    return newLayer;
}

//permet d afficher la legende et la couleur
-(NSString *)legendTitleForPieChart:(CPTPieChart *)pieChart
                        recordIndex:(NSUInteger)index{
    NSLog(@"LegendTitleForPieChart");
    return [NSString stringWithFormat:@"Ma légende", index];        
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Données de test
	NSMutableArray *contentArray = [NSMutableArray arrayWithCapacity:30];
		    
    contentArray=  [NSMutableArray arrayWithObjects:[NSNumber numberWithDouble:90.0], 
                    [NSNumber numberWithDouble:20.0],
                    [NSNumber numberWithDouble:30.0],
                    [NSNumber numberWithDouble:40.0],
                    [NSNumber numberWithDouble:50.0], [NSNumber numberWithDouble:60.0], nil];
    self.dataForPlot = contentArray;
    
    // Creation graphique
    graph = [[CPTXYGraph alloc] initWithFrame:self.view.bounds];
     UIView * hostingView = self.view;
    //On cache abscisse et ordonnee
    graph.axisSet = nil;
    
    CPTGraphHostingView *graphHostingView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(0, 0, 300, 450)];
    graphHostingView.collapsesLayers = NO;
    [hostingView addSubview:graphHostingView];
    graphHostingView.hostedGraph = graph;
        
    //creation du graphique en camembert
    CPTPieChart *pieChart = [[CPTPieChart alloc] init];
    pieChart.dataSource = self;
    pieChart.pieRadius = 100.0;
    pieChart.identifier = @"PieChart1";
    pieChart.startAngle = M_PI_4;
    pieChart.sliceDirection = CPTPieDirectionCounterClockwise;
    
    [graph addPlot:pieChart];
    //ajout de la legende
    CPTLegend *theLegend = [CPTLegend legendWithGraph:graph];
    theLegend.numberOfColumns = 1;
    theLegend.fill = [CPTFill fillWithColor:[CPTColor whiteColor]];
    theLegend.borderLineStyle = [CPTLineStyle lineStyle];
    theLegend.cornerRadius = 5.0;
    graph.legend = theLegend;
    graph.legendAnchor = CPTRectAnchorRight;
    graph.legendDisplacement = CGPointMake(-10 - 10.0, 10.0);
    
    [pieChart release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
