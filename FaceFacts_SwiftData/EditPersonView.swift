//
//  EditPersonView.swift
//  FaceFacts_SwiftData
//
//  Created by A.F. Adib on 14/1/25.
//

import SwiftUI
import SwiftData

struct EditPersonView: View {
    
    @Bindable var person: Person
    
    @Query(sort: [
        SortDescriptor(\Event.name),
        SortDescriptor(\Event.location)
    ]) var events: [Event]
    
    
    var body: some View {
        
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)
                
                TextField("Email Address", text: $person.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            Section("Where did you meet them?") {
                Picker("Met at", selection: $person.metAt) {
                    Text("Unknown event")
                    
                    if events.isEmpty == false {
                        Divider()
                        
                        ForEach(events) { event in
                            Text(event.name)
                        }
                    }
                }
                Button("Add a new event", action: addEvent)
            }
            
            Section("Notes") {
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addEvent() {
        
    }
}
//
//#Preview {
//    EditPersonView(person: Person(name: "abc", emailAddress: "cde", details: "ghi"))
//}
