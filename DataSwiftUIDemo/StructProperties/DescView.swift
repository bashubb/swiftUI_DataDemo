//
//  DescView.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 04/09/2023.
//

import SwiftUI

struct DescView: View {
    
    var desc:String = "description"
    var back:Color = .blue
    var textColor:Color = .white
    
    var body: some View {
        VStack{
            Text(desc)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(back)
        }
    }
}

struct DescView_Previews: PreviewProvider {
    static var previews: some View {
        DescView()
    }
}
