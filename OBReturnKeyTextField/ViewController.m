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
    
    [self.textField assignConditionForActionButton:^BOOL(NSString *string) {
        return [string isEqualToString:@"stop"];
    }];
    
    self.textField.onValidationReturnKeyType = UIReturnKeyGo;
    self.textField.onValidationAction =  OnValidationAction_non;
    self.textField.onValidationTextColor = [UIColor redColor];
}


#pragma mark - UITextField Delegate:
- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    if (textField.returnKeyType == UIReturnKeyGo) {
        //some Action for "GoButton"
    }
    if (textField.returnKeyType == UIReturnKeyDefault) {
        //some Action for "DefaultButton"
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
