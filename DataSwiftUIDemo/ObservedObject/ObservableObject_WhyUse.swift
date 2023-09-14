//
//  ObservableObject_WhyUse.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 14/09/2023.
//

import SwiftUI

// Model
struct NewWeather: Identifiable {
    var id = UUID()
    var day = ""
    var icon = ""
}



// ViewModel
class WeatherForecast: ObservableObject {
    @Published var forecast = [NewWeather]()
    
    init() {
        forecast = [
            NewWeather(day: "Sunday", icon: "cloud.snow.fill"),
            NewWeather(day: "Monday", icon: "sun.min.fill"),
            NewWeather(day: "Tuesday", icon: "sun.max.fill"),
            NewWeather(day: "Wednesday", icon: "cloud.sun.fill"),
            NewWeather(day: "Thursday", icon: "sun.min.fill"),
            NewWeather(day: "Friday", icon: "cloud.drizzle.fill"),
            NewWeather(day: "Saturday", icon: "cloud.sleet.fill"),
        ]
    }
    
    func fetchAnotherWeek() {
        //Run this code 1 seconds later
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            forecast.append(contentsOf: forecast)
        }
    }
}



// View
struct ObservableObject_WhyUse: View {
    @StateObject private var weather = WeatherForecast()
    @State private var showForecast = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing:24) {
                    HeaderView("", subtitle: "Why You Use", desc: "You use @ObservedObject to observe changes to the parent's @StateObject", back: .red, textColor: .white)
                    
                    Text(weather.forecast[0].day)
                    Image(systemName: weather.forecast[0].icon)
                        .font(.system(size: 120))
                        .foregroundColor(.red)
                    
                    Button("Show 14-Day Forecast") {
                        showForecast = true
                        weather.fetchAnotherWeek()
                    }
                    
                    
                }
                .font(.largeTitle)
                .navigationTitle("@Observed Object")
                
                if showForecast {
                    WeatherForcastDetailView(weather: weather, showForecast: $showForecast)
                }
            }
            
        }
    
    }
}



// Child View
struct WeatherForcastDetailView: View {
    @ObservedObject var weather: WeatherForecast
    @Binding var showForecast: Bool
    
    var body: some View {
        VStack {
            List(weather.forecast) {day in
                Label {
                    Text(day.day)
                } icon: {
                    Image(systemName: day.icon)
                        .foregroundColor(.red)
                }
                .font(.title)
            }
            Button("Close") {
                showForecast = false
            }
            
        }
        .background(Color.white)
        .font(.title)
        
    }
}


struct ObservableObject_WhyUse_Previews: PreviewProvider {
    @StateObject private static var weather = WeatherForecast()
    
    static var previews: some View {
        
        Group {
            ObservableObject_WhyUse()
            
            WeatherForcastDetailView(weather: weather, showForecast: .constant(true))
        }
    }
}
