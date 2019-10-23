//
//  ContentView.swift
//  Better Rest
//
//  Created by Moazzam Tahir on 22/10/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//MARK: Explanation
///Stepper increment or decrement the value by specified number of value.
///State is needed too as well
///Date Picker displays the picker of the date and the time
///for the date picker, the state which is the instance of Date() is required as well to select the time

import SwiftUI

struct ContentView: View {
    @State private var stepperValue = 8.0
    @State var sleepingHour = Date()
    @State private var coffeCups = 1
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("When do you wake up")
                DatePicker(selection: $sleepingHour, displayedComponents: .hourAndMinute) {
                    Text("Time").padding().font(.body)
                }
                
                Text("Amount of sleep you desire?")
                Stepper(value: $stepperValue, in: 1...12, step: 0.25) {
                    Text("\(self.stepperValue, specifier: "%g") Hours")
                }.padding()
                
                Text("Amount of coffee you take?")
                Stepper(value: $coffeCups, in: 1...20, step: 1) {
                    Text("\(self.coffeCups) Cups")
                }.padding()
                
                    .alert(isPresented: $showAlert) { () -> Alert in
                        Alert(title: Text("Your ideal time is"), message: Text(self.alertMessage), dismissButton: .default(Text("Gotcha!")))
                }
            }
            .navigationBarTitle("Better Rest")
            .navigationBarItems(trailing:
                Button(action: calculateSleep) {
                    Text("Calculate")
                }
            )
        }
    }
    
    func calculateSleep() {
        let sleepCalculator = BetterRest()
        let timeComponents = Calendar.current.dateComponents([.hour, .minute], from: sleepingHour)
        let minute = (timeComponents.minute ?? 0) * 60
        let hour = (timeComponents.hour ?? 0) * 60 * 60
        
        do {
            let predictions = try sleepCalculator.prediction(wake: Double(hour + minute), estimatedSleep: stepperValue, coffee: Double(coffeCups))
            
            let sleepTime = sleepingHour - predictions.actualSleep
            
            let timeString = DateFormatter()
            timeString.timeStyle = .short
            alertMessage = timeString.string(from: sleepTime)
            showAlert = true
        } catch let err {
            print("Error: \(err.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
