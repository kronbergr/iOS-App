//
//  oolongTimer.swift
//  smarTea
//
//  Created by Robin K on 2/26/19.
//  Copyright © 2019 Robin Kronberg. All rights reserved.
//

import UIKit
import AudioToolbox



class oolongTimer: UIViewController {
    
    
    @IBOutlet weak var lblOTsec: UILabel!
    @IBOutlet weak var lblOTmin: UILabel!
    
    var seconds = 30
    var minutes = 6
    var timer = Timer()
    
   
    
    @objc func counter(){
        seconds -= 1
        
        if(minutes > 0 && seconds==0){
            minutes-=1
            seconds=59
        }
        
        lblOTmin.text=String(minutes)
        lblOTsec.text=String(seconds)
        
        if(seconds<10 && seconds>0){
            lblOTsec.text="0"+String(seconds)
        }
        
        
        
        if (seconds == 0 && minutes == 0){
            
            timer.invalidate()
            seconds = 30
            minutes = 6
            
            let myAlert = UIAlertController(title:"Your tea is ready!", message: "Did you know..." + global , preferredStyle: UIAlertController.Style.alert);
            
              AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated:true, completion:nil)
            

            lblOTmin.text="00"
            lblOTsec.text="00"
            
            
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(oolongTimer.counter), userInfo: nil, repeats:true)
        
    }
    

}
