//
//  PropertyWrappers.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 05/09/2023.
//

import SwiftUI

struct PropertyWrappers: View {
    
    @State private var name = ""
    private let names = ["Mark", "Scott", "Chris", "Sean", "Paul"]
    
    var body: some View {
        VStack {
            HeaderView("State", subtitle: "Property Wrappers", desc: "Property wrappers can run some logic every time a variable is changed. We can't mutate struct variable values.But @State runs logic that allows variable changes.", back: .blue, textColor: .white)
                .layoutPriority(1)
            
            Spacer()
            Button("Random Name") {
                name = names.randomElement() ?? ""
            }
            
            Spacer()
            
            Text("Name: \(name)")
            Spacer()
            
            DescView(desc: "Modifying a @State variable value does at least two things. 1. Stores our value outside of the struct. 2. Recreates our view without losing the state variable value.", back: .blue, textColor: .white)
            Spacer()
        }
        .font(.title)
    }
}

struct PropertyWrappers_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrappers()
    }
}
