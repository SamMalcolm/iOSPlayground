//
//  SandboxApp.swift
//  Sandbox
//
//  Created by Samuel Malcolm on 29/10/20.
//

import SwiftUI

@main
struct SandboxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(motion: MotionManager())
        }
    }
}
