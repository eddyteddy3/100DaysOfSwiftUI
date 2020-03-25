//
//  iExpenseView.swift
//  iExpense
//
//  Created by Moazzam Tahir on 26/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct ExpenseItems: Identifiable {
    let id = UUID()
    var name: String
    var type: String
    var amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItems]()
}

struct iExpenseView: View {
    @ObservedObject var expenseList = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenseList.items, id: \.id) { (item) in
                    Text(item.name)
                }
            .onDelete(perform: deleteItem)
            }
        .navigationBarTitle("Expense List")
        .navigationBarItems(leading:
            Button(action: {
                let expense = ExpenseItems(name: "Test", type: "IDK", amount: 1)
                self.expenseList.items.append(expense)
            }) {
                Image(systemName: "plus")
            }
        )
        
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        expenseList.items.remove(atOffsets: offsets)
    }
}

struct iExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        iExpenseView()
    }
}
