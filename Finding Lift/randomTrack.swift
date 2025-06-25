//
//  randomTrack.swift
//  Finding Lift
//
//  Created by Chuck Deerinck on 6/24/25.
//

import Foundation

func randomTrack() {
    for _ in 0..<100 {
        if .random(in: 0..<100) > 66 {
            desiredBank = .random(in: 0..<360)
        }
        addTrack(&trail)
    }
}
