//
//  MACTextField.h
//  MACTextField
//
//  Created by Madson on 2/17/14.
//  Copyright (c) 2014 Madson Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MACTextField : UITextField

@property (nonatomic, strong) UILabel * upperLabel;
@property (nonatomic, strong) UIColor * placeholderTextColor;
@property (nonatomic, strong) NSString * topPlaceholderText;
@property (nonatomic, strong) UIColor * topPlaceholderTextColor;

@end
