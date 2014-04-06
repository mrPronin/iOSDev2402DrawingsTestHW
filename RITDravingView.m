//
//  RITDravingView.m
//  2401DrawingsTestHW
//
//  Created by Pronin Alexander on 05.04.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITDravingView.h"

@implementation RITDravingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
    NSLog(@"Rect: %@", NSStringFromCGRect(rect));
    NSLog(@"Bounds: %@", NSStringFromCGRect(self.bounds));
    NSLog(@"Frame: %@", NSStringFromCGRect(self.frame));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // the number of star vertices
    NSUInteger n = 5;
    
    // the number of vertices, which counted for drawing hand
    NSUInteger k = 2;
    
    // the cener of star
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    
    // the radius of star and circles
    NSUInteger radius = 200;
    NSUInteger circleRadius = 50;
    
    // the first vertice angle 90 degrees
    CGFloat f = 3*M_PI/2;
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    NSLog(@"Center point: %@", NSStringFromCGPoint(center));
    
    NSMutableArray *points = [NSMutableArray array];
    
    // draw the star
    CGPoint firstPoint = CGPointMake(center.x, center.y - radius);
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    CGPoint point;
    NSLog(@"Points for star:");
    for (int i = 0; i <= n - 1; i++) {
        
        point.x = center.x + radius*cos(2*M_PI/n*(k*i) + f);
        point.y = center.y + radius*sin(2*M_PI/n*(k*i) + f);
        [points addObject:[NSValue valueWithCGPoint:point]];
        
        CGContextAddLineToPoint(context, point.x, point.y);
        
        NSLog(@"%d: %@", i, NSStringFromCGPoint(point));
    }
    CGContextAddLineToPoint(context, firstPoint.x, firstPoint.y);
    
    // draw the circles
    for (int i = 0; i <= n - 1; i++) {
        point = [points[i] CGPointValue];
        CGContextMoveToPoint(context, point.x + circleRadius, point.y);
        CGContextAddArc(context, point.x, point.y, circleRadius, 0, 2*M_PI, 0);
    }
    
    // draw the polygon
    NSLog(@"Points for polygon:");
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    for (int i = 1; i <= n - 1; i++) {
        
        point.x = center.x + radius*cos(2*M_PI/n*(i) + f);
        point.y = center.y + radius*sin(2*M_PI/n*(i) + f);
        CGContextAddLineToPoint(context, point.x, point.y);
        
        NSLog(@"%d: %@", i, NSStringFromCGPoint(point));
    }
    CGContextAddLineToPoint(context, firstPoint.x, firstPoint.y);
    
    CGContextStrokePath(context);
    
    /*
    CGRect square01 = CGRectMake(center.x, center.y, 100, 100);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextAddRect(context, square01);
    CGContextStrokePath(context);
    */
     
    /*
    CGRect square01 = CGRectMake(100, 100, 100, 100);
    CGRect square02 = CGRectMake(200, 200, 100, 100);
    CGRect square03 = CGRectMake(300, 300, 100, 100);
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextAddRect(context, square01);
    CGContextAddRect(context, square02);
    CGContextAddRect(context, square03);
    
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    
    CGContextAddEllipseInRect(context, square01);
    CGContextAddEllipseInRect(context, square02);
    CGContextAddEllipseInRect(context, square03);
    
    CGContextFillPath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextSetLineWidth(context, 1.f);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextMoveToPoint(context, CGRectGetMinX(square01), CGRectGetMaxY(square01));
    CGContextAddLineToPoint(context, CGRectGetMinX(square03), CGRectGetMaxY(square03));
    
    CGContextMoveToPoint(context, CGRectGetMaxX(square03), CGRectGetMinY(square03));
    CGContextAddLineToPoint(context, CGRectGetMaxX(square01), CGRectGetMinY(square01));
    
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    CGContextMoveToPoint(context, CGRectGetMinX(square01), CGRectGetMaxY(square01));
    CGContextAddArc(context, CGRectGetMaxX(square01), CGRectGetMaxY(square01), CGRectGetWidth(square01), M_PI, 0, YES);
    
    CGContextMoveToPoint(context, CGRectGetMaxX(square03), CGRectGetMinY(square03));
    CGContextAddArc(context, CGRectGetMinX(square03), CGRectGetMinY(square03), CGRectGetWidth(square03), 0, 3 * M_PI, YES);
    
    CGContextStrokePath(context);
    */

}


@end
