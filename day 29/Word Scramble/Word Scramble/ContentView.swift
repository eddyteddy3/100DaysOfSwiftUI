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
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var textFieldWord = ""
    
    var body: some View {
        var wordArray = [String]()
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContent = try? String(contentsOf: fileURL) {
                let array = fileContent.components(separatedBy: "\n")
                wordArray = array
            }
        }
        
        return NavigationView {
            VStack {
                TextField("Enter the word", text: $textFieldWord, onCommit: addNewWord)
                .textFieldStyle(RoundedBorderTextFieldStyle()).shadow(radius: 8)
                    .padding()
                    .autocapitalization(.none)
                List(usedWords, id: \.self) {
                    Image(systemName: "\(self.usedWords.count).circle")
                    Text($0)
                }
            }.padding()
                .navigationBarTitle(rootWord)
        }
    }
    
    func addNewWord() {
        let answer = textFieldWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {return}
        
        usedWords.insert(answer, at: 0)
        textFieldWord = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
