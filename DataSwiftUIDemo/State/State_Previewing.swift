//
//  State_Previewing.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 07/09/2023.
//

import SwiftUI

struct State_Previewing: View {
    
    @State var featureOne: Bool = true // It has to be public property
    
    var body: some View {
        VStack {
            HeaderView("State", subtitle: "Previewing", desc:"You can create static @State variables in your Preview to test with different values.", back: .blue, textColor: .white)
            
            Toggle("Feature One", isOn: $featureOne)
                .padding()
            
        }
        .font(.title)
    }
}

struct State_Previewing_Previews: PreviewProvider {
    static var previews: some View {
        State_Previewing(featureOne: false)
        State_Previewing(featureOne: true)
    }
}
