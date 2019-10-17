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
///for the segmentedView in swiftUI, we need to add the modifier for it in the PickerView.
///The text in the pickerView will presented on the segmentedView text
///We use computed properties for the sake of calculation in SwiftUI in most of the cases.

struct ContentView: View {
    @State var buttonTapped = 0
    @State var tipPercentage = 25
    @State var amount = ""
    @State var numberOfPeople = 2
    
    let tipPercentages = [15, 20, 25, 30, 40]
    
    var amountPerPerson: Double {
        let enteredAmount = Double(amount) ?? 0
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelected = Double(tipPercentages[tipPercentage])
        
        let tipValue = enteredAmount / 100 * tipSelected
        let grandTotal = tipValue + enteredAmount
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Billing Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) { people in
                            Text("\(people) number of People")
                        }
                    }
                }
                
                Section {
                    Text("Calculated Tip: $")
                }
                
                Button(action: {
                    self.buttonTapped += 1
                }) {
                    Text("button Tapped: \(self.buttonTapped) this is temporary")
                }
                
                Section {
                    Picker("Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {percentage in
                            Text("\(self.tipPercentages[percentage])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
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
