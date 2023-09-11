//
//  BindingWithLazyVStack.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 11/09/2023.
//

import SwiftUI

struct BindingWithLazyVStack: View {
    
    @State private var people = [
        Person(firstName: "Andrew", lastName: "Mcdonald"),
        Person(firstName: "Lem", lastName: "Guerro"),
        Person(firstName: "Chris", lastName: "Evans")]
    
    @State private var selectedPersonID: UUID?
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    LazyVStack {
                        HeaderView("", subtitle: "Binding With Lazy VStack", desc: "You want to bind the array and index for a two-way bind.", back: .yellow, textColor: .black)
                        
                        ForEach(people) { person in
                            HStack {
                                Text("\(person.firstName + " " + person.lastName)")
                                Spacer()
                                Image(systemName: "pencil.circle")
                                    .foregroundColor(.blue)
                            }
                            .padding()
                            .onTapGesture {
                                selectedPersonID = person.id
                            }
                        }
                    }
                }
                if let id = selectedPersonID {
                    EditPersonPopupView(person: $people[people.firstIndex(where: { person in person.id == selectedPersonID})!], selectedPersonID: $selectedPersonID)
                }
                
            }
            .font(.title)
            .navigationTitle("LazyVStack: Editing")
        }
    }
}

struct BindingWithLazyVStack_Previews: PreviewProvider {
    static var previews: some View {
        BindingWithLazyVStack()
    }
}


struct EditPersonPopupView: View {
    
    @Binding var person: Person
    @Binding var selectedPersonID: UUID!
    
    var body : some View {
        VStack {
            Text("Edit Name")
                .font(.largeTitle)
                .padding()
            Group {
                TextField("first name", text: $person.firstName)
                TextField("last name", text: $person.lastName)
            }
            .font(.title)
            .padding(.horizontal)
                
            Button("Close"){
                selectedPersonID = nil
            }
            .padding()
            
        }
        .font(.title)
        .textFieldStyle(.roundedBorder)
        .background(RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .shadow(radius: 5))
        .padding()
        
        
    }
}
