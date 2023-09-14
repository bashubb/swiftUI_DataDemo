//
//  AppStorage_Persistence.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 14/09/2023.
//

import SwiftUI

struct AppStorage_Persistence: View {
    
    @AppStorage("darkBackground") var darkBackground = false
    
    var body: some View {
        VStack {
            HeaderView("@AppStorage", subtitle: "Persistence", desc: "Data you store using @AppStorage will persist even after the app closes.", back: .orange, textColor: .black)
            
            Toggle("Use dark background", isOn: $darkBackground)
                .padding()
            
        }
        .font(.title)
        .preferredColorScheme(darkBackground ? .dark : .light)
    }
}

struct AppStorage_Presistence_Previews: PreviewProvider {
    static var previews: some View {
        AppStorage_Persistence()
    }
}
