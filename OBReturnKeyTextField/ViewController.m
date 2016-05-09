//
//  ViewController.m
//  OBReturnKeyTextField
//
//  Created by CodeInteractive on 10/19/15.
//  Copyright © 2015 CodeInteractiveApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initiating a condition for showing the ReturnKey:
    [self.textField assignConditionForActionButton:^BOOL(NSString *string) {
        return [string isEqualToString:@"stop"];
    }];
    
    //setting the UIReturnKey type:
    self.textField.onValidationReturnKeyType = UIReturnKeyGo;
    
    //setting the way validation will work (auto or when button pressed):
    self.textField.onValidationAction =  OnValidationAction_Non;
    
    //setting text coloe when validation/condition is fulfilled:
    self.textField.onValidationTextColor = [UIColor redColor];
}


#pragma mark - UITextField Delegate:
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    //set Action when button is "UIReturnKeyGo"
    if (textField.returnKeyType == UIReturnKeyGo) {
        
    }
    
    //set Action when button is "UIReturnKeyDefault"
    if (textField.returnKeyType == UIReturnKeyDefault) {
        
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
