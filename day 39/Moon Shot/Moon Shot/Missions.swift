//
//  Missions.swift
//  Moon Shot
//
//  Created by Moazzam Tahir on 04/05/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import Foundation

struct Crew: Codable {
    var name: String
    var role: String
}

struct Mission: Codable, Identifiable {
    var id: Int
    var launchDate: Date?
    var crew: [Crew]
    var description: String
    
    var displayName: String {
        return "Apollo \(id)"
    }
    
    var image: String {
        return "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchdate = launchDate {
            let formatter =  DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchdate)
        } else {
            return "N/A"
        }
    }
}
