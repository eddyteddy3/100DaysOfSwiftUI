//
//  SpinView.swift
//  animations
//
//  Created by Moazzam Tahir on 14/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct SpinView: View {
    @State var degrees: Double = 0
    
    var body: some View {
        
        Button("Tap Me") {
            
            withAnimation {
                self.degrees += 180
            }
            
        }
        .padding(60)
        .background(Color.orange)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(degrees), axis: (x: 1, y: 1, z: 1))
    }
}

struct SpinView_Previews: PreviewProvider {
    static var previews: some View {
        SpinView()
    }
}
