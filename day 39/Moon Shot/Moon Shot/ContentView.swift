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
        List(missions) { (astro) in
            Text("\(astro.crew[0].name)")
        }
        /*VStack {
            Text("\(astronauts.count)")
            Text("\(missions.count)")
        }*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
