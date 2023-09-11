//
//  ClassData_Solution.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 11/09/2023.
//

import SwiftUI

class CarInfo: ObservableObject {
    @Published var year = ""
    @Published var make = ""
}

struct ClassData_Solution: View {
    
    @StateObject var carInfo = CarInfo()
    
    var body: some View {
        VStack {
            HeaderView("Class Data ", subtitle: "Publishing Your Properties", desc: "The last thing that needs to be done is to publish the variables form your data class so bound views will receive any changed data.", back: .purple, textColor: .white)
            
            GroupBox {
                TextField("car year", text: $carInfo.year)
                TextField("car make", text: $carInfo.make)
            } label: {
                Text("Enter car year and make")
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            
            Text("Car Information:")
            Text("\(carInfo.year + " " + carInfo.make)")
            
            DescView(desc:"And now it works! This is a two-way bind.", back: .purple, textColor: .white)

            
        }
        .font(.title)
    }
}

struct ClassData_Solution_Previews: PreviewProvider {
    static var previews: some View {
        ClassData_Solution()
    }
}
