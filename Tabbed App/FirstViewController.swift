//
//  FirstViewController.swift
//  Tabbed App
//
//  Created by M on 2/21/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var switchLabel: UITextField!
    @IBOutlet weak var sliderValue: UITextField!
    @IBOutlet weak var channelValue: UITextField!
    
    @IBOutlet weak var pSwitch: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var favChannelBar: UISegmentedControl!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var chanUp: UIButton!
    @IBOutlet weak var chanDown: UIButton!
    
    
    override func viewWillAppear(animated: Bool) {
        for (var i = 0; i <= 3; i++) {
            favChannelBar.setTitle(channelLabelArray[i], forSegmentAtIndex: i)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderValue.text = "\(Int(round(Float(slider.value) * 100)))"
        channelValue.text = "01"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sliderMoved(sender: UISlider) {
        sliderValue.text = "\(Int(round(Float(sender.value) * 100)))"
    }
    
    @IBAction func switchToggled(sender: UISwitch) {
        switchLabel.text = (sender.on ? "On" : "Off")
        pSwitch.setOn(sender.on, animated: true)
        
        let enabled = (sender.on == true)
        slider.enabled = enabled
        favChannelBar.enabled = enabled
        zeroButton.enabled = enabled
        oneButton.enabled = enabled
        twoButton.enabled = enabled
        threeButton.enabled = enabled
        fourButton.enabled = enabled
        fiveButton.enabled = enabled
        sixButton.enabled = enabled
        sevenButton.enabled = enabled
        eightButton.enabled = enabled
        nineButton.enabled = enabled
        chanUp.enabled = enabled
        chanDown.enabled = enabled
        
    }
    var digitArray = [String]()
    
    
    @IBAction func numPressed(sender: UIButton) {
        let currentNumber : String = sender.titleLabel!.text!
        
        if(digitArray.count == 0 || digitArray.count == 1){
            digitArray.append(currentNumber)
            channelValue.text = ("\(currentNumber)")
        }
        
        if (digitArray.count == 2) {
            let newChannel = digitArray[0] + digitArray[1]
            
            if (newChannel == "00"){
                digitArray.removeAll()
            } else {
                channelValue.text = newChannel
                digitArray.removeAll()
            }
            
        }
    }
    
    @IBAction func chanIncrement(sender: UIButton) {
        let currentChan = Int(channelValue.text!)
        
        if(currentChan! + 1 > 99){
            
        } else {
            let newChan = currentChan! + 1
            channelValue.text = String(newChan)
        }
    }
    
    @IBAction func chanDecrement(sender: UIButton) {
        let currentChan = Int(channelValue.text!)
        
        if(currentChan! - 1 < 1){
            
        } else {
            let newChan = currentChan! - 1
            channelValue.text = String(newChan)
        }
    }
    
    @IBAction func pressFavChannel(sender: UISegmentedControl) {
        let index = favChannelBar.selectedSegmentIndex
        channelValue.text = channelNumArray[index]
    }
    
    
    
    


}

