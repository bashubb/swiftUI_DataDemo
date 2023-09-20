//
//  OnChange_PreviousValue.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 20/09/2023.
//

import SwiftUI

struct OnChange_PreviousValue: View {
    @State private var rotation = Angle.degrees(0)
    @State private var size: CGFloat = 50
    @State private var color = Color.green
    
    
    var body: some View {
        VStack{
            HeaderView("onChange", subtitle: "Previous Value", desc: "The onChange modifieer can also ciew the precious value of the property that is being changed", back: .blue, textColor: .white)
            HStack(spacing: 75) {
                Button("Reset") {
                    rotation = Angle.degrees(0)
                }
                Button("Rotate") {
                    rotation = Angle.degrees(90)
                }
            }
            
            Spacer()
            
            Image(systemName: "l.joystick.tilt.up.fill")
                .rotationEffect(rotation)
                .font(.system(size: size))
                .foregroundColor(color)
                .animation(.default, value: rotation)
            
            Spacer()
            
            
        }
        .font(.title)
        .onChange(of: rotation) {[rotation] newValue in
            if rotation == newValue {return}
            if newValue == Angle.degrees(0) {
                size = 50
                color = Color.green
            } else {
                size = 100
                color = Color.red
            }
        }
    }
}

struct OnChange_PreviousValue_Previews: PreviewProvider {
    static var previews: some View {
        OnChange_PreviousValue()
    }
}
