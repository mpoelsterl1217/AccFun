//
//  ViewController.swift
//  AccFun
//
//  Created by Matthew Poelsterl on 2/27/19.
//  Copyright © 2019 Matthew Poelsterl. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var accelTagX: UILabel!
    @IBOutlet weak var accelTagY: UILabel!
    @IBOutlet weak var accelTagZ: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let motionManager = CMMotionManager()
    func startAccelerometer () {
        motionManager.accelerometerUpdateInterval = 0.02
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {
            (accelerData:CMAccelerometerData?, error: Error?) in
            if (error != nil ) {
                print("Error")
            } else {
                
                let accelX = accelerData?.acceleration.x
                self.accelTagX.text = "X: " + String(format: "%.02f", accelX!)
                let accelY = accelerData?.acceleration.y
                self.accelTagY.text = "Y: " + String(format: "%.02f", accelY!)
                let accelZ = accelerData?.acceleration.z
                self.accelTagZ.text = "Z: " + String(format: "%.02f", accelZ!)
                print("Accelerometer X: \(accelX!)")
            }
        })
    }
    func stopAccelerometer () {
        self.motionManager.stopAccelerometerUpdates()
        self.accelTagX.text = "--"
        self.accelTagY.text = "--"
        self.accelTagZ.text = "--"
        print("Accelerometer X Stopped")
    }
    
    //MARK: Actions
    @IBAction func stateChange(_ sender: UISwitch) {
        if (sender.isOn == true){
            startAccelerometer()
        } else {
            stopAccelerometer()
        }
    }

}

