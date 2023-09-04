//
//  HeaderView.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 04/09/2023.
//

import SwiftUI

struct HeaderView: View {
    
    var title:String = "title"
    var subtitle:String = "subtitle"
    var desc:String = "description"
    var back:Color = .blue
    var textColor:Color = .white
    
    init(_ title: String, subtitle:String, desc: String, back:Color, textColor:Color){
        
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }
    
    var body: some View {
        VStack(spacing:20){
            Text(title)
                .foregroundColor(.primary)
                .font(.largeTitle)
            Text(subtitle)
                .foregroundColor(.gray)
            Text(desc)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(back)
                
            
        }
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        
        let title:String = "title"
        let subtitle:String = "subtitle"
        let desc:String = "description"
        let back:Color = .blue
        let textColor:Color = .white
        
        HeaderView(title,subtitle: subtitle, desc: desc, back: back, textColor: textColor)
    }
}
