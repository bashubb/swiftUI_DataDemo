//
//  StateObject_PassInObject.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 12/09/2023.
//

import SwiftUI

struct StateObject_PassInObject: View {
    
    @StateObject var car = Car(year: "2022", make: "Tacoma")
    
    var body: some View {
        VStack {
            HeaderView("StateObject", subtitle: "Previewing", desc: "You can also pass in an instantiated class to the @StateObject.", back: .green, textColor: .black)
            
            Text("\(car.year + " " + car.make)")
                .font(.largeTitle)
                .bold()
                
            Group{
                TextField("year", text: $car.year)
                TextField("make", text: $car.make)
            }
            .padding(.horizontal)
            .textFieldStyle(.roundedBorder)
        }
        .font(.title)
    }
}

struct StateObject_PassInObject_Previews: PreviewProvider {
   
    static var toyota = Car(year: "2021", make: "Tacoma")
    static var tesla = Car(year: "2021", make: "Tesla")
    
    static var previews: some View {

        Group {
            StateObject_PassInObject(car: toyota)
                .previewLayout(.sizeThatFits)
            StateObject_PassInObject(car: tesla)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
