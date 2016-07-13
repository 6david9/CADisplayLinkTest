//
//  ViewController.m
//  CADisplayLinkTest
//
//  Created by ly on 7/13/16.
//  Copyright © 2016 ly. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CADisplayLink *displayLink;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	_displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(refreshContent:)];
	[_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

	_displayLink.frameInterval = 2;
}

- (void)refreshContent:(CADisplayLink *)displayLink
{
	static NSTimeInterval prevTime = 0.0;
	NSTimeInterval currTime  = CACurrentMediaTime();
	printf("duration: %f, displaylink duration: %f, diff duration: %f, diff timestamp: %f, frameInterval: %ld\n",
		   currTime - prevTime,
		   displayLink.duration,
		   currTime - prevTime - displayLink.duration,
		   currTime - displayLink.timestamp,
		   (long)displayLink.frameInterval
		   );

	printf("factor: %ld, %f\n", (long)displayLink.frameInterval, (currTime - prevTime) / displayLink.duration);

	prevTime = currTime;
}

@end
