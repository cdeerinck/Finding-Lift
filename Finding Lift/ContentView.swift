//
//  ContentView.swift
//  Finding Lift
//
//  Created by Chuck Deerinck on 6/23/25.
//

import SwiftUI

struct ContentView: View {
    @State var counter: Int = 0

    var body: some View {
        ZStack {
            TrackView()
            VStack{
                HStack {
                    Button("Thermal") {
                        trail = resetTrack()
                        for _ in 0..<100 { addTrack(&trail) }
                    }
                    .buttonStyle(.bordered)
                    Button("Ridge") {
                        trail = resetTrack()
                    }
                        .buttonStyle(.bordered)
                    Button("Wave") {
                        trail = resetTrack()
                    }
                        .buttonStyle(.bordered)
                    Button("Convergence") {
                        trail = resetTrack()
                    }
                        .buttonStyle(.bordered)
                    Button("Wind") {
                        windDirection = .random(in: 0..<360)
                        windSpeed = .random(in: 0..<20)
                    }
                    .buttonStyle(.bordered)
                    Button  {
                        northUp.toggle()
                        counter += 1
                    } label: {
                        if northUp {
                            Image(systemName: "location.fill")
                                .rotationEffect(Angle(degrees: -45.0))
                        } else {
                            Image(systemName: "location")
                                .rotationEffect(Angle(degrees: gliderHeading - 45.0))
                        }
                    }
                    Text("\(Int(windSpeed))")
                    Image(systemName: "arrow.up")
                        .rotationEffect(Angle(degrees: windDirection))
                }
                
                Spacer()
                
                HStack {
                    Button("60°") { desiredBank = -60 } .buttonStyle(.bordered)
                    Button("45°") { desiredBank = -45 } .buttonStyle(.bordered)
                    Button("30°") { desiredBank = -30 } .buttonStyle(.bordered)
                    Button("15°") { desiredBank = -15 } .buttonStyle(.bordered)
                    Button("Straight") { desiredBank = 0 } .buttonStyle(.borderedProminent)
                    Button("15°") { desiredBank = 15 } .buttonStyle(.bordered)
                    Button("30°") { desiredBank = 30 } .buttonStyle(.bordered)
                    Button("45°") { desiredBank = 45 } .buttonStyle(.bordered)
                    Button("60°") { desiredBank = 60 } .buttonStyle(.bordered)
                }
            }
            
        }
        .task {
            moveIt()
        }
    }
    
    func moveIt() {
        print(".", terminator: " ")
        counter += 1
    }
}

#Preview {
    ContentView()
}
