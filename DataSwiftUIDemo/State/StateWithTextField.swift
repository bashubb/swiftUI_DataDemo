//
//  StateWithTextField.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 05/09/2023.
//

import SwiftUI

struct StateWithTextField: View {
    
    @State private var name = ""
    
    var body: some View {
        VStack {
            HeaderView("State", subtitle: "Two-Way Binding", desc: "Add a dollar sing ($) before the variable name to create a two-way binding between a control and a state variable", back: .blue, textColor: .white)
            Spacer()
            TextField("name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            Text("Name:")
            Spacer()
            Text("\(name)")
                .font(.largeTitle)
                .fontWeight(.black)
            Spacer()
            DescView(desc: "A two-way binding means when the state variable is updated, the control hets updated.And when the control updates the value, the state variable gets updated.", back: .blue, textColor: .white)
            Spacer()
            
            
        }
        .font(.title)
    }
}

struct StateWithTextField_Previews: PreviewProvider {
    static var previews: some View {
        StateWithTextField()
    }
}
