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


import SwiftUI

struct ContentView: View {
    @State private var animationValue: CGFloat = 1
    @State private var toggleAnimation = true
    var body: some View {
        Button("Tap me") {
            self.animationValue += 1
            self.toggleAnimation = false
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
