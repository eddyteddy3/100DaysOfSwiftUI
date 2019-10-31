//
//  ContentView.swift
//  Word Scramble
//
//  Created by Moazzam Tahir on 30/10/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//
///List can also be used as static views as in Forms.
///for the view made up of dynamic rows we can write List(0..<5) as well
//ID is used to identify the uniqueness of each row in List
///We use Bundle.main.url to access the files within the sandbox of an app.
///it is option, it might return nil.

import SwiftUI

struct ContentView: View {
    let array = ["eddy", "teddy", "moazzam", "galactus"]
    
    var body: some View {
        var textArray = [String]()
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContent = try? String(contentsOf: fileURL) {
                let array = fileContent.components(separatedBy: "\n")
                textArray = array
            }
        }
        
        return List(textArray, id: \.self) {
            Text($0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
