//
//  MACTextField.m
//  MACTextField
//
//  Created by Madson on 2/17/14.
//  Copyright (c) 2014 Madson Mac. All rights reserved.
//

#import "MACTextField.h"

#define ANIMATION_DURATION 0.4f
#define LABEL_FRAME CGRectMake(0.1, 2.0, self.frame.size.width, 20.0)
#define TEXT_COLOR [UIColor lightGrayColor]
#define FONT_SIZE 12

@implementation MACTextField

- (void)awakeFromNib
{
    if (_placeholderTextColor)
    {
        [self setValue:_placeholderTextColor
            forKeyPath:@"_placeholderLabel.textColor"];
    }

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldTextDidChange:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self];
    
    if (self.text)
    {
        [self textFieldTextDidChange:nil];
    }
}

- (void)textFieldTextDidChange:(NSNotification *)sender
{
    if ([self.text isEqualToString:[NSString string]])
    {
        [_upperLabel removeFromSuperview];
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    }
    else
    {
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
        [self layoutIfNeeded];
        
        if (_topPlaceholderText == nil)
        {
            self.topPlaceholderText = self.placeholder;
        }
        
        if (_upperLabel == nil)
        {
            UILabel *label = [[UILabel alloc] initWithFrame:LABEL_FRAME];
            label.font = [UIFont systemFontOfSize:FONT_SIZE];
            label.textColor = _topPlaceholderTextColor ? _topPlaceholderTextColor : TEXT_COLOR;
            
            _upperLabel = label;
        }
        
        if (_upperLabel.superview == nil)
        {
            _upperLabel.text = _topPlaceholderText;
            _upperLabel.alpha = 0;
            
            [self addSubview:_upperLabel];
            
            [UIView animateWithDuration:ANIMATION_DURATION animations:^{
                _upperLabel.alpha = 1;
            }];
        }
    }
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self textFieldTextDidChange:nil];
}

-(void)setError:(BOOL)error {
    _error = error;
    
    if (self.validColor == nil) {
        self.validColor = self.textColor;
        
    }
    
    if (error) {
        self.textColor = self.errorColor;
        
    } else {
        self.textColor = self.validColor;
        
    }
    
}

@end
