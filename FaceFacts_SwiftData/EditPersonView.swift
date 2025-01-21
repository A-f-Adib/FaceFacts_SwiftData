//
//  EditPersonView.swift
//  FaceFacts_SwiftData
//
//  Created by A.F. Adib on 14/1/25.
//

import SwiftUI

struct EditPersonView: View {
    
    @Bindable var person: Person
    
    var body: some View {
        
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)
                
                TextField("Email Address", text: $person.emailAddress)
                    .textContentType(.emailAddress)
            }
            
            Section("Notes") {
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
    }
}
//
//#Preview {
//    EditPersonView(person: Person(name: "abc", emailAddress: "cde", details: "ghi"))
//}
