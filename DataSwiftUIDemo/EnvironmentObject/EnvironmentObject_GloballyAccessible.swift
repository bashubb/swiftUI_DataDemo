//
//  EnvironmentObject_GloballyAccessible.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 18/09/2023.
//

import SwiftUI

class UserModel: ObservableObject {
    @Published var username = "Ellen"
    @Published var showAsOnLine = true
}


// enviromentObject modifier can be added to a root view then it has to be used only ONE TIME on the parent View and it is accessible in every child View
//@main
//struct YourApp: App {
//    WindowGroup {
//        EnvironmentObject_GloballyAccessible()
//            .environmentObject(UserModel())
//    }
//}



struct EnvironmentObject_GloballyAccessible: View {
    @EnvironmentObject var user: UserModel
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("@EnvironmentObject", subtitle: "Globally Accessible", desc: "To make an ObservableObject globally accessible to your app, add it to the root view in your App object", back: .purple, textColor: .white)
            
            Form{
                Section {
                    HStack {
                        Text("Username:")
                        TextField("username", text: $user.username)
                            .textFieldStyle(.roundedBorder)
                    }
                    Toggle("Show as online", isOn: $user.showAsOnLine)
                } header: {
                    Text("Settings")
                }

            }
        }
        .font(.title)
    }
}

struct EnvironmentObject_GloballyAccessible_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObject_GloballyAccessible()
            .environmentObject(UserModel())
    }
}
