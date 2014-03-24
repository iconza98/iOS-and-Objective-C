//
//  ViewController.h
//  MyDatabase
//
//  Created by Ikani Samani on 3/22/14.
//  Copyright (c) 2014 Ikani Samani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h> // adding sqlite3 library

@interface ViewController : UIViewController

// creating a property automatically creates getter and setters when using synthesize
// strong ment dont grabage collect me - weak would be grbaged collected after scope
// everything is nonatomic, in the old days there were other types that were atomic
@property(strong, nonatomic) NSString * databasepath;
@property(nonatomic) sqlite3 * contactDB;

@property (weak, nonatomic) IBOutlet UITextField *theName;
@property (weak, nonatomic) IBOutlet UITextField *theAddress;
@property (weak, nonatomic) IBOutlet UITextField *thePhone;
@property (weak, nonatomic) IBOutlet UILabel *theStatus;

// public return type is IBAction
// function is called saveData parmeter is and id or event
- (IBAction)savaData:(id)sender;
- (IBAction)findContact:(id)sender;
- (IBAction)finished:(id)sender;


@end
