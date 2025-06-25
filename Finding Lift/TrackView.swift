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
        Image(uiImage: drawTrail())
            .resizable()
            //.frame(width: 300, height: 200)
            .border(Color.blue)
    }
    
    func drawTrail() -> UIImage {
        
        //create context
        UIGraphicsBeginImageContext(CGSize(width: 9000, height: 9000))
        let midpoint = CGPoint(x: 4500, y: 4500)

        //setup initial color
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(20.0)
        
        //draw the glider
        if let image = UIImage(named: "Glider")?
            .cgImage {
            let rect = CGRect(x: midpoint.x - (Double(image.width) / 2.0), y: midpoint.y - (Double(image.height) / 2.0), width: Double(image.width), height: Double(image.height))
            context.draw(image, in: rect)
        }

        //iterate over trail drawing line from previous postion to the new point
        var last:CGPoint = CGPoint(x:trail.first!.x - gliderX + midpoint.x, y:trail.first!.y - gliderY + midpoint.y)
        for point in trail {
            context.move(to: last)
            context.setStrokeColor(point.lift.cgColor)
            let new = CGPoint(x: point.x - gliderX + midpoint.x, y: point.y - gliderY + midpoint.y)
            context.addLine(to: new)
            context.strokePath()
            last = new
        }
        
        //capture context in UIImage and return it
        let myImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return myImage!
    }
}

#Preview {
    TrackView()
}
