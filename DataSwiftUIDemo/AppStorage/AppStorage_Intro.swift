//
//  AppStorage_Intro.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 14/09/2023.
//

import SwiftUI

// ParentView
struct AppStorage_Intro: View {
    @AppStorage("userName") var userName = "Mark"
    
    var body: some View {
        NavigationStack {
            VStack(spacing:20) {
                HeaderView("", subtitle: "Introduction", desc: "You can use @AppStorage to store small amounts of data for your app", back: .orange, textColor: .black)
                
                Text("AppStorage: username")
                Text("\(userName)")
                    .bold()
                NavigationLink("Edit", destination: AppStorage_Edit())
                
            }
            .font(.title)
            .navigationTitle("App Storage")
            
        }
    }
}


//Child View
struct AppStorage_Edit: View {
    @AppStorage("userName") var userName: String!
    @State private var newUserName = ""
    
    var body: some View {
        VStack {
            HeaderView("", subtitle: "Update AppStorage", desc: "To update AppStorage,just assign a new value to variable.", back: .orange, textColor: .black)
            Text("Enter a new user name:")
            TextField("userName", text: $newUserName)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            Button("Update") {
                userName = newUserName
            }
            
        }
        .font(.title)
        .navigationTitle("Update App Storage")
        
    }
}
struct AppStorage_Intro_Previews: PreviewProvider {
    static var previews: some View {
        AppStorage_Intro()
    }
}
