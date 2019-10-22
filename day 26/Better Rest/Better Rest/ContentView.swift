//
//  ContentView.swift
//  Better Rest
//
//  Created by Moazzam Tahir on 22/10/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//MARK: Explanation
///Stepper increment or decrement the value by specified number of value.
///State is needed too as well

import SwiftUI

struct ContentView: View {
    @State private var stepperValue = 8.0
    
    var body: some View {
        Stepper(value: $stepperValue, in: 1...10, step: 0.25) {
            Text("\(self.stepperValue, specifier: "%g") Hours")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
