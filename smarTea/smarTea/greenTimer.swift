//
//  greenTimer.swift
//  smarTea
//
//  Created by Robin K on 2/26/19.
//  Copyright © 2019 Robin Kronberg. All rights reserved.
//

import UIKit
import AudioToolbox

class greenTimer: UIViewController {
    

    @IBOutlet weak var GTmin: UILabel!
    
    @IBOutlet weak var GTsec: UILabel!
    
    var minutes = 3
    var seconds = 1
    var timer = Timer()
    
    

    
    @objc func counter(){
        seconds -= 1
        
        if(minutes > 0 && seconds==0){
            minutes-=1
            seconds=59
        }

        GTmin.text=String(minutes)
        GTsec.text=String(seconds)
        
        if(seconds<10 && seconds>0){
        GTsec.text="0"+String(seconds)
        }
        
        
        
        if (seconds == 0 && minutes == 0){
            
            timer.invalidate()
            seconds = 1
            minutes = 3
            
            
            let myAlert = UIAlertController(title:"Your tea is ready!", message: "Did you know..." + global , preferredStyle: UIAlertController.Style.alert);
            
               AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated:true, completion:nil)
            

            GTmin.text="00"
            GTsec.text="00"
            
            
        }
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(oolongTimer.counter), userInfo: nil, repeats:true)
        
    }
    


}
