//
//  Timeline.swift
//  Parse_twitter
//
//  Created by Edward Lucas on 12/25/14.
//  Copyright (c) 2014 TutorialFederation. All rights reserved.
//

import UIkit

class TimelineTableViewController: UITableViewController {
    
    
    /*difference between viewDidApper & viewDidLoad 
    viewDidAppear only load ONCE when app is opend */
    

    
    override func viewDidAppear(animated: Bool){
        //check if there is a user logged in
        if ((PFUser.currentUser()) == nil){
            /*set up alertcontroller to do the signup/lgoin  job */
            let alertController = UIAlertController(title: "Login", message: "please login", preferredStyle: .Alert)
            
            alertController.addTextFieldWithConfigurationHandler( { (textfield) -> Void in
                textfield.placeholder = "Your username"
                
            })
            
            alertController.addTextFieldWithConfigurationHandler({ (textfield) -> Void in
                textfield.placeholder = "Your password"
                textfield.secureTextEntry = true
            })
            
            
            
            /*sign in action*/
            alertController.addAction(UIAlertAction(title: "Login", style: .Default, handler: {
                action in
                //FROM textFieldS -> textField : must do the type convertion by this way or will give out error
                //textFields -> NSArray->objectAtIndex[n] -> UITextField
                let textField:NSArray = alertController.textFields! as NSArray
                let usernameTextfield:UITextField =  textField.objectAtIndex(0) as UITextField
                let passwordTextfield:UITextField = textField.objectAtIndex(1) as UITextField
                
                
                
                PFUser.logInWithUsernameInBackground(usernameTextfield.text!, password: passwordTextfield.text!) {
                    //this is the COMPLETION HANDLER written by ourself
                    (user:PFUser! ,error:NSError!)-> Void in
                    if (user != nil ) {
                        println("login successful")
                    }else {
                        println("login faild ")
                    }
                }
                
            }))
            
            
            /*signup  action */
            alertController.addAction(UIAlertAction(title: "Sign Up", style: .Default, handler: {
                action in
                let textField:NSArray = alertController.textFields! as NSArray
                let usernameTextField = textField.objectAtIndex(0) as UITextField
                let passwordTextField = textField.objectAtIndex(1) as UITextField
                
                 var newuser = PFUser()
                newuser.username = usernameTextField.text
                newuser.password = passwordTextField.text
                newuser.signUpInBackgroundWithBlock {
                    (success:Bool!,error:NSError!) -> Void in
                    if (success == true){
                        println ("sign up success")
                    } else {
                        println ("singup faild ")
                    }
                }
                
                
            }))
            

            presentViewController(alertController, animated: true, completion: nil)
            
            
            
        }
        
    }
    
    



}
