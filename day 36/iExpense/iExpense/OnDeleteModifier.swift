//
//  OnDeleteModifier.swift
//  iExpense
//
//  Created by Moazzam Tahir on 19/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct OnDeleteModifier: View {
    @State var number = 0
    @State var array = [Int]()
    
    var body: some View {
        VStack {
            List {
                ForEach(array, id: \.self) {
                    Text("\($0)")
                }.onDelete(perform: remove)
            }
            
            Button("Add Number") {
                self.number += 1
                self.array.append(self.number)
            }
        }
    }
    
    func remove(at offset: IndexSet) {
        array.remove(atOffsets: offset)
    }
}

struct OnDeleteModifier_Previews: PreviewProvider {
    static var previews: some View {
        OnDeleteModifier()
    }
}
