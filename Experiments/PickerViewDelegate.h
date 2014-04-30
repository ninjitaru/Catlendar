//
//  PickerViewDelegate.h
//  Monny
//
//  Created by Jason Chang on 3/8/13.
//  Copyright (c) 2013 Greamer. All rights reserved.
//

#ifndef Monny_PickerViewDelegate_h
#define Monny_PickerViewDelegate_h

@protocol PickerViewDelegate <NSObject>

@property (assign) id delegate;

- (void) reset;
- (void) setValue: (id) value;

@end


#endif
