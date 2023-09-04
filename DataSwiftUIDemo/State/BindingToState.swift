//
//  BindingToState.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 04/09/2023.
//

import SwiftUI

struct BindingToState: View {
    
    @State var name  = "Marianna"
    // if this property won't be a 'private var' there is still an oportunity to pass the value to the view from the outside
    
    var body: some View {
        VStack {
            HeaderView("State", subtitle: "Struct Variables", desc: "Add @State before the variable to make it mutalble.", back: .blue, textColor: .white)
            
            Button {
                name = "Mark"
            } label: {
                Text("Change name to 'Mark'")
                    .padding()
                    .background(Capsule().stroke(Color.blue, lineWidth: 2))
            }
            
            Spacer()
            
            Text("Name:")
            Text("\(name)")
                .font(.largeTitle)
                .bold()
            
            Spacer()

        }
        .font(.title)
    }
}

struct BindingToState_Previews: PreviewProvider {
    static var previews: some View {
        BindingToState(name: "Joe")
    }
}
