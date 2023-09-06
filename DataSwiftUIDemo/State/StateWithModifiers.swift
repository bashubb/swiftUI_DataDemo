//
//  StateWithModifiers.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 06/09/2023.
//

import SwiftUI

struct StateWithModifiers: View {
    
    @State private var isON = false
    
    var body: some View {
        VStack {
            HeaderView("State", subtitle: "With Modifiers", desc: "You can use state to control how your views look and change.", back: .blue, textColor: .white)
            Spacer()
            ZStack(alignment: isON ? .leading : .trailing) {
                HStack{
                    Text("OFF")
                        .opacity(isON ? 0 : 1)
                        .padding(.horizontal,5)
                    Text("ON")
                        .opacity(isON ? 1 : 0)
                        .padding(.horizontal,5)
                }
                .foregroundColor(.white)
                
                RoundedRectangle(cornerRadius:6)
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                    
                
            }
            .padding(6)
            .background(isON ? Color.green : Color.red)
            .cornerRadius(6)
            .onTapGesture {
                isON.toggle()
            }
            .animation(.default, value: isON)
            Spacer()
            
            DescView(desc: "The button's modifiers change because the vaule of a state variable is changing. The changes are all data driven.", back: .blue, textColor: .white)
            
            
        }
        .font(.title)
    }
}

struct StateWithModifiers_Previews: PreviewProvider {
    static var previews: some View {
        StateWithModifiers()
    }
}
