//
//  ThirdViewController.swift
//  Tabbed App
//
//  Created by M on 2/21/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var channelNumber: UILabel!
    @IBOutlet weak var labelBox: UITextField!
    @IBOutlet weak var favSegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    @IBAction func pressStepper(sender: UIStepper) {
        let val = Int(sender.value)
        
        if val <= 99 && val >= 1 {
            channelNumber.text = Int(sender.value).description
        }
    }
    
    @IBAction func pressCancel(sender: UIButton) {
        labelBox.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func pressSave(sender: UIButton) {
        if (labelBox.text!.characters.count <= 4 && labelBox.text!.characters.count >= 1) {
            let index = favSegment.selectedSegmentIndex
            channelLabelArray[index] = labelBox.text!
            
            if let num = channelNumber.text {
                channelNumArray[index] = num
            }
            
            //channelNumArray[index] = channelNum.text!
        } else {
            let alertController = UIAlertController(title: "Sorry, your label is either too long or too short.", message:"Label must be 1 to 4 characters.", preferredStyle: UIAlertControllerStyle.Alert);
            
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil));
            
            self.presentViewController(alertController, animated: true, completion: nil);
        }
    }
    
    
    
    

}
