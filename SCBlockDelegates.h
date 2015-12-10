//
//  SCBlockDelegates.h
//
//  Created by Ahmed Hilali on 28/11/13.
//  Copyright (c) 2013-2015 Ahmed Hilali. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
This is a set of classes that allow you to use blocks when working with the cocoa UI.
*/


// Alert View Block
typedef void (^AlertViewBlock)(UIAlertView*, NSInteger);
@interface SCAlertViewDelegate : NSObject <UIAlertViewDelegate>
{
    AlertViewBlock alertViewBlock;
}
-(id)initWithBlock: (AlertViewBlock)block;
@end

// Gesture Recognizer Block
typedef void (^GestureBlock)(UIGestureRecognizer*);
@interface SCGestureDelegate : NSObject<UIGestureRecognizerDelegate>
{
    GestureBlock gestureBlock;
}
-(void)onGesture: (UIGestureRecognizer*)recognizer;
-(id)initWithBlock: (GestureBlock)block;
@end

// Text Field Block
typedef BOOL (^TextEnteredBlock)(UITextField*, NSString*);
@interface SCTextFieldDelegate : NSObject<UITextFieldDelegate>
{
    TextEnteredBlock textEnteredBlock;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
-(id)initWithBlock: (TextEnteredBlock)block;
@end