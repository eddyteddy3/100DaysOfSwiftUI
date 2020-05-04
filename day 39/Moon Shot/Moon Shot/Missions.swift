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
    var launchDate: String?
    var crew: [Crew]
    var description: String
}
