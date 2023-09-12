//
//  StateObject_BindingWithOtherViews.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 12/09/2023.
//

import SwiftUI

class BindingExamples: ObservableObject {
    @Published var color = Color.green
    @Published var date  = Date ()
    @Published var slider = 0.75
    @Published var stepper = 25
    @Published var text = "This is a one way bind"
    @Published var textField = "This is a two way bind"
    @Published var textEditior = "TextEditor data"
    @Published var toggle = true
}


struct StateObject_BindingWithOtherViews: View {
    
    @StateObject var examples = BindingExamples()
    
    var body: some View {
        VStack {
            HeaderView("StateObject", subtitle: "Bilding with Other Views", desc: "Here are some examples of binding with other biews using a @StateObject property.", back: .green, textColor: .black)
            
            Form {
                ColorPicker("ColorPicker", selection: $examples.color)
                DatePicker("DatePicker", selection: $examples.date)
                Slider(value: $examples.slider)
                Stepper("Value: \(examples.stepper)", value: $examples.stepper, in: 0...100)
                Text(examples.text)
                TextField("Text field", text: $examples.textField)
                TextEditor(text: $examples.textEditior)
                Toggle("Toggle", isOn: $examples.toggle)
                
            }
        }
        .font(.title)
    }
}
struct StateObject_BindingWithOtherViews_Previews: PreviewProvider {
    static var previews: some View {
        StateObject_BindingWithOtherViews()
    }
}
