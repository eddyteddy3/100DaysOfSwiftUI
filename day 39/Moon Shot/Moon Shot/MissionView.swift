//
//  MissionView.swift
//  Moon Shot
//
//  Created by Moazzam Tahir on 09/05/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct CrewMembers {
    var role: String
    var astronaut: Astronaut
}

struct MissionView: View {
    let mission: Mission
    let astronauts: [CrewMembers]
    
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
                    
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: AstronautView.init(astronaut: crewMember.astronaut)) {
                            
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 84, height: 60)
                                    .clipShape(Capsule())
                                
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    
                                    Text(crewMember.role)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        
        var matches = [CrewMembers]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: { (astronaut) in
                astronaut.id == member.name
            }) {
                matches.append(CrewMembers(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let mission: [Mission] = Bundle.main.decode(fileName: "missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode(fileName: "astronauts.json")
    
    static var previews: some View {
        MissionView(mission: mission[0], astronauts: astronauts)
    }
}
