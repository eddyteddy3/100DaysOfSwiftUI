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
    @State var increaseSize: CGFloat = 1
    
    var body: some View {
        Button("Tap Me" ) {
            self.increaseSize += 1
        }
        .padding(70)
        .background(Color.init(.darkGray))
        .clipShape(Circle())
        .overlay(Circle.init().stroke(Color.red).scaleEffect(increaseSize).opacity(Double(2 - increaseSize)).animation(Animation.easeOut(duration: 0.1).repeatForever(autoreverses: false)))
        .scaleEffect(increaseSize)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
