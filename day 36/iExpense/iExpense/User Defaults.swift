//
//  User Defaults.swift
//  iExpense
//
//  Created by Moazzam Tahir on 25/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct CustomObject: Codable {
    var name: String
    var id: Int
}

struct User_Defaults: View {
    @State var count = UserDefaults.standard.integer(forKey: "tap")
    @State var count2 = UserDefaults.standard.integer(forKey: "tap2")
    
    @State var customObject = CustomObject(name: "ABC", id: 1)
    
    var body: some View {
        HStack {
            Button("Tap me") {
                self.count += 1
                UserDefaults.standard.set(self.count, forKey: "tap")
                UserDefaults.standard.set(self.count - 1, forKey: "tap2")
                
                let encoder = JSONEncoder()
                if let data = try? encoder.encode(self.customObject) {
                    UserDefaults.standard.set(data, forKey: "custom")
                }
            }
            
            Text("Counter 1: \(count)")
            Text("Counter 2: \(count2)")
        }
    }
}

struct User_Defaults_Previews: PreviewProvider {
    static var previews: some View {
        User_Defaults()
    }
}
