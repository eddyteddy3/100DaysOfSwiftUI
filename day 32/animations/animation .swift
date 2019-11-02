//
//  animation .swift
//  animations
//
//  Created by Moazzam Tahir on 02/11/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct animation_: View {
    let wordsArray = Array("Hello Swift UI")
    @State private var color = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        HStack {
            ForEach(0..<wordsArray.count) { num in
                Text(String(self.wordsArray[num]))
                .padding(3)
                .background(Color(self.color ? .red : .blue))
                .animation(Animation.default.delay(Double(num)/10))
                .offset(self.dragAmount)
                
            }
        }
        .gesture(
            DragGesture().onChanged({ (value) in
                self.dragAmount = value.translation
            })
                .onEnded({ (_) in
                    self.dragAmount = .zero
                    self.color.toggle()
                })

        )
    }
}

struct animation__Previews: PreviewProvider {
    static var previews: some View {
        animation_()
    }
}
