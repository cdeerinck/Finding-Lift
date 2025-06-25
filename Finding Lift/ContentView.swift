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
    @State private var refreshSubView: Bool = false
    @State var counter: Int = 0
    
    
    let timer = Timer.publish(every: speed, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            TrackView()
                .rotationEffect(Angle(degrees: northUp ? gliderHeading : 0.0))
                .id(refreshSubView)
            VStack{
                HStack {
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
                    Text("\(counter) / \(trail.count)")
                        .frame(width: 100)
                        .onReceive(timer) { _ in
                            addTrack(&trail)
                            counter += 1
                            refreshSubView.toggle()
                        }
                        .onAppear() {
                            addTrack(&trail)
                            counter = 0
                        }
                    Button("Thermal") {
                        mode = .thermal
                        trail = resetTrack()
                        counter += 1
                    }
                    .buttonStyle(.bordered)
                    .tint(mode == .thermal ? Color.accentColor : Color.black)
                    Button("Ridge") {
                        mode = .ridge
                        trail = resetTrack()
                        counter += 1
                    }
                        .buttonStyle(.bordered)
                        .tint(mode == .ridge ? Color.accentColor : Color.black)
                    Button("Wave") {
                        mode = .wave
                        trail = resetTrack()
                        counter += 1
                    }
                        .buttonStyle(.bordered)
                        .tint(mode == .wave ? Color.accentColor : Color.black)
                    Button("Convergence") {
                        mode = .convergence
                        trail = resetTrack()
                        counter += 1
                    }
                        .buttonStyle(.bordered)
                        .tint(mode == .convergence ? Color.accentColor : Color.black)
                    Button("Wind") {
                        if windSpeed == 0 {
                            windDirection = .random(in: 0..<360)
                            windSpeed = .random(in: 1..<20)
                        } else {
                            windSpeed = 0
                        }
                        counter += 1
                    }
                    .buttonStyle(.bordered)
                    .tint(windSpeed != 0 ? Color.accentColor : Color.black)

                    //Text("\(gliderHeading)")
                    Text("\(Int(windSpeed))")
                    Image(systemName: windSpeed >= 1.0 ? "arrow.up": "circle.dotted")
                            .rotationEffect(Angle(degrees: northUp ? windDirection - gliderHeading : windDirection))
                }
                
                Spacer()
                
                HStack {
                    Button("60°") { desiredBank = -60 } .buttonStyle(.bordered)
                        .tint(desiredBank == -60 ? Color.accentColor : Color.black)
                    Button("45°") { desiredBank = -45 } .buttonStyle(.bordered)
                        .tint(desiredBank == -45 ? Color.accentColor : Color.black)
                    Button("30°") { desiredBank = -30 } .buttonStyle(.bordered)
                        .tint(desiredBank == -30 ? Color.accentColor : Color.black)
                    Button("15°") { desiredBank = -15 } .buttonStyle(.bordered)
                        .tint(desiredBank == -15 ? Color.accentColor : Color.black)
                    Button("Straight") { desiredBank = 0 } .buttonStyle(.borderedProminent)
                        .tint(desiredBank == 0 ? Color.accentColor : Color.black)
                    Button("15°") { desiredBank = 15 } .buttonStyle(.bordered)
                        .tint(desiredBank == 15 ? Color.accentColor : Color.black)
                    Button("30°") { desiredBank = 30 } .buttonStyle(.bordered)
                        .tint(desiredBank == 30 ? Color.accentColor : Color.black)
                    Button("45°") { desiredBank = 45 } .buttonStyle(.bordered)
                        .tint(desiredBank == 45 ? Color.accentColor : Color.black)
                    Button("60°") { desiredBank = 60 } .buttonStyle(.bordered)
                        .tint(desiredBank == 60 ? Color.accentColor : Color.black)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
