//
//  ContentView.swift
//  iExpense
//
//  Created by Moazzam Tahir on 16/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Hello" //publish will make an annoucment that these variable changes to any view
    @Published var lastName = "World"
}

struct SecondView: View {
    var name = ""
    @Environment(\.presentationMode) var presentationMode //store the values that is being provided externally such as Dark or Light Mode.
    
    var body: some View {
        VStack {
            Text("Hello, \(name)")
            
            Button("Dimiss") {
                self.presentationMode.wrappedValue.dismiss() //dismissing the controller
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var user = User() //ObservedObjects will listen to those annoucemets
    @State var isPresented = false
    
    var body: some View {
        VStack {
            VStack {
                Text("First name: \(user.firstName), Last name: \(user.lastName)")
                
                TextField("name", text: $user.firstName)
                TextField("last", text: $user.lastName)
            }.padding(30)
            
            Button("Show second screen") {
                self.isPresented.toggle()
            }.sheet(isPresented: $isPresented) {
                SecondView.init(name: "Mouzzam") //accessing the second property
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
