# OBReturnKeyTextField
A subclass of UITextfield using Reactive Cocoa with a dynamic UIReturnKey button, set according to text validation/condition.





Usage:

- Make sure you include ReactiveCocoa in your project (https://github.com/ReactiveCocoa/ReactiveCocoa) 
  CocoPods:  pod 'ReactiveCocoa'. If you running the host project , don't forget to initiate 'pod install'.

- Copy OBReturnKeyTextField.h/OBReturnKeyTextField.m into your project.

- If using Storyboard/Xib, make sure to indicate 'OBReturnKeyTextField' as the class of textfield.
  Then you can use it as an IBOutlet. Connect the textfield to the UITextFieldDelegate or just set it in code.

- Import OBReturnKeyTextField:  #import "OBReturnKeyTextField.h"

- Set the condition for when to show the return key (BOOL):
      [self.textField assignConditionForActionButton:^BOOL(NSString *string) {
            return [string isEqualToString:@"stop"];
       }]; 

- specify which type of UIReturnKey the keyboard will show when the text condition is fulfilled:
      self.textField.onValidationReturnKeyType = UIReturnKeyGo;

- optional: set action type for when the text condition is fulfilled:
      self.textField.onValidationAction =   
        OnValidationAction_DismissWithDelegate / OnValidationAction_non

OnValidationAction_non: Default behavior - will dismiss the keyboard when the UIReturnKey press, and fire 'textFieldShouldReturn:' UITextfield Delegate (with the chosen UIReturnKey type).

OnValidationAction_DismissWithDelegate - will automatically dismiss the keyboard when text condition is fulfilled, and fire the delegate with the chosen UIReturnKey type. 
             
- optional: set the desired textColor for when text condition is fulfilled:
             self.textField.onValidationTextColor = [UIColor redColor];

- use the delegate: - (BOOL)textFieldShouldReturn:(UITextField *)textField 
  for preforming a desired action when text condition is fulfilled:
  
if (textField.returnKeyType == UIReturnKeyGo) {
      //some Action for "GoButton"
  }
 
if (textField.returnKeyType == UIReturnKeyDefault) {
     //some Action for "DefaultButton"
  }

etc..



