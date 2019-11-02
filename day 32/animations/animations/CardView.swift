//
//  CardView.swift
//  animations
//
//  Created by Moazzam Tahir on 02/11/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @State private var showing = false
    @State private var amount = CGSize.zero
    let wordArray = Array("Hello World!")
    var body: some View {
        ZStack {
            
                
            
            HStack {
                ForEach(0..<wordArray.count) { num in
                    Text(String(self.wordArray[num]))
                        .font(.title)
                        //.foregroundColor(.black)
                        .offset(self.amount)
                        .animation(Animation.default.delay(Double(num) / 10))
                    .overlay(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .topTrailing, endPoint: .bottomTrailing))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged({ (value) in
                        self.amount = value.translation
                    })
                    .onEnded({ (value) in
                        self.amount = .zero
                        self.showing.toggle()
                    })
            )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
