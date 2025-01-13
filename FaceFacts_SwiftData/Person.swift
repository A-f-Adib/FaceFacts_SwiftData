//
//  Person.swift
//  FaceFacts_SwiftData
//
//  Created by A.F. Adib on 14/1/25.
//

import Foundation

class Person {
    var name: String
    var emailAddress: String
    var details: String
    
    init(name: String, emailAddress: String, details: String) {
        self.name = name
        self.emailAddress = emailAddress
        self.details = details
    }
}
