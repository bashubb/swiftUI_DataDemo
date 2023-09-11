//
//  SwiftUIView.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 11/09/2023.
//

import SwiftUI

class Car: ObservableObject {
    @Published var year: String
    @Published var make: String
    
    init(year: String, make: String) {
        self.year = year
        self.make = make
    }
}

struct StateObject_Intro: View {
    
    @StateObject var car  = Car(year: "2020", make: "Honda")
    
    var body: some View {
        VStack{
            HeaderView("State Object", subtitle: "Introduction", desc: "Use the @StateObject property wrapper for two-way binding between a class and your UI", back: .green, textColor: .black)
            
            Text("\(car.year + " " + car.make)")
                .font(.largeTitle)
                .bold()
            VStack{
                TextField("year", text: $car.year)
                TextField("make", text: $car.make)
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
        .font(.title)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StateObject_Intro()
    }
}
