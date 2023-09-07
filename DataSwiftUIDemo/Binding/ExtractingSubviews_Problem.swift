//
//  ExtractingSubviews_Problem.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 07/09/2023.
//

import SwiftUI

struct ExtractingSubviews_Problem: View {
    
    @State var nameData = NameData(name: "Sean", lastName: "Ching")
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HeaderView("", subtitle: "Pass State Into Subview", desc: "Passing a State variable into the subview will allow you to read the values but the updates do not come back.", back: .yellow, textColor:.black)
                
                Spacer()
                
                Text("Full Name:")
                Text("\(nameData.name) \(nameData.lastName)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                NavigationLink {
                    EditNameView(nameData: nameData)
                } label: {
                    Text("Edit Name")
                }
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                

                
                Spacer()
            }
            .font(.title)
            .navigationTitle("Binding")
        }
    }
}

struct ExtractingSubviews_Problem_Previews: PreviewProvider {
    static var previews: some View {
        ExtractingSubviews_Problem()
    }
}

struct EditNameView: View {
    
    @State var nameData: NameData
    
    var body: some View {
        VStack{
            Spacer()
            Text("Edit and go back when done:")
            TextField("name", text: $nameData.name)
            TextField("last name", text: $nameData.lastName)
            
            Spacer()
            DescView(desc: "That's won't update the data in parent view", back: .yellow, textColor: .black)
            
            Spacer()
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .navigationTitle("Edit Name")
    }
}
