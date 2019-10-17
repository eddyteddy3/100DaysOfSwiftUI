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
    
    var body: some View {
        ZStack {
            Color(red: 0.4, green: 0.5, blue: 0.7).edgesIgnoringSafeArea(.all)
            
            LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .top, endPoint: .bottom)
            
            VStack {
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
                    
                    }.background(Color.pink.frame(width:300, height:400)).padding()
                
                Button(action: {
                    self.showAlert = true
                }) {
                    Text("Show Alert").foregroundColor(.white)
                }.alert(isPresented: $showAlert) { () -> Alert in
                    Alert(title: Text("Alert!"), message: Text("This is alert message"), dismissButton: .default(Text("Gotcha!")))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
