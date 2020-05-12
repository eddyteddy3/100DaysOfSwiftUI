//
//  ContentView.swift
//  Drawing
//
//  Created by Moazzam Tahir on 11/05/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: Shape, InsettableShape {
    
    let startingAngle: Angle
    let endingAngle: Angle
    let clockwise: Bool
    
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let adjustmentAngel = Angle.degrees(90)
        let adjustedStartAngle = startingAngle - adjustmentAngel
        let adjustedEndAngle = endingAngle - adjustmentAngel
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: adjustedStartAngle, endAngle: adjustedEndAngle, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ContentView: View {
    @State var increaseAngle = 0
    
    var body: some View {
        VStack {
            Arc(startingAngle: Angle(degrees: 0), endingAngle: Angle(degrees: 90), clockwise: true)
                .strokeBorder(Color.blue, lineWidth: 20)
            
            Button("Tap me") {
                self.increaseAngle += 10
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
