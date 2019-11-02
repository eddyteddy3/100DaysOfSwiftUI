//
//  ContentView.swift
//  animations
//
//  Created by Moazzam Tahir on 02/11/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//
///implicit animation on a button.
///we need a stateful property that scaleup the button
///Animations also have their own modifiers (Explicit Animations)
///overlay is an property that adds the seconday view layer on top of the primary view
///

import SwiftUI

struct ContentView: View {
    @State private var animationValue: CGFloat = 1
    @State private var toggleAnimation = true
    @State private var rotationDegrees: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            Stepper("Animation", value: $animationValue.animation(), in: 1...10)
            
            Spacer()
            
            Button("Spin Me") {
                withAnimation {
                    self.rotationDegrees += 360
                }
            }
            .padding(50)
            .background(Color(.gray))
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(self.rotationDegrees), axis: (x: 0, y: 1, z: 1))
            
            Spacer()
            
            Button("Tap me") {
                self.animationValue += 1
                //self.toggleAnimation = false
            }
            .padding(50)
            .background(Color(.red))
            .foregroundColor(.white)
            .clipShape(Circle())
            //.scaleEffect(animationValue)
            .overlay(
                Circle()
                    .stroke(Color.red)
                    .scaleEffect(animationValue)
                    .opacity(Double(2 - animationValue))
                    .animation(toggleAnimation ? Animation.easeIn(duration: 1).repeatForever(autoreverses: false) : Animation.spring())
            )
            
            .onAppear {
                    self.animationValue = 2
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
