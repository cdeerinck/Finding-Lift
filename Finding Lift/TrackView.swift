//
//  TrackView.swift
//  Finding Lift
//
//  Created by Chuck Deerinck on 6/24/25.
//

import SwiftUI

struct TrackView: View {
    
    var glider:UIImage = UIImage(named:"Glider.png")! // 243 x 114
    
    var body: some View {
        Image(uiImage: glider)
            .resizable()
            .frame(width: 60, height: 27)
            .border(Color.blue)
    }
    
    func drawTrail() {
        for item in trail {
            //draw a line
        }
    }
}

#Preview {
    TrackView()
}
