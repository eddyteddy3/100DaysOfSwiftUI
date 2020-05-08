//
//  MissionView.swift
//  Moon Shot
//
//  Created by Moazzam Tahir on 09/05/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                    .resizable()
                    .scaledToFit()
                        .frame(width: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    Text(self.mission.description)
                    .padding()
                    
                    Spacer(minLength: 25)
                }
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let mission: [Mission] = Bundle.main.decode(fileName: "missions.json")
    
    static var previews: some View {
        MissionView(mission: mission[0])
    }
}
