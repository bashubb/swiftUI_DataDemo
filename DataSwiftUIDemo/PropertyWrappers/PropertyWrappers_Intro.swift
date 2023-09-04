//
//  PropertyWrappers_Intro.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 04/09/2023.
//

import SwiftUI


@propertyWrapper
struct FourCharacters {
    private var value = ""
    
    var wrappedValue:String {
        get { return value}
        set { value = String(newValue.prefix(4)) }
    }
}
// Apropert wrapper can be a: struct, enum, class  - with a wrappedValue property

struct PropertyWrappers_Intro: View {
    
    @State private var newPIN = ""
    
    var body: some View {
        VStack(spacing:20) {
            HeaderView("Property Wrappers", subtitle: "Introduction", desc: "Property wrappers allow you to add the same logic to many properties", back: .blue, textColor: .white)
            Text("Old PIN: 1234")
            Text("New PIN: 567890")
            Button("Save PIN") {
                @FourCharacters var newPin: String
                newPin = "567890" // the logic in the propert wrapper only uses the first 4 chatacters of the strin assigned
                newPIN = newPin
            }
            
            Text("Your New PIN:") +
            Text("\(newPIN)")
                .fontWeight(.bold)
            
        }
        .font(.title)
    }
}

struct PropertyWrappers_Intro_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrappers_Intro()
    }
}
