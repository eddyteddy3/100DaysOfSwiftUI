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
///state is the property wrapper that let us modify the value
///$ sign reads and writes the value for any State property
///Changes will be reflected in real time
///ForEach loop is used for iteration in SwiftUI.
///SwiftUI pickerview controller uses the ForEach loop to pick or displays the values.
///2 in the numberOfPeople means that the picker will select the third index not value 2

struct ContentView: View {
    @State var buttonTapped = 0
    @State var tipPercentage = ""
    @State var numberOfPeople = 2
    
    let tipPercentages = [15, 20, 30, 40, 50]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Please enter the tip", text: $tipPercentage)
                        .keyboardType(.decimalPad)
                    Text("Your tip is: \(tipPercentage)")
                }
                
                Section {
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) { people in
                            Text("\(people) number of People")
                        }
                    }
                }
                
                Button(action: {
                    self.buttonTapped += 1
                }) {
                    Text("button Tapped: \(self.buttonTapped) this is temporary")
                }
                
                Section {
                    ForEach(0 ..< 5) {_ in
                        Text("Hello SwiftUI")
                    }
                }
                
                Group {
                    ForEach(0 ..< 5) {_ in
                        Text("Hello SwiftUI!")
                    }
                }
            }
            .navigationBarTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
