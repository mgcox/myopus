//
//  gcLoginViewController.m
//  bizzi
//
//  Created by Garrett Cox on 4/21/14.
//  Copyright (c) 2014 Garrett Cox. All rights reserved.
//

#import "gcLoginViewController.h"
#import <Parse/Parse.h>

@interface gcLoginViewController ()

@end

@implementation gcLoginViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [self.navigationController.navigationBar setHidden:YES];
    
    

    
}

- (IBAction)login:(id)sender {
    
    
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
   
    
    if ([username length] == 0 || [password length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a username and password!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else {
        [PFUser logInWithUsernameInBackground:username password:password
                                        block:^(PFUser *user, NSError *error) {
                                            if (error) {
                                                //login Failed
                                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Uh oh!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                    [alertView show];
                                                
                                                
                                            
                                            } else {
                                                [self.navigationController popToRootViewControllerAnimated:YES];
                                                // The login failed. Check error to see why.
                                            }
                                        }];
    }
    
    
}



@end
