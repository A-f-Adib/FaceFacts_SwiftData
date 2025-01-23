//
//  Event.swift
//  FaceFacts_SwiftData
//
//  Created by A.F. Adib on 23/1/25.
//

import Foundation
import SwiftData

@Model
class Event {
    var name: String
    var location: String
    var people = [Person]()
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
