//
//  AppStorage_StoreStruct.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 16/09/2023.
//

import SwiftUI


// Model
struct User: Codable {
    var name = ""
    var age = 0
    
    func encode() -> Data? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            return encoded
        } else {
            return nil
        }
    }
    
    static func decode(userData: Data) -> User? {
        let decoder = JSONDecoder()
        if let user = try? decoder.decode(User.self, from: userData) {
            return user
        } else {
            return nil
        }
    }
}



// View
struct AppStorage_StoreStruct: View {
    @AppStorage("user") var userData = User(name:"Joe Duran", age: 26).encode()!
    @State private var userName = ""
    @State private var age = 0
    
    var body: some View {
        VStack{
            HeaderView("AppStorage", subtitle: "Store Structs", desc: "Since you can store Data,you can store a whole struct in AppStorage.", back: .orange, textColor: .black)
            
            Text("AppStorage")
            Text("Name: \(userName)").bold()
            Text("Age: \(age)").bold()
        }
        .font(.title)
        .onAppear{
            getAppStorageData()
        }
        
    }
    
    func getAppStorageData() {
        if let appUser = User.decode(userData: userData) {
            userName = appUser.name
            age = appUser.age
        }
    }
}



// Preview
struct AppStorage_StoreStruct_Previews: PreviewProvider {
    static var previews: some View {
        AppStorage_StoreStruct()
    }
}
