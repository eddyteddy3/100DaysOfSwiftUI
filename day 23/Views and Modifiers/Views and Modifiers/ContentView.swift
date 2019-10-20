//
//  ContentView.swift
//  Views and Modifiers
//
//  Created by Moazzam Tahir on 20/10/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//
///Modifier Order matters because we call the modifier, it creates the new view and then stacks up the new view on top of it.


import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .background(Color.yellow)
            .padding()
            .background(Color.blue)
            .padding()
            .background(Color.green)
            .padding()
            .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
