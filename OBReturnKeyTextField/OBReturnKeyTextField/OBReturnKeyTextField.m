//
//  OBReturnKeyTextField.m
//  OBReturnKeyTextField
//
//  Created by CodeInteractive on 10/18/15.
//  Copyright © 2015 OB. All rights reserved.
//

#import "OBReturnKeyTextField.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACEXTScope.h"

@interface OBReturnKeyTextField()
@property (strong, nonatomic) NSString *searchText;
@property (nonatomic, copy) BOOL (^condition)(NSString *str);
@property (assign, nonatomic)UIReturnKeyType currentReturnKeyType;
@property(strong,nonatomic)UIColor *currentTextColor;

@end


@implementation OBReturnKeyTextField

-(void)awakeFromNib{
    [super awakeFromNib];
    [self textCheckerWithRAC];
    self.currentReturnKeyType = self.returnKeyType;
    self.currentTextColor = self.textColor;
}


-(void)textCheckerWithRAC{
     RAC(self, searchText) = self.rac_textSignal;
    
    @weakify(self);
    [[[RACObserve(self, searchText) map:^id(NSString *text) {
        return   self.condition?@(self.condition(text)):@0;
        
    }] distinctUntilChanged]subscribeNext:^(id x) {
        @strongify(self);
        if ([x isEqual:@1]) {
            
            self.returnKeyType = self.onValidationReturnKeyType?:self.currentReturnKeyType;
            self.textColor = self.onValidationTextColor?:self.currentTextColor;
             if (self.onValidationAction == OnValidationAction_DismissWithDelegate) {
                [self.delegate textFieldShouldReturn:self];
                [self resignFirstResponder];
            }else {
                [self resignFirstResponder];
                [self becomeFirstResponder];
            }
            
        }else{
            self.returnKeyType = self.currentReturnKeyType;
            self.textColor = self.currentTextColor;
            [self resignFirstResponder];
            [self becomeFirstResponder];
        }
    }];

}

- (void)assignConditionForActionButton:(BOOL (^)(NSString *string))conditionBlock {
    self.condition = conditionBlock;
}


@end
