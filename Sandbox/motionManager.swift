//
//  motionManager.swift
//  Sandbox
//
//  Created by Samuel Malcolm on 31/12/20.
//

import Foundation
import CoreMotion

class MotionManager: ObservableObject {

    private var motionManager: CMMotionManager
    @Published
    var magneticField: (x: Double, y: Double, z: Double) = (0.0,0.0,0.0)
    @Published
    var accelorometerResults: (x: Double, y: Double, z: Double) = (0.0,0.0,0.0)
    @Published
    var gyroscopeResults: (x: Double, y: Double, z: Double) = (0.0,0.0,0.0)
    
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.magnetometerUpdateInterval = 1/2
        self.motionManager.accelerometerUpdateInterval = 1/2
        self.motionManager.gyroUpdateInterval = 1/2
        
        self.motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
            guard error == nil else {
                print(error!)
                return
            }

            if let magnetData = magnetometerData {
                self.magneticField = (x: magnetData.magneticField.x, y:magnetData.magneticField.y, z:magnetData.magneticField.z)
            }

        }
        
        self.motionManager.startAccelerometerUpdates(to: .main) { (accelorometerData, error) in
            guard error == nil else {
                print(error!)
                return
            }

            if let accelData = accelorometerData {
                self.accelorometerResults = (x: accelData.acceleration.x, y: accelData.acceleration.y, z: accelData.acceleration.z)
            }

        }
        
        self.motionManager.startGyroUpdates(to: .main) { (gyroscopeData, error) in
            guard error == nil else {
                print(error!)
                return
            }

            if let gyroData = gyroscopeData {
                self.gyroscopeResults = (x:gyroData.rotationRate.x, y: gyroData.rotationRate.y, z: gyroData.rotationRate.z)
            }

        }

    }
}
