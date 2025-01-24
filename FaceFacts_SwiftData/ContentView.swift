//
//  ContentView.swift
//  FaceFacts_SwiftData
//
//  Created by A.F. Adib on 14/1/25.
//  46:00

import SwiftUI
import SwiftData

struct ContentView: View {
   
    @State private var path = NavigationPath()
    @Environment(\.modelContext) var modelContext
    
    @State private var sortOrder = [SortDescriptor(\Person.name)]
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            
            PeopleView(searchString: searchText, sortOrder: sortOrder)
            .navigationTitle("FaceFacts")
            .navigationDestination(for: Person.self) { person in
                EditPersonView(person: person, navigationPath: $path)
            }
            
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name (A-Z)")
                            .tag([SortDescriptor(\Person.name)])
                        
                        Text("Name (Z-A)")
                            .tag([SortDescriptor(\Person.name, order: .reverse)])
                    }
                }
                
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
    
    do {
        let previewer = try Previewer()
        
        return ContentView()
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
