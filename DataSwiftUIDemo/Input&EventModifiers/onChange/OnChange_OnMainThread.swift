//
//  OnChange_OnMainThread.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 20/09/2023.
//

import SwiftUI

struct OnChange_OnMainThread: View {
    @State private var input = ""
    @State private var validationColor = Color.red
    
    var body: some View {
        VStack {
            HeaderView("onChange", subtitle: "On Main Thread", desc: "It is important to note that the onChange code runs on the main thread.So use it to affect the UI but do not run long processes that could lock up the UI", back: .blue, textColor: .white)
            
            TextField("PIN (4 characterrs)", text: $input)
                .padding()
                .overlay(validationColor, in: RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2))
                .padding()
            
        }
        .font(.title)
        .onChange(of: input) { newValue in
            // SendToServerToValidate() <- don't do this
            
            validationColor = Color.red
            
            if newValue.count == 4 {
                validationColor = Color.green
            }
        }
    }
}

struct OnChange_OnMainThread_Previews: PreviewProvider {
    static var previews: some View {
        OnChange_OnMainThread()
    }
}
