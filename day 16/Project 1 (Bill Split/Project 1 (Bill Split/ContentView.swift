//
//  ContentView.swift
//  Project 1 (Bill Split
//
//  Created by Moazzam Tahir on 15/10/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//

import SwiftUI

///some means one specific type of view has to be return
///VIEW comes from swiftUI, which is the basic protocol to display anything on the screen
///Forms converts the layout in to list order like the settings in iOS
///we can use upto 10 lists in one form but if we need to use more list we need to group them
///NavigationBar here called Navigation View.
///state is the property wrapper that let us md

struct ContentView: View {
    @State var buttonTapped = 0
    
    var body: some View {
        NavigationView {
            Form {
                Button(action: {
                    self.buttonTapped += 1
                }) {
                    Text("button Tapped: \(self.buttonTapped)")
                }
                Section {
                    Text("Hello SwiftUI")
                    Text("Hello SwiftUI")
                    Text("Hello SwiftUI")
                    Text("Hello SwiftUI")
                    Text("Hello SwiftUI")
                }
                
                Group {
                    Text("Hello SwiftUI")
                    Text("Hello SwiftUI")
                    Text("Hello SwiftUI")
                    Text("Hello SwiftUI")
                    Text("Hello SwiftUI")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
