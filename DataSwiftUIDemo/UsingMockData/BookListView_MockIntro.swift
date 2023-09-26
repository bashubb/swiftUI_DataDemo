//
//  BookListView_MockIntro.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 26/09/2023.
//

import SwiftUI

struct BookListView_MockIntro: View {
    @StateObject var oo = BookListOO()
    var body: some View {
        VStack {
            HeaderView("Architecture", subtitle: "Mock Data ", desc: "Inherit and override is one strategy for mocking fetch requests", back: Color.yellow, textColor: Color.primary)
                .font(.title)
            
            List(oo.data){book in
                Text(book.name)
            }
        }
        
        .onAppear{
            oo.fetchData()
        }
    }
}

#Preview {
    BookListView_MockIntro(oo:MockBookListOO())
}


class BookListOO: ObservableObject {
    @Published var data: [BooksDO] = []
    
    func fetchData(){
        // Api Call
    }
}

class MockBookListOO: BookListOO {
    override func fetchData() {
        // Use mock data while creating the view
        data = [BooksDO(name: "Harry Potter 1"),
                BooksDO(name: "Harry Potter 2"),
                BooksDO(name: "Harry Potter 3"),
                BooksDO(name: "Harry Potter 4")]
    }
}
