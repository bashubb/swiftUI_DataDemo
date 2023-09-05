//
//  StateWithPicker.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 05/09/2023.
//

import SwiftUI

struct StateWithPicker: View {
    
    @State private var selectedName = "Scott"
    private let names = ["Mark", "Scott", "Chris", "Sean", "Paul"]
    
    var body: some View {
        VStack {
            HeaderView("State", subtitle: "Two-way Binding: Picker", desc: "Every time the picker scrolls, the state variable is getting updated. The Reset button can change the state variable value and the pickern will update", back: .blue, textColor: .white)
            
            Spacer()
            Picker("Name", selection: $selectedName) {
                ForEach(names, id: \.self) {name in
                    Text("\(name)")
                }
            }
            .pickerStyle(.wheel)
            
            Spacer()
            Button("Reset") {
                selectedName = "Scott"
            }
            Spacer()
            DescView(desc: "Text views can only have read-only bindings.", back: .blue, textColor: .white)
            
            Text("Selected: \(selectedName)")
        }
        .font(.title)
    }
}

struct StateWithPicker_Previews: PreviewProvider {
    static var previews: some View {
        StateWithPicker()
    }
}
