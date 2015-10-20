//
//  OBReturnKeyTextField.h
//  OBReturnKeyTextField
//
//  Created by CodeInteractive on 10/18/15.
//  Copyright © 2015 OB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, OnValidationActionType) {
    OnValidationAction_non,
    OnValidationAction_DismissWithDelegate
};

@interface OBReturnKeyTextField : UITextField

@property(nonatomic, assign)OnValidationActionType onValidationAction;
@property(nonatomic, assign)UIReturnKeyType onValidationReturnKeyType;
@property(nonatomic, strong)UIColor *onValidationTextColor;

- (void)assignConditionForActionButton:(BOOL (^)(NSString *string))conditionBlock;

@end
