//
//  PeopleView.swift
//  FaceFacts_SwiftData
//
//  Created by A.F. Adib on 14/1/25.
//

import SwiftUI
import SwiftData

struct PeopleView: View {
    
    @Query var people : [Person]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        
        List {
            ForEach(people) { person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete(perform: deletePeople)
        }
    }
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Person>] = []) {
        _people = Query(filter: #Predicate { person in
            
            if searchString.isEmpty {
                true
            } else {
                person.name.localizedStandardContains(searchString)
                ||  person.emailAddress.localizedStandardContains(searchString)
                ||  person.details.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    
    func deletePeople(at offsets: IndexSet) {
        for offset in offsets {
            let person = people[offset]
            modelContext.delete(person)
        }
    }
}

#Preview {
    PeopleView()
}
