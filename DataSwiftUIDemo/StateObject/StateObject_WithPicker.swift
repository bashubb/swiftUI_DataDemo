//
//  StateObject_WithPicker.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 11/09/2023.
//

import SwiftUI

class CarChoices: ObservableObject {
    @Published var cars: [String] = [""]
    @Published var selectedCar = ""
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {[self] in
            cars = ["Audi", "Honda", "Mazda", "Tesla", "Toyota"]
            selectedCar = cars[2]
        }
    }
}

struct StateObject_WithPicker: View {
    
    @StateObject private var carChoices = CarChoices()
    
    var body: some View {
        VStack {
            HeaderView("State Object", subtitle: "With Picker", desc: "Here's an example of binding a @StateObject property to a Picker.", back: .green, textColor: .black)
            
            Text("Select a car ")
            
            Picker(selection: $carChoices.selectedCar) {
                ForEach(carChoices.cars, id: \.self) { car in
                    Text(car).tag(car)
                }
            } label: {
                Text("Car Picker")
            }
            .pickerStyle(.wheel)
            .background(Color.green.opacity(0.2).cornerRadius(15))
            
            Text("You have selected a: ") + Text(carChoices.selectedCar).foregroundColor(.green)

        }
        .font(.title)
    }
}

struct StateObject_WithPicker_Previews: PreviewProvider {
    static var previews: some View {
        StateObject_WithPicker()
    }
}
