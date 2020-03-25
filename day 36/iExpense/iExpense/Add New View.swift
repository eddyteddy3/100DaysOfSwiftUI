//
//  Add New View.swift
//  iExpense
//
//  Created by Moazzam Tahir on 26/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct Add_New_View: View {
    @State var name = ""
    @State var type = "Personal"
    @State var amount = ""
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
        }
    }
}

struct Add_New_View_Previews: PreviewProvider {
    static var previews: some View {
        Add_New_View()
    }
}
