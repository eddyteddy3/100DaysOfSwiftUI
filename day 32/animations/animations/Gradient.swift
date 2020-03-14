//
//  Gradient.swift
//  animations
//
//  Created by Moazzam Tahir on 14/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -10, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct Gradient: View {
    var letters = Array("Hello SwiftUI")
    @State var enable: Bool = true
    @State var dragAmount = CGSize.zero
    @State var isShowing: Bool = false
    
    var body: some View {
        VStack {
            
            VStack {
                Button("Tap me"){
                    withAnimation {
                        self.isShowing.toggle()
                    }
                }
                
                if isShowing {
                    Rectangle()
                        .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
                }
                
            }
            
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(self.letters[num]))
                    .padding(5)
                    .background(self.enable ? Color.red : Color.blue)
                    .offset(self.dragAmount)
                    .animation(Animation.linear.delay(Double(num) / 20))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged({
                        self.dragAmount = $0.translation
                    })
                    .onEnded({_ in
                        self.dragAmount = CGSize.zero
                        self.enable.toggle()
                    })
            )
        }
    }
}

struct Gradient_Previews: PreviewProvider {
    static var previews: some View {
        Gradient()
    }
}
