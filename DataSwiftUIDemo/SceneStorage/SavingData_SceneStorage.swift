//
//  SavingData_SceneStorage.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 16/09/2023.
//

import SwiftUI


// Parent View
struct SavingData_SceneStorage: View {
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView("", subtitle: "Introduction", desc: "Use @SceneStorage to save data for just one screen that will persist for the lifetime of the app.", back: .red, textColor: .black)
                
                NavigationLink("Enter New Data", destination: SavingData_DataEntry())
            }
            .font(.title)
            .navigationTitle("@SceneStorage")
        }
    }
}



// CHild View
struct SavingData_DataEntry: View {
    @SceneStorage("textInput") var textInput = ""
    @State var stateText = ""
    
    var body: some View {
        VStack{
            Spacer()
            DescView(desc: "Enter data in here and then navigate away. It will be saved to the variable using @SceneStorage", back: .red, textColor: .black)
            TextEditor(text: $textInput)
                .border(.pink)
                .padding()
            DescView(desc: "This data will not be saved because it's bound to @State variable", back: .red, textColor: .black)
            TextEditor(text: $stateText)
                .border(.pink)
                .padding()
        }
        .font(.title)
    }
}

struct SavingData_SceneStorage_Previews: PreviewProvider {
    static var previews: some View {
        SavingData_SceneStorage()
    }
}
