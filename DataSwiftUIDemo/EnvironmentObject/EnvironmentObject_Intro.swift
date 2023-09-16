//
//  EnvironmentObject_Intro.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 16/09/2023.
//

import SwiftUI

class NameInfo: ObservableObject {
    var name: String = "Awesome Developer"
}


// Parent View
struct EnvironmentObject_Intro: View {
    var body: some View {
        TabView {
            TabViewOne()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("One")
                }
            TabViewTwo()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Two")
                }
        }
        .environmentObject(NameInfo())
        .font(.title)
    }
}


// Child Views

struct TabViewOne: View {
    @EnvironmentObject var nameInfo: NameInfo
    
    var body: some View {
        VStack {
            HeaderView("Tab1 \n@EnvironmentObject", subtitle: "Introduction", desc: "Use the environmentObject modifier to add ObservableObjects to parent views.", back: .purple, textColor: .white)
                .multilineTextAlignment(.center)
            
            Spacer()
            TextField("name", text: $nameInfo.name)
                .textFieldStyle(.roundedBorder)
                .padding()
            Spacer()
        }
        
    }
}


struct TabViewTwo: View {
    @EnvironmentObject var nameInfo: NameInfo
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Tab2 \n@EnvironmentObject", subtitle: "Introduction", desc: "This view can access the environment object by using the @EnvironmentObject property wrapper.", back: .purple, textColor: .white)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("The name you entered on Tab 1 was:")
            Text("\(nameInfo.name)").bold()
            
            Spacer()
        }
    }
}

struct EnvironmentObject_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EnvironmentObject_Intro()
                .environmentObject(NameInfo())
            
        }
            
    }
}
