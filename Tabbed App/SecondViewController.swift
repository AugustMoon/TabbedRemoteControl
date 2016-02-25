//
//  SecondViewController.swift
//  Tabbed App
//
//  Created by M on 2/21/16.
//  Copyright © 2016 DePaul University. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var pSwitch: UISwitch!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var fastForwardButton: UIButton!
    @IBOutlet weak var fastRewindButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var playMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressPlay(sender: UIButton) {
        if(stateLabel.text == "Recording"){
            requestNotPossible("Playing")
        } else {
            stateLabel.text = "Playing"
            playMode = true
        }
    }
    
    
    @IBAction func pressStop(sender: UIButton) {
        playMode = false
        stateLabel.text = "Stopped"
    }
    
    @IBAction func pressPause(sender: UIButton) {
        if (playMode == true && stateLabel.text != "Recording") {
            stateLabel.text = "Paused"
        } else {
            requestNotPossible("Paused")
        }
    }
    
    
    @IBAction func pressFastForward(sender: UIButton) {
        if(playMode == true && stateLabel.text != "Recording"){
            stateLabel.text = "Fast Forwarding"
        } else {
            requestNotPossible("Fast Forwarding")
        }
    }
    
    @IBAction func pressFastRewind(sender: UIButton) {
        if(playMode == true && stateLabel.text != "Recording"){
            stateLabel.text = "Fast Rewinding"
        } else {
            requestNotPossible("Fast Rewinding")
        }
    }
    
    @IBAction func pressRecord(sender: UIButton) {
        if(stateLabel.text == "Stopped" && playMode == false){
            stateLabel.text = "Recording"
        } else {
            requestNotPossible("Recording")
        }
    }
    
    @IBAction func switchToggled(sender: UISwitch) {
        powerLabel.text = (sender.on ? "On" : "Off")
        pSwitch.setOn(sender.on, animated: true)
        
        if(sender.on == false){
            stateLabel.text = "Stopped"
        }
        
        let enabled = (sender.on == true)
        playButton.enabled = enabled
        stopButton.enabled = enabled
        pauseButton.enabled = enabled
        fastForwardButton.enabled = enabled
        fastRewindButton.enabled = enabled
        recordButton.enabled = enabled
    }
    
    internal func requestNotPossible (state: String){
        let title = "Impossible Request"
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .ActionSheet)
        
        // Create the action.
        let cancelAction = UIAlertAction(title: "Cancel", style: .Destructive){ action in
            let cancelController = UIAlertController(title: "Request Cancelled", message: "", preferredStyle: .Alert)
            let okayAction = UIAlertAction(title: "Okay", style: .Default, handler: nil)
            cancelController.addAction(okayAction)
            self.presentViewController(cancelController, animated: true, completion: nil)
        }
        
        let confirmAction = UIAlertAction(title: "Force", style: .Default) { action in
            let okayController = UIAlertController(title: "Stopping Current Operation.", message: "Proceeding Requested Operation.", preferredStyle: .Alert)
            
            self.stateLabel.text = "Stopped"
            if (state == "Playing" || state == "Paused" || state == "Fast forwarding" || state == "Fast rewinding") {
                self.playMode = true
            } else {
                self.playMode = false
            }
            self.stateLabel.text = state
            
            let okayAction = UIAlertAction(title: "Okay", style: .Default, handler: nil)
            okayController.addAction(okayAction)
            self.presentViewController(okayController, animated: true, completion: nil)
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    

}

