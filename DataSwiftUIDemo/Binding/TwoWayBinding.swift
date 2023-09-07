//
//  TwoWayBinding.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 07/09/2023.
//

import SwiftUI

struct TwoWayBinding: View {
    
    @State var nameData = NameData(name: "Sean", lastName: "Ching")
    
    var body: some View {
        NavigationStack {
            VStack(spacing:20) {
                HeaderView("", subtitle: "Solution with @Binding ", desc: "Subviews that recive state data should use @Binding for a two-way binding", back: .yellow, textColor: .black)
                
                Spacer()
                
                Text("Full Name :")
                Text("\(nameData.name) \(nameData.lastName)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                NavigationLink {
                    EditNameViewBind(nameData: $nameData)
                } label: {
                    Text("Edit Name")
                }
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)

                Spacer()
                
            }
            .navigationTitle("Binding")
            .font(.title)
            
        }
    }
}

struct TwoWayBinding_Previews: PreviewProvider {
    
    @State static var nameData = NameData(name: "Test", lastName: "Data")
    
    static var previews: some View {
    
        Group {
            TwoWayBinding()
            
            EditNameViewBind(nameData: $nameData)
                .previewLayout(.sizeThatFits)
            EditNameViewBind(nameData: Binding.constant(NameData(name:"Constant", lastName: "Data")))
                .previewLayout(.sizeThatFits)
            
        }
    }
}


struct EditNameViewBind: View {
    
    @Binding var nameData: NameData
    
    var body: some View {
        VStack {
            
            Text("Edit and go back when done:")
            TextField("name", text: $nameData.name)
            TextField("lastName", text: $nameData.lastName)
            
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .navigationTitle("Edit Name")
    }
}
