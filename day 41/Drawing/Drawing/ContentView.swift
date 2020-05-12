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

struct Arc: Shape {
    let startingAngle: Angle
    let endingAngle: Angle
    let clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let adjustmentAngel = Angle.degrees(90)
        let adjustedStartAngle = startingAngle - adjustmentAngel
        let adjustedEndAngle = endingAngle - adjustmentAngel
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: adjustedStartAngle, endAngle: adjustedEndAngle, clockwise: !clockwise)
        
        return path
    }
}

struct ContentView: View {
    var body: some View {
        Arc(startingAngle: Angle(degrees: 0), endingAngle: Angle(degrees: 90), clockwise: true)
            .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
            .frame(width: 300, height: 300)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
