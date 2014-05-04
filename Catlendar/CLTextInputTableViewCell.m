//
//  CLTextInputTableViewCell.m
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "CLTextInputTableViewCell.h"

@interface CLTextInputTableViewCell ()
@property (nonatomic,strong) IBOutlet UITextField *textField;
@property (nonatomic,strong) IBOutlet UITextView *textView;
@end

@implementation CLTextInputTableViewCell

- (void) configWithText:(NSString *)text placeholder:(NSString *)placeholder asTextView:(BOOL)useTextView {
    if(useTextView) {
        [self.contentView addSubview: self.textView];
        self.textView.text = text;
    } else {
        [self.contentView addSubview: self.textField];
        self.textField.placeholder = placeholder;
        self.textField.text = text;
    }
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UITextField *) textField {
    if(!_textField) {
        _textField = [UITextField new];
        _textField.frame = CGRectOffset(self.contentView.bounds, 20, 0);
    }
    return _textField;
}

- (UITextView *) textView {
    if(!_textView) {
        _textView = [UITextView new];
        
        _textView.frame = CGRectOffset(self.contentView.bounds, 20, 0);
    }
    return _textView;
}

@end
