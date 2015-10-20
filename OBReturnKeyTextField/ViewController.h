//
//  ViewController.h
//  OBReturnKeyTextField
//
//  Created by CodeInteractive on 10/19/15.
//  Copyright © 2015 CodeInteractiveApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBReturnKeyTextField.h"
@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet OBReturnKeyTextField *textField;

@end

