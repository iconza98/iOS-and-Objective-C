//
//  ViewController.h
//  Calculator
//
//  Created by Ikani Samani on 3/15/14.
//  Copyright (c) 2014 Ikani Samani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    int operator;
    NSString * previous;
    NSString * current;
}
-(void) doEquals;

@property (weak, nonatomic) IBOutlet UILabel *theTotal;
@property (weak, nonatomic) IBOutlet UILabel *signature;

- (IBAction)numButtons:(UIButton *)sender;
- (IBAction)opButton:(UIButton *)sender;
- (IBAction)decimalButton:(UIButton *)sender;
- (IBAction)clrButton:(UIButton *)sender;
- (IBAction)eqButton:(UIButton *)sender;


@end
