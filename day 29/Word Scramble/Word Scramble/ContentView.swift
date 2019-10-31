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
    
    func fetchWords() {
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContent = try? String(contentsOf: fileURL) {
                let array = fileContent.components(separatedBy: "\n")
                guard let word = array.randomElement() else {return}
                rootWord = word
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter the word", text: $textFieldWord, onCommit: addNewWord)
                .textFieldStyle(RoundedBorderTextFieldStyle()).shadow(radius: 8)
                    .padding()
                    .autocapitalization(.none)
                List(usedWords, id: \.self) {
                    Image(systemName: "\(self.usedWords.count).circle")
                    Text($0)
                }
            }
                .navigationBarTitle(rootWord)
            .navigationBarItems(trailing: Button(action: fetchWords){
                Text("Refresh")
            })
                .onAppear(perform: fetchWords)
        }
    }
    
    func addNewWord() {
        let answer = textFieldWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {return}
        
        guard isPossible(word: answer) else {return}
        guard isUsedBefore(word: answer) else {return}
        guard isPossible(word: answer) else {return}
        
        usedWords.insert(answer, at: 0)
        textFieldWord = ""
    }
    
    func isUsedBefore(word: String) -> Bool {
        if usedWords.contains(word) {
            return true
        } else {
            return false
        }
    }
    
    func isPossible(word: String) -> Bool {
        var rootWordCopy = rootWord
        
        for letter in word {
            if let position = rootWordCopy.firstIndex(of: letter) {
                rootWordCopy.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf8.count)
        let misSpellChecker = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misSpellChecker.location == NSNotFound
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
