//
//  DecodableJSONInput.swift
//  Moon Shot
//
//  Created by Moazzam Tahir on 01/04/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import SwiftUI

struct DecodableJSONInput: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashvile"
                }
            }
            """
            
            struct User: Codable {
                let name: String
                let address: Address
            }
            
            struct Address: Codable {
                let street: String
                let city: String
            }
            
            let data = Data(input.utf8)
            
            let json = JSONDecoder()
            if let decodeData = try? json.decode(User.self, from: data) {
                print(decodeData.name)
            }
        }
    }
}

struct DecodableJSONInput_Previews: PreviewProvider {
    static var previews: some View {
        DecodableJSONInput()
    }
}
