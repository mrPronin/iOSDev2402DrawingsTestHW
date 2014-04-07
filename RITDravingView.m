//
//  RITDravingView.m
//  2402DrawingsTestHW
//
//  Created by Pronin Alexander on 07.04.14.
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
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (int i = 0; i < 5; i++) {
        [self drawStar:context andRect:rect];
    }
    
}

#pragma mark - Methods

- (UIColor*) randomColor {
    
    CGFloat r = (float)(arc4random() % 256) / 255.f;
    CGFloat g = (float)(arc4random() % 256) / 255.f;
    CGFloat b = (float)(arc4random() % 256) / 255.f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

- (void) drawStar:(CGContextRef) ctx andRect:(CGRect) rect {
    
    // the number of star vertices
    NSUInteger n = 5;
    
    // the number of vertices, which counted for drawing hand
    NSUInteger k = 2;
    
    // the radius of star and circles
    NSUInteger radius = 50 + arc4random()%51;
    NSUInteger circleRadius = 10 + arc4random()%11;
    
    // the cener of star
    CGPoint center;
    center.x = arc4random()%((NSUInteger)CGRectGetWidth(rect) - 2*radius - 2*circleRadius) + radius + circleRadius;
    center.y = arc4random()%((NSUInteger)CGRectGetHeight(rect) - 2*radius - 2*circleRadius) + radius + circleRadius;
    
    // the first vertice angle 90 degrees
    CGFloat f = 3*M_PI/2;
    
    NSMutableArray *points = [NSMutableArray array];
    
    // draw the star
    CGContextSetFillColorWithColor(ctx, [self randomColor].CGColor);
    CGPoint firstPoint = CGPointMake(center.x, center.y - radius);
    CGContextMoveToPoint(ctx, firstPoint.x, firstPoint.y);
    CGPoint point;
    for (int i = 0; i <= n - 1; i++) {
        
        point.x = center.x + radius*cos(2*M_PI/n*(k*i) + f);
        point.y = center.y + radius*sin(2*M_PI/n*(k*i) + f);
        [points addObject:[NSValue valueWithCGPoint:point]];
        
        CGContextAddLineToPoint(ctx, point.x, point.y);
    }
    CGContextAddLineToPoint(ctx, firstPoint.x, firstPoint.y);
    
    CGContextFillPath(ctx);
    
    // draw the circles
    CGContextSetFillColorWithColor(ctx, [self randomColor].CGColor);
    for (int i = 0; i <= n - 1; i++) {
        point = [points[i] CGPointValue];
        CGContextMoveToPoint(ctx, point.x + circleRadius, point.y);
        CGContextAddArc(ctx, point.x, point.y, circleRadius, 0, 2*M_PI, 0);
    }
    
    CGContextFillPath(ctx);
    
    // draw the polygon
    CGContextSetStrokeColorWithColor(ctx, [self randomColor].CGColor);
    CGContextSetLineWidth(ctx, 4);
    CGContextMoveToPoint(ctx, firstPoint.x, firstPoint.y);
    for (int i = 1; i <= n - 1; i++) {
        
        point.x = center.x + radius*cos(2*M_PI/n*(i) + f);
        point.y = center.y + radius*sin(2*M_PI/n*(i) + f);
        CGContextAddLineToPoint(ctx, point.x, point.y);
    }
    CGContextAddLineToPoint(ctx, firstPoint.x, firstPoint.y);
    
    CGContextStrokePath(ctx);
    
}

@end
