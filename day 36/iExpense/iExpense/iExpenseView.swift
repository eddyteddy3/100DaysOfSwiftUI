//
//  iExpenseView.swift
//  iExpense
//
//  Created by Moazzam Tahir on 26/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct ExpenseItems: Identifiable, Codable {
    let id = UUID()
    var name: String
    var type: String
    var amount: Int
}

class Expenses: ObservableObject {
    @Published var items: [ExpenseItems] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "items") {
            let decode = JSONDecoder()
            if let decoded = try? decode.decode([ExpenseItems].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}

struct iExpenseView: View {
    @ObservedObject var expenseList = Expenses()
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenseList.items, id: \.id) { (item) in
                    VStack {
                        Text(item.name)
                            .font(.title)
                        Text(String(item.amount))
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationBarTitle("Expense List")
            .navigationBarItems(leading:
                Button(action: {
                    self.isPresented = true
                }) {
                    Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $isPresented) {
                    Add_New_View(expense: self.expenseList)
            }
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
