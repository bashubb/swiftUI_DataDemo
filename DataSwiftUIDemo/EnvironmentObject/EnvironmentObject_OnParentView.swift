//
//  EnvironmentObject_OnParentView.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 18/09/2023.
//

import SwiftUI

class JustForTabTwo: ObservableObject {
    @Published var name: String = "This string is from environment Object"
}


struct EnvironmentObject_OnParentView: View {
    var body: some View {
        TabView {
            HeaderView("@EnvironmentObject", subtitle: "On Parent Views", desc: "There is no environment object set on thes view's parent view. So has no access to any environment objects.", back: .purple, textColor: .white)
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("one")
                }
            TabTwoView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("two")
                }
                .environmentObject(JustForTabTwo())
        }
        .font(.title)
    }
}




struct TabTwoView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                HeaderView("tab 2", subtitle: "On ParentView", desc: "Since the environmentobject was only added to this ciew, only child views from this parent can acces it ", back:.purple , textColor: .white)
                
                Text("Note: This view is not using the environment object but it could if it wanted to.")
                    .padding(.horizontal)
                
                NavigationLink("Navigate to Child View", destination: ChildViewTabTwo())
                
                Spacer()
            }
            .navigationTitle("@EnvironmentObject ")
        }
        
    }
}



struct ChildViewTabTwo: View {
    @EnvironmentObject var tabTwo: JustForTabTwo
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView("", subtitle: "On Parent View", desc: "This view is accessing the environment object set on the parent tab view.", back: .purple, textColor: .white)
                
                Label {
                    Text(tabTwo.name)
                } icon: {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.orange)
                }
                TextEditor(text: $tabTwo.name)
                    .border(Color.purple, width: 2)
                    .frame(height: 200)

            }
            .navigationTitle("Tab 2 Child View")
        }
    }
}
struct EnvironmentObject_OnParentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EnvironmentObject_OnParentView()
            ChildViewTabTwo()
                .environmentObject(JustForTabTwo())
        }
    }
}
