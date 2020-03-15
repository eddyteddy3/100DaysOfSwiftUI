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

struct ContentView: View {
    @ObservedObject var user = User() //ObservedObjects will listen to those annoucemets
    
    var body: some View {
        VStack {
            Text("First name: \(user.firstName), Last name: \(user.lastName)")
            
            TextField("name", text: $user.firstName)
            TextField("last", text: $user.lastName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
