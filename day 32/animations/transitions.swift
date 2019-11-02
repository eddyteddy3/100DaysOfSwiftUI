//
//  transitions.swift
//  animations
//
//  Created by Moazzam Tahir on 02/11/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct transitions: View {
    @State private var toggle = false
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    self.toggle.toggle()
                }
            }
            
            if toggle {
                Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(toggle ? .red : .blue)
                    .transition(.asymmetric(insertion: .scale, removal: .slide))
            }
            
        }
    }
}

struct transitions_Previews: PreviewProvider {
    static var previews: some View {
        transitions()
    }
}
