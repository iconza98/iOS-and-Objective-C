//
//  ViewController.m
//  Converter 6.1
//
//  Created by Ikani Samani on 12/24/13.
//  Copyright (c) 2013 Ikani Samani. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

@synthesize input, cLabel, fLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertC:(id)sender {
    NSString *toCelsius = [input text];
    
    double c =( 5.0/9.0) * ([toCelsius doubleValue] - 32.0);
    
    cLabel.text = [[NSString alloc] initWithFormat:@"%2.0f", c];
    
}

- (IBAction)convertF:(id)sender {
    NSString *toFahrenheit = [input text];
    
    double f = (9.0/5.0 * [toFahrenheit doubleValue]) + 32.0;
    
    fLabel.text = [[NSString alloc] initWithFormat: @"%2.0f", f];
}
@end
