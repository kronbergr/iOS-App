//
//  customTimer.swift
//  smarTea
//
//  Created by Robin Kronberg on 2/21/19.
//  Copyright © 2019 Robin Kronberg. All rights reserved.
//

import UIKit
import AudioToolbox

class customTimer: UIViewController {
    

    var lblFact: String = global
    
    var seconds = 30
    var minutes = 5
    var timer = Timer()

    @IBOutlet weak var label: UILabel!
    
  
    @IBOutlet weak var minutesLabel: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBOutlet weak var startOutlet: UIButton!
    
    @IBOutlet weak var stopOutlet: UIButton!
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        seconds = Int(sender.value)%60
        
        minutes = (Int(sender.value)/60)%60

      
        label.text = String(seconds)
        minutesLabel.text = String(minutes)
        

//        if(seconds==0){
//
//            label.text="00"
//        }
        
        if(seconds<10 && seconds>=0){
            label.text="0"+String(seconds)
        }

        

        
    }
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(customTimer.counter), userInfo: nil, repeats:true)

        startOutlet.isEnabled = false
        sliderOutlet.isEnabled = false
   
        
    }
    
    @objc func counter(){
        seconds -= 1
        
        if(minutes > 0 && seconds<0){
            minutes-=1
            seconds=59
        }
        
 
        
        label.text=String(seconds)
        minutesLabel.text=String(minutes)
        
        if(seconds<10 && seconds>=0){
            label.text="0"+String(seconds)
        }
        
        if (seconds == 0 && minutes == 0){
            
            timer.invalidate()
            startOutlet.isEnabled = true
            sliderOutlet.isEnabled = true
            seconds = 30
            minutes = 5
            sliderOutlet.setValue(350, animated: true)
            label.text = "30"
            minutesLabel.text = "5"
            

            let myAlert = UIAlertController(title:"Your tea is ready!", message: "Did you know..." + lblFact , preferredStyle: UIAlertController.Style.alert);
            
              AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated:true, completion:nil)
            
        }
        
        
    }
    
    @IBAction func stop(_ sender: Any) {
        
        timer.invalidate()
        seconds = 30
        minutes = 5
        sliderOutlet.setValue(350, animated: true)
        label.text = "30"
        minutesLabel.text = "5"
        
        startOutlet.isEnabled = true
        sliderOutlet.isEnabled = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}
