//
//  MACViewController.h
//  MACTextField
//
//  Created by Madson on 2/17/14.
//  Copyright (c) 2014 Madson Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MACTextField;

@interface MACViewController : UIViewController

@property (weak, nonatomic) IBOutlet MACTextField *textField;

- (IBAction)doAction:(id)sender;

@end
