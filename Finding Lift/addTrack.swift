//
//  addTrack.swift
//  Finding Lift
//
//  Created by Chuck Deerinck on 6/23/25.
//

import Foundation
import SwiftUICore
import SwiftUI


func addTrack(_ track: inout [Track]) {
    let last = track.last!  // The Track array should never be passed in completely empty.
    
    gliderX = last.x + (cos(Angle(degrees: 90.0 - gliderHeading).radians)*gliderSpeed + cos(Angle(degrees: 90.0 - windDirection).radians)*windSpeed) * scaleFactor
    gliderY = last.y - (sin(Angle(degrees: 90.0 - gliderHeading).radians)*gliderSpeed + sin(Angle(degrees: 90.0 - windDirection).radians)*windSpeed) * scaleFactor
    let lift = UIColor(red: .random(in: 0..<1), green: .random(in: 0..<1), blue:  .random(in: 0..<1), alpha: 1.0)
    //UIColor(.black) // Get the actual lift from the lift map
    
    //Roll to the desired bank angle
    if gliderBank != desiredBank {
        let sign = (desiredBank - gliderBank).sign
        let direction:Double
        if sign == .plus { direction = 1 } else {direction = -1 }
        gliderBank += direction * bankRate
        let newSign = (desiredBank - gliderBank).sign
        if newSign != sign {
            gliderBank = desiredBank
        }
    }
    
    let rateOfTurn = (1091.0 * tan(Angle(degrees:gliderBank).radians)) / gliderSpeed // Got this from here: https://airplaneacademy.com/radius-of-standard-and-non-standard-rate-turns/
    gliderHeading += speed * rateOfTurn
    gliderHeading = gliderHeading.truncatingRemainder(dividingBy:360.0)
    
    track.append(Track(x: gliderX, y: gliderY, lift: lift))
}
