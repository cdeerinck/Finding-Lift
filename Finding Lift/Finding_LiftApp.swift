//
//  Finding_LiftApp.swift
//  Finding Lift
//
//  Created by Chuck Deerinck on 6/23/25.
//

import SwiftUI

var gliderX: Double = 0.0
var gliderY: Double = 0.0
var gliderHeading: Double = 0.0
var gliderSpeed: Double = 45.0
var gliderBank: Double = 0.0
var desiredBank: Double = 0.0
var bankRate: Double = 1.0
var cummulativeLift: Double = 0.0
var cummulativeSink: Double = 0.0
var windSpeed: Double = 0.0
var windDirection: Double = 0.0
var trail: [Track] = resetTrack()
var speed: Double = 0.1
var scaleFactor: Double = 0.1
var mode: Mode = .thermal

@main
struct Finding_LiftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
