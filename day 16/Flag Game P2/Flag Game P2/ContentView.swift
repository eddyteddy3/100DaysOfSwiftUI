//
//  ContentView.swift
//  Flag Game P2
//
//  Created by Moazzam Tahir on 17/10/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//
///VStack places the views vertically; Up and Down to each, centered by default
///HStack places the views horizontally; Side by side
///ZStack places the views in depth; 3 Dimensional, On top of each other
///Spacer pushes the views
///Aligmnent Property can align the views i.e. Top, Left, Right
///

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 100) {
            HStack(spacing: 100) {
                Text("1")
                Text("2")
                Text("3")
            }
            HStack(spacing: 100) {
                Text("4")
                Text("5")
                Text("6")
            }
            HStack(spacing: 100) {
                Text("7")
                Text("8")
                Text("9")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
