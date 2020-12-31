//
//  ContentView.swift
//  watchOSPlayground WatchKit Extension
//
//  Created by Samuel Malcolm on 19/10/20.
//

import SwiftUI
import Foundation
import Combine

struct ContentView: View {
    @State var counter:Int = 0
    @ObservedObject
        var motion: MotionManager
    
    var body: some View {
        VStack {
            Text("Hello, Sam!")
            Group{
                Text("Magnetometer Data")
                Text("X: \(motion.magneticField.x)")
                Text("Y: \(motion.magneticField.y)")
                Text("Z: \(motion.magneticField.z)")
            }
            Group{
                Text("Accelorometer Data")
                Text("X: \(motion.accelorometerResults.x)")
                Text("Y: \(motion.accelorometerResults.y)")
                Text("Z: \(motion.accelorometerResults.z)")
            }
            Group{
                Text("Gyroscope Data")
                Text("X: \(motion.gyroscopeResults.x)")
                Text("Y: \(motion.gyroscopeResults.y)")
                Text("Z: \(motion.gyroscopeResults.z)")
            }
            Button(action: {self.counter+=1}) {
                Text("test")
            }
            Text("Pressed \(counter) times!")
            
            Spacer()
            Button(action: {
                let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                impactMed.impactOccurred()
            }) {
                Text("This is a Button")
            }
    }
    
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(motion: MotionManager())
    }
}
