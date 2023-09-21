//
//  OnReceive_PublisherOutput.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 21/09/2023.
//

import SwiftUI


//ModelView
class OnReceiveViewOO: ObservableObject {
    @Published var name = "Max"
}

//View
struct OnReceive_PublisherOutput: View {
    @StateObject var oo = OnReceiveViewOO()
    @State private var savedValue = ""
    @State private var disabled = true
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("OnReceive", subtitle: "Publisher Output", desc:"Inspect the data sent by the publisher with the onReceive's  closure parameter.", back: .blue, textColor: .white)
            TextField("name", text: $oo.name)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button("Save") {
                savedValue = oo.name
            }
            .disabled(disabled)
            .onReceive(oo.$name) { newValue in
                disabled = (newValue == savedValue)
            }
            
            
            
        }
        .onAppear{
            savedValue = oo.name
        }
        .font(.title)
    }
}

struct OnReceive_PublisherOutput_Previews: PreviewProvider {
    static var previews: some View {
        OnReceive_PublisherOutput()
    }
}
