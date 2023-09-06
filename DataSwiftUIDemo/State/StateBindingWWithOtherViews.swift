//
//  StateBindingWWithOtherViews.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 06/09/2023.
//

import SwiftUI

struct BindingToStateExamples {
    var color = Color.blue
    var date = Date()
    var slider  = 0.75
    var stepper = 25
    var text = "This is a one way bind"
    var textField = "This is a one way bind"
    var textEditor = "TextEditor data"
    var toggle = true
}

struct StateBindingWWithOtherViews: View {
    
    @State private var examples = BindingToStateExamples()
    
    var body: some View {
        VStack{
            HeaderView("State", subtitle: "Binding With Other Views", desc: "Here are some examples of binding with other views using a @State property.", back: .blue, textColor: .white)
            
            Form {
                ColorPicker("Color Picker", selection: $examples.color)
                DatePicker("Date", selection: $examples.date)
                Slider(value: $examples.slider, in: 0...25)
                Stepper("Stepper", value: $examples.stepper, in: 0...100)
                Text(examples.text)
                TextField("Placeholder", text: $examples.textField)
                    .textFieldStyle(.roundedBorder)
                TextEditor(text: $examples.textEditor)
                    .border(Color.blue)
                    
                Toggle("Toggle", isOn: $examples.toggle)
                
                
            }
        }
        .font(.title)
    }
}

struct StateBindingWWithOtherViews_Previews: PreviewProvider {
    static var previews: some View {
        StateBindingWWithOtherViews()
    }
}
