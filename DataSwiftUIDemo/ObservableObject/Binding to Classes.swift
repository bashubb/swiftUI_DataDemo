//
//  Binding to Classes.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 11/09/2023.
//

import SwiftUI

class CarInformation: ObservableObject {
    var year = ""
    var make = ""
}

struct Binding_to_Classes: View {
    
    @StateObject var carData = CarInformation()
    
    var body: some View {
        VStack{
            HeaderView("Class Data ", subtitle:"Binding to Classes", desc: "Step 1: Have your class conform to ObservableObject. \nStep 2: Assign it to a variable with the property wrapper @StateObject", back: .purple, textColor: .white)
            
            GroupBox {
                TextField("year", text: $carData.year)
                TextField("make", text: $carData.make)
            } label: {
                Text("Enter car year and make")
            }
            .textFieldStyle(.roundedBorder)
            .padding(.vertical)
            
            Text("Car Information")
            Text("\(carData.year + " " + carData.make)")
            
            DescView(desc: "Notice the Text ciew still isn't getting updated.There is a third step...", back: .purple , textColor:.white)
            
            

        }
        .font(.title)
    }
}

struct Binding_to_Classes_Previews: PreviewProvider {
    static var previews: some View {
        Binding_to_Classes()
    }
}
