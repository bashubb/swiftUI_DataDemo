//
//  BindingWithList.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 10/09/2023.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var firstName = ""
    var lastName = ""
}



struct BindingWithList: View {
    
    @State private var people = [
        Person(firstName: "Andrew", lastName: "Mcdonald"),
        Person(firstName: "Lem", lastName: "Guerro"),
        Person(firstName: "Chris", lastName: "Evans")]
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView("", subtitle: "Binding With List", desc: "You want to bind the array and an index for a two-way bind ", back: .yellow, textColor: .black)
                
                List(people) {person in
                    NavigationLink(destination: EditPersonView(person:
                                                                $people[people.firstIndex(where: { $0.id == person.id })!])) {
                        Text("\(person.firstName + " " + person.lastName)" )
                    }
                    
                }
            }
            .font(.title)
            .navigationTitle("Editing Array Items")
        }
    }
}

struct BindingWithList_Previews: PreviewProvider {
    static var previews: some View {
        BindingWithList()
    }
}

struct EditPersonView: View {
    
    @Binding var person: Person
    
    var body: some View {
        VStack(spacing: 20) {
            
            Group {
               Text("Edit and go back when done:")
                TextField("name", text: $person.firstName)
                TextField("last name ", text: $person.lastName)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            
        }
        .font(.title)
        .navigationTitle("Edit Name")
    }
}
