//
//  MACViewController.m
//  MACTextField
//
//  Created by Madson on 2/17/14.
//  Copyright (c) 2014 Madson Mac. All rights reserved.
//

#import "MACViewController.h"
#import "MACTextField.h"

@interface MACViewController ()

@end

@implementation MACViewController

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

- (IBAction)doAction:(id)sender
{
    _textField.text = @"New text!";
}

@end
