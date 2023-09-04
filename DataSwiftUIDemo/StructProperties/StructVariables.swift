//
//  StructVariables.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 04/09/2023.
//

import SwiftUI

struct StructVariables: View {
    
    var name = "Marianna"
    
    var body: some View {
        VStack(spacing: 30) {
            HeaderView("State", subtitle: "Struct Variables", desc: "Variables in structs are immutable.Nutable means a variable can change. Immutable means a variable can NOT change.", back: .blue, textColor: .white)
            
            Button {
                //name = "Mark" // Error: Cannot assign to property 'self' is immutable
            } label: {
                Text("Change name to 'Mark'")
                    .padding()
                    .background(Capsule().stroke(Color.blue, lineWidth: 2))
            }
            
            Spacer()
            
            Text("Name:")
            Text("\(name)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            DescView(desc: "The name variable is read-only and cannot be updated", back: .blue, textColor: .white)
            
            Spacer()

        }
        .font(.title)
        
    }
}

struct StructVariables_Previews: PreviewProvider {
    static var previews: some View {
        StructVariables()
    }
}
