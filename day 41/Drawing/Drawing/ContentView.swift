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

struct Flower: Shape {
    //how much flower move away from the center
    var petalOffset: Double = -20
    
    //how wide is each petal
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        //path to hold all the petals
        var path = Path()
        
        //count from 0 up to .pi*8, moving up to .pi / 8
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            //rotating the petal using the current value of loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // moving the petal to the center of the view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            //creating fixed petal height and y position
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalOffset), height: rect.width / 2))
            
            //applying the petal rotation
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
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
