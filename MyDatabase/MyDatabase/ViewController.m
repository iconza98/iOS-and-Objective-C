//
//  ViewController.m
//  MyDatabase
//
//  Created by Ikani Samani on 3/22/14.
//  Copyright (c) 2014 Ikani Samani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// For every property in the .h file need to have @synthesize for it
@synthesize theName, theAddress, thePhone, theStatus, databasepath, contactDB;

// create database in the viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    databasepath = [[NSString alloc]
                     initWithString: [docsDir
                                      stringByAppendingPathComponent:@"contacts.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasepath ] == NO)
    {
        const char *dbpath = [databasepath UTF8String];
        
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)";
            
            if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg)!= SQLITE_OK)
            {
                theStatus.text = @"Failed to create table";
            }
            sqlite3_close(contactDB);
            } else {
                theStatus.text = @"Failed to open/create database";
            }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)savaData:(id)sender {
    sqlite3_stmt * statement;
    const char * dbpath = [databasepath UTF8String];
    
    // insert values into database
    if(sqlite3_open(dbpath, &contactDB) == SQLITE_OK){
        NSString * insertSQL = [NSString stringWithFormat:@"INSERT INTO CONTACTS(name, address, phone) VALUES (\"%@\",\"%@\",\"%@\")", self.theName.text, self.theAddress.text, self.thePhone.text];
        
        const char * insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(contactDB, insert_stmt, -1, &statement, NULL);
        
        // check to see statment executed
        if (sqlite3_step(statement)== SQLITE_DONE) {
            self.theStatus.text = @"Contact added";
            self.theName.text = @"";
            self.theAddress.text = @"";
            self.thePhone.text = @"";
        } else{
            self.theStatus.text = @"Failed to add contact";
        }
        sqlite3_finalize(statement);
        sqlite3_close(contactDB);
    }
    
}

- (IBAction)findContact:(id)sender {
    
    const char *dbpath = [databasepath UTF8String];
    sqlite3_stmt * statement;
    
    if(sqlite3_open(dbpath, &contactDB) == SQLITE_OK){
        NSString * querySQL = [NSString stringWithFormat:@"SELECT address, phone FROM contacts WHERE name=\"%@\"", theName.text];
        
        const char * query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            if (sqlite3_step(statement) == SQLITE_ROW) {
                NSString * addressField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                theAddress.text = addressField;
                NSString * phoneField = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 1)];
                thePhone.text = phoneField;
                theStatus.text = @"Match Found";
            }else {
                theStatus.text = @"Match Not Found";
                theAddress.text = @"";
                thePhone.text = @"";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
    
    
}

- (IBAction)finished:(id)sender {
    [sender resignFirstResponder];
}
@end


