//
//  AstronautView.swift
//  Moon Shot
//
//  Created by Moazzam Tahir on 10/05/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width)
                
                Text(self.astronaut.description)
                    .font(.headline)
                    .padding()
            }
        }
        
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronaut: [Astronaut] = Bundle.main.decode(fileName: "astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronaut[0])
    }
}
