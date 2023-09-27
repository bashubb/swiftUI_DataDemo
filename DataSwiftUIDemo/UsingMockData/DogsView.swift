//
//  DogsView.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 27/09/2023.
//

import SwiftUI

struct DogsView: View {
    @StateObject private var oo = DogsOO()
    
    var body: some View {
        VStack {
            List(oo.data) {dog in
                Text(dog.name)
            }
        }
        .onAppear{
            oo.fetch()
        }
    }
}

#Preview {
    DogsView()
}


class DogsOO: ObservableObject {
    @Published var data : [DogsDO] = []
    
    func fetch() {
        #if DEBUG // Mock data here
        data = [DogsDO(name: "Saint Bernard"),
                DogsDO(name: "English Mastiff"),
                DogsDO(name: "Newfoundland")]
        #else // Real data, API calls, etc
        data = [DogsDO(name: "Dachshund"),
                DogsDO(name: "Boston Terrier"),
                DogsDO(name: "Pug")]
        #endif
        
    }
}


struct DogsDO: Identifiable {
    var id = UUID()
    var name: String
}
