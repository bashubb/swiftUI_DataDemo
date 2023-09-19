//
//  Environment_NotAvailableInInit.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 19/09/2023.
//

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var userName = "paulsundell"
}

struct Environment_NotAvailableInInit: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State private var  highlight = false
    
//    init() {
//        if viewModel.userName == "paulsundell" {
//            highlight = true
//        }
//    }
    
    var body: some View {
        VStack {
            HeaderView("@Environment Object ", subtitle: "Not Available in init()", desc: "You cant't access the environment object from your views init. If you find yourself trying to do this, there's probably a better solution in your problem.", back: .purple, textColor: .white)
            
            Text(viewModel.userName)
                .padding()
                .background(highlight ? Color.yellow : Color.clear)
        }
        .font(.title)
    }
}

struct Environment_NotAvailableInInit_Previews: PreviewProvider {
    static var previews: some View {
        Environment_NotAvailableInInit()
            .environmentObject(UserViewModel())
    }
}
