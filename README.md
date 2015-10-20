# OBReturnKeyTextField
A subclass of UITextfield using Reactive Cocoa for dynamically presenting keyboard return key according to text validation/condition.




Usage:
- Make sure you include ReactiveCocoa in your project (https://github.com/ReactiveCocoa/ReactiveCocoa) 
  CocoPods:  pod 'ReactiveCocoa'.

- Copy OBReturnKeyTextField.h/OBReturnKeyTextField.m into your project.

- If using Storyboard/Xib, make sure to indicate 'OBReturnKeyTextField' as the class of textfield.
  Then you can use it as an IBOutlet. Connect the textfield to the UITextFieldDelegate or just set it in code.

- Import OBReturnKeyTextField:  #import "OBReturnKeyTextField.h"

- Include the condition (BOOL) for when to show the return key:
      [self.textField assignConditionForActionButton:^BOOL(NSString *string) {
            return [string isEqualToString:@"stop"];
       }]; 

- specify which type of return key the keyboard will show when the text condition is fulfilled:
      self.textField.onValidationReturnKeyType = UIReturnKeyGo;

- optional: set action type for when the text condition is fulfilled:
      self.textField.onValidationAction =   OnValidationAction_DismissWithDelegate / OnValidationAction_non

OnValidationAction_non: default behavior - will dismiss the keyboard when pressed, and fire 'textFieldShouldReturn:' 
with with the returnKey type.

OnValidationAction_DismissWithDelegate - automatically dismiss the keyboard when the text condition is fulfilled,
and fire the delegate with the returnKey type. 
             
- optional: set the desired textColor for when text condition is fulfilled:
             self.textField.onValidationTextColor = [UIColor redColor];

- use the delegate: - (BOOL)textFieldShouldReturn:(UITextField *)textField 
  for preforming the desired action when text condition is fulfilled:
  
if (textField.returnKeyType == UIReturnKeyGo) {
      //some Action for "GoButton"
  }
 
if (textField.returnKeyType == UIReturnKeyDefault) {
     //some Action for "DefaultButton"
  }

etc..



