//
//  ContentView.swift
//  watchOSPlayground WatchKit Extension
//
//  Created by Samuel Malcolm on 19/10/20.
//

import SwiftUI
import Foundation
import Combine
import CoreMotion

class MotionManager: ObservableObject {

    private var motionManager: CMMotionManager

    @Published
    var x: Double = 0.0
    @Published
    var y: Double = 0.0
    @Published
    var z: Double = 0.0

    @Published var xarr: [Double] = []
    @Published var yarr: [Double] = []
    @Published var zarr: [Double] = []
    
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.magnetometerUpdateInterval = 1/60
        self.motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
            guard error == nil else {
                print(error!)
                return
            }

            if let magnetData = magnetometerData {
                self.x = magnetData.magneticField.x
                self.xarr.append(magnetData.magneticField.x)
                self.y = magnetData.magneticField.y
                self.yarr.append(magnetData.magneticField.y)
                self.z = magnetData.magneticField.z
                self.zarr.append(magnetData.magneticField.z)
            }

        }

    }
}

struct ContentView: View {
    @State var counter:Int = 0
    @ObservedObject
        var motion: MotionManager
    var body: some View {
        VStack {

            Text("Hello, Sam!")
            Text("Magnetometer Data")
            Text("X: \(motion.x)")
            Text("Y: \(motion.y)")
            Text("Z: \(motion.z)")
            Button(action: {self.counter+=1}) {
                Text("test")
            }
            Text("Pressed \(counter) times!")
            Text("\(motion.xarr[0])")
            //Text("\(motion.xarr)")
            
            Spacer()
                
        
    }
    
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(motion: MotionManager())
    }
}
