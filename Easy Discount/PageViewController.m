//
//  PageViewController.m
//  Easy Discount
//
//  Created by Salvador Guerrero on 5/23/12.
//  Copyright (c) 2012 ByteApps. All rights reserved.
//

#import "PageViewController.h"
#import "EasyDiscountViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:2];
    
    EasyDiscountViewController *percentView = [self.storyboard instantiateViewControllerWithIdentifier:@"discount view"];
    
    [controllers addObject:percentView];
    [controllers addObject:percentView.copy];
    
    [self setViewControllers:controllers direction:UIPageViewControllerNavigationOrientationHorizontal animated:YES completion:^(BOOL finished) {
        //
    }];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
