//
//  ContentView.swift
//  FaceFacts_SwiftData
//
//  Created by A.F. Adib on 14/1/25.
//  46:00

import SwiftUI
import SwiftData

struct ContentView: View {
   
    @State private var path = [Person]()
    @Environment(\.modelContext) var modelContext
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            
            PeopleView()
            .navigationTitle("FaceFacts")
            .navigationDestination(for: Person.self) { person in
               EditPersonView(person: person)
            }
            .toolbar {
                Button("Add Person", systemImage: "plus", action: addPerson)
            }
            .searchable(text: $searchText)
        }
    }
    
    
    func addPerson() {
        let  person = Person(name: "", emailAddress: "", details: "")
        modelContext.insert(person)
        path.append(person)
    }
    
    
}

#Preview {
    ContentView()
}
