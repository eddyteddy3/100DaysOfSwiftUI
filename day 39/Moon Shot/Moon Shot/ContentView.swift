//
//  ContentView.swift
//  Moon Shot
//
//  Created by Moazzam Tahir on 31/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode(fileName: "astronauts.json")
    let missions: [Mission] = Bundle.main.decode(fileName: "missions.json")
    
    var body: some View {
        NavigationView.init {
            List(missions) { mission in
                NavigationLink(destination: Text("Detailed View")) {
                    Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    
                    VStack {
                        Text("\(mission.displayName)")
                            .font(.headline)
                        
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
        .navigationBarTitle("Apollo Missions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
