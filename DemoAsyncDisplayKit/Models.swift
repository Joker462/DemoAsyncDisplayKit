//
//  Models.swift
//  DemoAsyncDisplayKit
//
//  Created by Hung Thai Minh on 1/3/17.
//  Copyright © 2017 Hung. All rights reserved.
//

import Foundation

struct Group {
    let createdAt: Double!
    let photoUrl: URL!
    let city: String!
    let country: String!
    let organizer: Organizer!
    
    var timeInterval: String {
        let date = Date(timeIntervalSince1970: createdAt)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: date)
    }
}



struct Organizer {
    let name: String!
    let thumbUrl: URL!
}
