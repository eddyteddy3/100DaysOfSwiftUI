//
//  Add New View.swift
//  iExpense
//
//  Created by Moazzam Tahir on 26/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct Add_New_View: View {
    @ObservedObject var expense: Expenses
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
            .navigationBarItems(trailing: Button(action: {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItems(name: self.name, type: self.type, amount: actualAmount)
                    self.expense.items.append(item)
                }
            }, label: {
                Text("Save")
            }))
        }
    }
}

