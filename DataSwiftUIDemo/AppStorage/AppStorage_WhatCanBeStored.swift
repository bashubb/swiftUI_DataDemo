//
//  AppStorage_WhatCanBeStored.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 14/09/2023.
//

import SwiftUI

struct AppStorage_WhatCanBeStored: View {
    @AppStorage("myBool") var myBool = true
    @AppStorage("myInt") var myInt = 21
    @AppStorage("myDouble") var myDouble = 1.99
    @AppStorage("myString") var myString = "ABCabc"
    @AppStorage("myURL") var myURL = URL(string: "https://www.google.com")!
    @AppStorage("myData") var myData = Data("Hello 🤚".utf8)
    
    var body: some View {
        VStack(spacing:20){
            HeaderView("AppStorage", subtitle: "What Can Be Stored?", desc:"Currently, you can store: Bool, Int, Double, String, URL, Data.", back: .orange, textColor: .black)
            
            Text("Stored in AppStorage")
                .bold()
            Text("\(myBool.description)")
            Text("\(myInt)")
            Text("\(myDouble)")
            Text("\(myString)")
            Link("\(myURL)", destination: myURL).font(.title2)
            Text("\(String(decoding: myData, as: UTF8.self))")
        }
        .font(.title)
    }
}

struct AppStorage_WhatCanBeStored_Previews: PreviewProvider {
    static var previews: some View {
        AppStorage_WhatCanBeStored()
    }
}
