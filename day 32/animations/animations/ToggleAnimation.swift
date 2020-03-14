//
//  ToggleAnimation.swift
//  animations
//
//  Created by Moazzam Tahir on 14/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct ToggleAnimation: View {
    @State var enable: Bool = false
    @State var change: Bool = false
    var body: some View {
        
        VStack {
            Button("Tap me") {
                self.change.toggle()
            }
            .foregroundColor(Color.white)
            .frame(width: 200, height: 200)
            .background(change ? Color.red : Color.blue)
            .animation(Animation.easeIn(duration: enable ? 1 : 0))
            .clipShape(RoundedRectangle.init(cornerRadius: change ? 60 : 0)).animation(.easeInOut(duration: enable ? 1 : 0))
            
            Spacer()
            
            Button("Enable") {
                self.enable.toggle()
            }.frame(width: 200, height: 200)
                .background(Color.green)
        }
        
        
    }
}

struct ToggleAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ToggleAnimation()
    }
}
