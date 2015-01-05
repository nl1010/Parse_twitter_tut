//
//  ComposeViewController.swift
//  Parse_twitter
//
//  Created by Edward Lucas on 12/25/14.
//  Copyright (c) 2014 TutorialFederation. All rights reserved.
//

import UIkit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var sweetTextView: UITextView!

    @IBOutlet weak var charRemainingLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        /*set nice border of the text view*/
        sweetTextView.layer.borderColor = UIColor.blackColor().CGColor
        sweetTextView.layer.borderWidth = 0.5
        sweetTextView.layer.cornerRadius = 5
        
        /*once loaded this text view will become the first responder (keyboard will appear when loaded) -- very useful */
        sweetTextView.becomeFirstResponder()
        
        
        
    }
    
    
    @IBAction func sendSweet(sender: AnyObject) {
        var sweet:PFObject =  PFObject(className: "Sweets")
        sweet["contenct"] =  sweetTextView.text
        
        sweet["sweeter"] = PFUser.currentUser()
        
        sweet.save()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

}
