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
///we can also embed the alert controller in button upon some state change
///The alert toggles back the showAlert to false the button got clicked in Alert View.
import SwiftUI

struct ContentView: View {
    @State var showAlert = false
    
    var flags = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var randomNumber = Int.random(in: 0...3)
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.4, blue: 0.5).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 50) {
                VStack {
                    Text("Chose the flag.").foregroundColor(.white)
                    Text(flags[randomNumber]).foregroundColor(.white)
                }
                
                VStack(spacing: 30) {
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            //flag button tapped
                        }) {
                            Image(self.flags[number]).renderingMode(.original)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
