//
//  CLTextInputTableViewCell.m
//  Catlendar
//
//  Created by Jason Chang on 5/4/14.
//  Copyright (c) 2014 Greamer. All rights reserved.
//

#import "CLTextInputTableViewCell.h"

@interface CLTextInputTableViewCell () <UITextFieldDelegate>
@property (nonatomic,strong) IBOutlet UITextField *textField;
@property (nonatomic,strong) IBOutlet UITextView *textView;
@property (nonatomic,strong) NSString *itemKey;
@end

@implementation CLTextInputTableViewCell

- (void) configWithText:(NSString *)text placeholder:(NSString *)placeholder itemKey:(NSString *)itemKey asTextView:(BOOL)useTextView {
    self.itemKey = itemKey;
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
        CGRect frame = CGRectOffset(self.contentView.bounds, 20, 0);
        frame.size.width = CGRectGetWidth(self.contentView.bounds)-20;
        _textField.frame = frame;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.delegate = self;
    }
    return _textField;
}

- (UITextView *) textView {
    if(!_textView) {
        _textView = [UITextView new];
        CGRect frame = CGRectOffset(self.contentView.bounds, 20, 0);
        frame.size.width = CGRectGetWidth(self.contentView.bounds)-20;
        _textView.frame = frame;
    }
    return _textView;
}

#pragma mark - textfield delegate 

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if([self.delegate respondsToSelector:@selector(textInputCell:withItemKey:textValueChanged:)]) {
        [self.delegate textInputCell: self withItemKey: self.itemKey textValueChanged:textField.text];
    }
}

@end
