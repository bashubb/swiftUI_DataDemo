//
//  StateWithClassData.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 07/09/2023.
//

import SwiftUI

class NameClass {
    var firstName = ""
    var lastName = ""
    
    init(first:String, last: String) {
        firstName = first
        lastName = last
    }
}


struct StateWithClassData: View {
    
    @State private var name = NameClass(first: "Fernanda", last: "Cruz")
    
    var body: some View {
        VStack(spacing:20){
            HeaderView("State ", subtitle: "Working With Classes", desc: "A class can be used for a one way bind.", back: .blue, textColor: .white)
                .layoutPriority(1)
            
            Text("Full Name:")
            Text("\(name.firstName) \(name.lastName)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack {
                Text("Try updating the name:")
                TextField("first name", text: $name.firstName)
                TextField("last name", text: $name.lastName)
            }
            .textFieldStyle(.roundedBorder)
            
            Spacer()
            
            DescView(desc: "But it won't work for two-way binds.Notice the screen isn't updating the name", back: .blue, textColor: .white)
            Spacer()
        }
        .font(.title)
    }
}

struct StateWithClassData_Previews: PreviewProvider {
    static var previews: some View {
        StateWithClassData()
    }
}
