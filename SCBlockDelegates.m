//
//  SCBlockDelegates.m
//
//  Created by Ahmed Hilali on 28/11/13.
//  Copyright (c) 2013-2015 Ahmed Hilali. All rights reserved.
//

#import "SCBlockDelegates.h"

@implementation SCAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    alertViewBlock(alertView, buttonIndex);
}

-(id)initWithBlock: (AlertViewBlock)block
{
    self = [super init];
    if (self) {
        alertViewBlock = block;
    }
    return self;
}
@end

@implementation SCGestureDelegate
-(void)onGesture: (UIGestureRecognizer*)recognizer
{
    UIGestureRecognizerState checkForState;
    
    // If long press, check for ended state.
    if([recognizer isKindOfClass: [UILongPressGestureRecognizer class]]) {
        checkForState = UIGestureRecognizerStateEnded;
    } else if([recognizer isKindOfClass: [UITapGestureRecognizer class]]) {
        checkForState = UIGestureRecognizerStateBegan;
    }
   
    if(recognizer.state == checkForState)
        gestureBlock(recognizer);
}

-(id)initWithBlock: (GestureBlock)block
{
    self = [super init];
    if (self) {
        gestureBlock = block;
    }
    return self;
}

// This fixes issues with scrollviews.
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end

@implementation SCTextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // Calculate the new string.
    NSString* actualString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return textEnteredBlock(textField, actualString);
}

-(id)initWithBlock: (TextEnteredBlock)block
{
    self = [super init];
    if (self) {
        textEnteredBlock = block;
    }
    return self;
}
@end