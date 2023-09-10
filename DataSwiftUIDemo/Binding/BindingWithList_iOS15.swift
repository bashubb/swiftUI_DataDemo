//
//  BindingWithList_iOS15.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 10/09/2023.
//

import SwiftUI

struct BindingWithList_iOS15: View {
    
    @State private var people = [
        Person(firstName: "Andrew", lastName: "Mcdonald"),
        Person(firstName: "Lem", lastName: "Guerro"),
        Person(firstName: "Chris", lastName: "Evans")]
    
    var body: some View {
        NavigationStack{
            VStack {
                HeaderView("", subtitle: "Binding with list", desc: "You want to bind the array and an index for a two-way bind.", back: .yellow, textColor: .black)
                
                List($people) { $person in
                    NavigationLink(destination: EditPersonView(person: $person)) {
                        Text("\(person.firstName + " " + person.lastName)" )
                    }
                }
            }
            .font(.title)
            .navigationTitle("Editing Array Items")
        }
        
    }
}

struct BindingWithList_iOS15_Previews: PreviewProvider {
    static var previews: some View {
        BindingWithList_iOS15()
    }
}
