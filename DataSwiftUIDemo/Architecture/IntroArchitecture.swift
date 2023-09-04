//
//  ContentView.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 04/09/2023.
//

import SwiftUI


// View
struct IntroArchitecture: View {
    
    @StateObject private var oo = BooksOO()
    
    var body: some View {
        VStack {
            Text("This is the list of 'BooksDO' objects which have been created in Observable Object 'BooksOO' by function 'fetch' and assign to the @Published property data. In this view the 'BooksOO' instance has been created and wrapped in @StateObject, thats  why every change in data property will be noticed in this view ")
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
            
            List(oo.data) { item in
                Text(item.name)
            }
                
            
        }
        .onAppear{
            oo.fetch()
        }
    }
}


// Observable Object - ViewModel

class BooksOO: ObservableObject {
    @Published var data: [BooksDO] = []
    
    func fetch() {
        data = [BooksDO(name:"Harry Potter 1"),
                BooksDO(name:"Harry Potter 2"),
                BooksDO(name:"Harry Potter 3")]
    }
}

// Data Object
import Foundation

struct BooksDO: Identifiable {
    let id = UUID()
    var name: String
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntroArchitecture()
    }
}
