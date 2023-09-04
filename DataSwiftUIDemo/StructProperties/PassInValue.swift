//
//  PassInValue.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 04/09/2023.
//

import SwiftUI

struct PassInValue: View {
    
    var name = "Marianna"
    
    var body: some View {
        VStack {
            HeaderView("State", subtitle: "Struct Variables", desc: "You can pass read-only values", back: .blue, textColor: .white)
            
            Spacer()
            Text("Name:")
            Text("\(name)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Spacer()
            
            DescView(desc: "The default name is Marianna but 'Mark' is passed in to replace it. In cannot be further updated once initially set.", back: .blue, textColor: .white)
            
            Spacer()
        }
        .font(.title)
    }
}

struct PassInValue_Previews: PreviewProvider {
    static var previews: some View {
        PassInValue(name: "Mark")
    }
}
