//
//  ExtractingSubviews_Before.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 07/09/2023.
//

import SwiftUI

struct ExtractingSubviews_Before: View {
    
    @State var nameData = NameData(name:"Sean", lastName: "Ching")
    
    var body: some View {
        NavigationStack {
            VStack(spacing:20) {
                HeaderView("", subtitle: "Before", desc: "You may hace part of your view that uses a State variable value that you want to make into a Subview", back: .yellow, textColor: .black)
                
                Spacer()
                
                Text("Full name :")
                Text("\(nameData.name) \(nameData.lastName)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Group {
                    Text("Edit Name")
                    TextField("first name", text: $nameData.name)
                    TextField("last name", text: $nameData.lastName)
                }
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
                
                // And what if we want to extract this group into a seperate view ? 
                
                Spacer()
            }
            .font(.title)
            .navigationTitle("Binding")
            
            
        }
    }
}

struct ExtractingSubviews_Before_Previews: PreviewProvider {
    static var previews: some View {
        ExtractingSubviews_Before()
    }
}
