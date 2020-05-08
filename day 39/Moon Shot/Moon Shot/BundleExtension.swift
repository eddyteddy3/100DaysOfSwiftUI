//
//  BundleExtension.swift
//  Moon Shot
//
//  Created by Moazzam Tahir on 03/05/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(fileName name: String) -> T {
        guard let fileUrl = self.url(forResource: name, withExtension: nil) else {
            fatalError("Failed to load file \(name).")
        }
        
        guard let data = try? Data(contentsOf: fileUrl) else {
            fatalError("Failed to load data contents of file \(fileUrl).")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let contents = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode the data from \(data).")
        }
        
        return contents
    }
}
