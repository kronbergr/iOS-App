//
//  whiteTimer.swift
//  smarTea
//
//  Created by Robin K on 2/28/19.
//  Copyright © 2019 Robin Kronberg. All rights reserved.
//

import UIKit
import AudioToolbox

class whiteTimer: UIViewController {
    
    @IBOutlet weak var wtSec: UILabel!
    @IBOutlet weak var WTmin: UILabel!
    
    var minutes = 5
    var seconds = 1
    var timer = Timer()
    
    @objc func counter(){
        seconds -= 1
        
        if(minutes > 0 && seconds==0){
            minutes-=1
            seconds=59
        }
        
        WTmin.text=String(minutes)
        wtSec.text=String(seconds)
        
        if(seconds<10 && seconds>0){
            wtSec.text="0"+String(seconds)
        }
        
        
        
        if (seconds == 0 && minutes == 0){
            
            timer.invalidate()
            seconds = 1
            minutes = 5
            
            
            let myAlert = UIAlertController(title:"Your tea is ready!", message: "Did you know..." + global , preferredStyle: UIAlertController.Style.alert);
            
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated:true, completion:nil)
            
            WTmin.text="00"
            wtSec.text="00"
            
            
            
            
        }
        
        
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(whiteTimer.counter), userInfo: nil, repeats:true)
        // Do any additional setup after loading the view.
    }
    


}
