//
//  OnRecive_WithEnvironmentObject.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 21/09/2023.
//

import SwiftUI

class UserModel1: ObservableObject {
    @Published var username = "Ellen"
    @Published var showAsOnLine = true
}

struct OnRecive_WithEnvironmentObject: View {
    @EnvironmentObject var user: UserModel1
    @State private var reconnect = false
    var body: some View {
        VStack {
            HeaderView("onReceive", subtitle: "With EnvironmentObject", desc: "Use on Receive to respond to global environment object changes too", back: .blue, textColor: .white)
            Button("Disconnect") {user.showAsOnLine = false}
                .disabled(reconnect)
            Spacer()
            if reconnect {
                HStack {
                    Text("Disconnected")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button("Reconnect") {user.showAsOnLine = true}
                        .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Color.red)
            }
        }
        .font(.title)
        .onReceive(user.$showAsOnLine) { online in
            if online == false {
                reconnect = true
            } else {
                reconnect = false
            }
        }
    }
}

struct OnRecive_WithEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        OnRecive_WithEnvironmentObject()
            .environmentObject(UserModel1())
    }
}
