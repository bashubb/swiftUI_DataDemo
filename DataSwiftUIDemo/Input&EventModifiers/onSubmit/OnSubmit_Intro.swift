//
//  OnSubmit_Intro.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 21/09/2023.
//

import SwiftUI

struct OnSubmit_Intro: View {
    @State private var name = ""
    @State private var continueOnboarding = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView("", subtitle: "Introduction", desc: "Use onSUbmit to run code when a user submits data in some way.Submit can be different for different controls and views", back: .blue, textColor: .white)
                
                TextField("name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .submitLabel(.continue)
                    .onSubmit {
                        continueOnboarding = true
                    }
                
                Spacer()
            }
            .navigationDestination(isPresented: $continueOnboarding) {
                Text("Next Step")
            }
            .navigationTitle("onSubmit")
            .font(.title)
        }
    }
}

struct OnSubmit_Intro_Previews: PreviewProvider {
    static var previews: some View {
        OnSubmit_Intro()
    }
}
