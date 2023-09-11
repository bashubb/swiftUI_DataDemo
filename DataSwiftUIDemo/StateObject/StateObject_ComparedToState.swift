//
//  StateObject_ComparedToState.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 11/09/2023.
//

import SwiftUI

struct StateObject_ComparedToState: View {
    
    @State var car = Car(year: "2022", make: "Ford")
    
    var body: some View {
        VStack {
            HeaderView("StateObject", subtitle: "Compared to Stated", desc: "If you try to use @State with a class, it won't provide two-way binding.", back: .green, textColor: .black)
            
            Text("\(car.year + " " + car.make)")
                .font(.largeTitle)
                .bold()
            VStack {
                TextField("year", text: $car.year)
                TextField("make", text: $car.make)
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            
            DescView(desc: "@StateObject is just for binding to classes, not structs. Use @StateObject with classes and @State with value types.", back: .green, textColor: .black)
            
        }
        .font(.title)
    }
        
}

struct StateObject_ComparedToState_Previews: PreviewProvider {
    static var previews: some View {
        StateObject_ComparedToState()
    }
}
