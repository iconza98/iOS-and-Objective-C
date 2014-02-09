//
//  ViewController.h
//  Converter 6.1
//
//  Created by Ikani Samani on 12/24/13.
//  Copyright (c) 2013 Ikani Samani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *cLabel;
@property (weak, nonatomic) IBOutlet UILabel *fLabel;

@property (weak, nonatomic) IBOutlet UITextField *input;


- (IBAction)convertC:(id)sender;
- (IBAction)convertF:(id)sender;

@end
