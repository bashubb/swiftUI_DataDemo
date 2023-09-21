//
//  OnReceive_Intro.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 21/09/2023.
//

import SwiftUI

// ViewModel

class OnReceiveOO: ObservableObject {
    @Published var data: [String] = []
    
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
            data = ["Datum 1", "Datum 2", "Datum 3"]
        }
    }
}


// View
struct OnReceive_Intro: View {
    @StateObject var oo = OnReceiveOO()
    @State private var isProcesing = true
    
    var body: some View {
        
        VStack  {
            HeaderView("onReceive", subtitle: "Introduction", desc: "Use onReceive to run code when a publisher from an observed object changes value.", back: .blue, textColor: .white)
            
            
            ZStack{
                List(oo.data, id: \.self) { datum in
                    Text(datum)
                }
                
                if isProcesing {
                    ProgressView()
                        .padding()
                        .background(Color.black.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .onAppear{
                oo.fetchData()
        }
        .onReceive(oo.$data) { [data = oo.data] newData in
            if data == newData {
                return
            } else {
                isProcesing = false
            }
        }
        .font(.title)
        
        
        
    }
}

struct OnReceive_Intro_Previews: PreviewProvider {
    static var previews: some View {
        OnReceive_Intro()
    }
}
