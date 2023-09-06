//
//  StateWithStructData.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 06/09/2023.
//

import SwiftUI

struct NameData {
    var name = ""
    var lastName = ""
}


struct StateWithStructData: View {
    
    @State private var nameData =  NameData()
    
    var body: some View {
        VStack{
            HeaderView("State", subtitle: "Working With Structs", desc: "You can use a struct for your singles source of truth", back: .blue, textColor: .white)
            Text("Full Name:")
            
            Text("\(nameData.name) \(nameData.lastName)")
                .fontWeight(.bold)
            
            Spacer()
            Group {
                Text("First and last names are both in the same struct")
                    
                TextField("first name", text: $nameData.name)
                TextField("last name", text: $nameData.lastName)
            }
            .padding(.horizontal)
            .textFieldStyle(.roundedBorder)
            
            Spacer()
            
        }
        .font(.title)
    }
}

struct StateWithStructData_Previews: PreviewProvider {
    static var previews: some View {
        StateWithStructData()
    }
}
