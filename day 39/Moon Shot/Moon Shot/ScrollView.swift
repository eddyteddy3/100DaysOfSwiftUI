//
//  ScrollView.swift
//  Moon Shot
//
//  Created by Moazzam Tahir on 01/04/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct ScrolView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrolView()
    }
}
