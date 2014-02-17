//
//  MACTextField.m
//  MACTextField
//
//  Created by Madson on 2/17/14.
//  Copyright (c) 2014 Madson Mac. All rights reserved.
//

#import "MACTextField.h"

#define ANIMATION_DURATION 0.2f
#define LABEL_FRAME CGRectMake(0.1, 2.0, self.frame.size.width, 20.0)
#define TEXT_COLOR [UIColor lightGrayColor]
#define FONT_SIZE 13

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
}

- (void)textFieldTextDidChange:(NSNotification *)notification
{
    UITextField *tf = (UITextField *)notification.object;
    
    if ([tf.text isEqualToString:[NSString string]])
    {
        [_upperLabel removeFromSuperview];
        tf.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    }
    else
    {
        tf.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
        [tf layoutIfNeeded];
        
        if (_topPlaceholderText == nil)
        {
            self.topPlaceholderText = tf.placeholder;
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

@end
