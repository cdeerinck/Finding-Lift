//
//  ContentView.swift
//  Finding Lift
//
//  Created by Chuck Deerinck on 6/23/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var northUp = false
    @State var counter: Int = 0
    
    let timer = Timer.publish(every: speed, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            TrackView()
                .rotationEffect(Angle(degrees: northUp ? gliderHeading : 0.0))
            VStack{
                HStack {
                    Text("\(counter) / \(trail.count)")
                        .frame(width: 100)
                        .onReceive(timer) { _ in
                            addTrack(&trail)
                            counter += 1
                        }
                        .onAppear() {
                            addTrack(&trail)
                            counter = 0
                        }
                    Button("Thermal") {
                        trail = resetTrack()
                        counter += 1
                    }
                    .buttonStyle(.bordered)
                    Button("Ridge") {
                        trail = resetTrack()
                        counter += 1
                    }
                        .buttonStyle(.bordered)
                    Button("Wave") {
                        trail = resetTrack()
                        counter += 1
                    }
                        .buttonStyle(.bordered)
                    Button("Convergence") {
                        trail = resetTrack()
                        counter += 1
                    }
                        .buttonStyle(.bordered)
                    Button("Wind") {
                        windDirection = .random(in: 0..<360)
                        windSpeed = .random(in: 0..<20)
                        counter += 1
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
                                .rotationEffect(Angle(degrees: 0.0 - gliderHeading - 45.0))
                        }
                    }
                    //Text("\(gliderHeading)")
                    Text("\(Int(windSpeed))")
                    if windSpeed >= 1.0 {
                        Image(systemName: "arrow.up")
                            .rotationEffect(Angle(degrees: northUp ? windDirection - gliderHeading : windDirection))
                    } else {
                        
                    }
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

        }
    }
}

#Preview {
    ContentView()
}
