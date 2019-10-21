//
//  ContentView.swift
//  Views and Modifiers
//
//  Created by Moazzam Tahir on 20/10/2019.
//  Copyright © 2019 Moazzam Tahir. All rights reserved.
//

//MARK: Details
///Modifier Order matters because we call the modifier, it creates the new view and then stacks up the new view on top of it.
///Some View is there because it is to return any kind of same view back to SwiftUI/Compiler. Because if we write View instead, the whole thing would crash
///This is also called opaque type properties.
///we use ternary operator for conditional modifier.
///Environmental Modifiers can be applied to many views at same time but not every modifier is the same modifier.
///We can also use views as properties
///we can also use computed properties
///instead of duplicating the views again and again we can extract the subview to reduce the code. this is also called views composition.
///we can also use the custom modifier that will be utilized by every view, seperately
///Extensions can be utilized as well, to use the custom modifiers in smart way
///custom container can also be defined.
///
import SwiftUI

struct texts: View {
    var body: some View {
        Text("Hello")
    }
}

struct customModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.gray)
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension View {
    func customText() -> some View {
        self.modifier(customModifier())
    }
}

struct ContentView: View {
    @State var isText = false
    var textProperty1 = Text("This is view 1")
    var computedTextProperty: Text { Text("This is computed text View") }
    
    var body: some View {
        VStack {
            textProperty1
                .customText()
            computedTextProperty
                .modifier(customModifier())
            
            texts()
                .font(.largeTitle)
                .foregroundColor(.red)
            
            Button("Toggle Color") {
                self.isText.toggle()
            }.font(.subheadline)
            
            Text("Conditional Modifier")
                .foregroundColor(self.isText ? Color.red : Color.green)
            
            Text("Hello World")
                .background(Color.yellow)
                .padding()
                .background(Color.blue)
                .padding()
                .background(Color.green)
                .padding()
                .background(Color.red)
        }
        .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
