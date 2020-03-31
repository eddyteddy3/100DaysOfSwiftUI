//
//  ContentView.swift
//  Moon Shot
//
//  Created by Moazzam Tahir on 31/03/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            Image("headerImage")
            .resizable()
                .aspectRatio(contentMode: .fit)
            .frame(width: geo.size.width)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
