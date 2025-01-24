//
//  Previewer.swift
//  FaceFacts_SwiftData
//
//  Created by A.F. Adib on 24/1/25.
//

import Foundation
import SwiftData

@MainActor
struct Previewer {
    
    let container : ModelContainer
    let event: Event
    let person: Person
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Person.self, configurations: config)
        
        event = Event(name: "Abc", location: "Def")
        person = Person(name: "Xyz", emailAddress: "Wxy.com", details: "Mno", metAt: event)
        
        container.mainContext.insert(person)
    }
}
