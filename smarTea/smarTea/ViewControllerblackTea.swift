//
//  blackTeaTimer.swift
//  smarTea
//
//  Created by Robin Kronberg on 2/21/19.
//  Copyright © 2019 Robin Kronberg. All rights reserved.
//

import UIKit
import AudioToolbox


class blackTeaTimer: UIViewController {
    
    
    @IBOutlet weak var lblMinutes: UILabel!
    
    @IBOutlet weak var lblSeconds: UILabel!
    
    
    var minutes = 5
    var seconds = 1
    var timer = Timer()


   
    

    
    
    @objc func counter(){
        seconds -= 1
        
        if(minutes > 0 && seconds==0){
            minutes-=1
            seconds=59
        }

        lblMinutes.text=String(minutes)
        lblSeconds.text=String(seconds)
        
        if(seconds<10 && seconds>0){
            lblSeconds.text="0"+String(seconds)
        }
        

        
        if (seconds == 0 && minutes == 0){
            
            timer.invalidate()
            seconds = 30
            minutes = 5

            
            
            let myAlert = UIAlertController(title:"Your tea is ready!", message: "Did you know..." + "random fact index" , preferredStyle: UIAlertController.Style.alert);
              AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated:true, completion:nil)
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(blackTeaTimer.counter), userInfo: nil, repeats:true)
        
    }
    
    
}
