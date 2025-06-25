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
    
    gliderX = last.x + cos(Angle(degrees: gliderHeading).radians)*gliderSpeed + cos(Angle(degrees: windDirection).radians)*windSpeed
    gliderY = last.y + sin(Angle(degrees: gliderHeading).radians)*gliderSpeed + sin(Angle(degrees: windDirection).radians)*windSpeed
    let lift = UIColor(.black) // Get the actual lift from the lift map
    
    //Roll to the desired bank angle
    if gliderBank != desiredBank {
        let direction = (desiredBank - gliderBank).binade
        gliderBank += direction * bankRate
        let newDirection = (desiredBank - gliderBank).binade
        if newDirection != direction {
            gliderBank = desiredBank
        }
    }
    
    let rateOfTurn = (1091.0 * tan(gliderBank)) / gliderSpeed // Got this from here: https://airplaneacademy.com/radius-of-standard-and-non-standard-rate-turns/
    gliderHeading += rateOfTurn
    gliderHeading = gliderHeading.truncatingRemainder(dividingBy:360.0)
    
    track.append(Track(x: gliderX, y: gliderY, lift: lift))
}
