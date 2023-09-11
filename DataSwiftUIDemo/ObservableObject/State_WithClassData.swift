//
//  State_WithClassData.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 11/09/2023.
//

import SwiftUI


class CarData{
    var year = ""
    var make = ""
}

struct State_WithClassData: View {
    
    @State var carData = CarData()
    
    var body: some View {
        
        VStack(spacing:20) {
            
            HeaderView("Class Data", subtitle: "Working with Classes", desc: "What happens when you try to use a class with @State?", back: .purple, textColor: .white)
                .layoutPriority(1)
            
            GroupBox{
                TextField("car year", text: $carData.year)
                TextField("car make", text: $carData.make)
            } label: {
                Text("Enter car year and make")
            }
            .textFieldStyle(.roundedBorder)
            
            Text("Car Information")
            Text("\(carData.year + " " + carData.make)")
            
            DescView(desc: "The Text view no longer gets updated. How do you fix this", back: .purple, textColor: .white)
            
            Spacer()
        }
        .font(.title)
        
    }
}

struct State_WithClassData_Previews: PreviewProvider {
    static var previews: some View {
        State_WithClassData()
    }
}
