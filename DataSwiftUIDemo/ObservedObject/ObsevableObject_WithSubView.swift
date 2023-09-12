//
//  ObsevableObject_WithSubView.swift
//  DataSwiftUIDemo
//
//  Created by HubertMac on 12/09/2023.
//

import SwiftUI

// Model
struct Weather: Identifiable {
    var id = UUID()
    var day = ""
    var icon = ""
}


// View Model
class Forecast: ObservableObject {
    @Published var sevenDays = [Weather]()
    
    init() {
        
        sevenDays = [
            Weather(day: "Sunday", icon: "cloud.snow.fill"),
            Weather(day: "Monday", icon: "sun.min.fill"),
            Weather(day: "Tuesday", icon: "sun.max.fill"),
            Weather(day: "Wednesday", icon: "cloud.sun.fill"),
            Weather(day: "Thursday", icon: "sun.min.fill"),
            Weather(day: "Friday", icon: "cloud.drizzle.fill"),
            Weather(day: "Saturday", icon: "cloud.sleet.fill"),
        ]
    }
}



// Parent View
struct ObsevableObject_WithSubView: View {
    
    @StateObject var forecast = Forecast()
    @State var  showForecast = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing:24){
                    HeaderView("", subtitle: "Introduction", desc: "Pass a reference of your @StateObjedt into a subview that has a type @Observed Object", back: .red, textColor: .white)
                    
                    
                    Text(forecast.sevenDays[0].day)
                        .font(.largeTitle)
                    Image(systemName:forecast.sevenDays[0].icon)
                        .font(.system(size: 100))
                        .foregroundColor(.red)
                    
                    Button("Show 7 Day Forecast") {
                        showForecast = true
                    }
                    
                }
                .font(.title)
                
                
                if showForecast {
                    ForecastView(forecast: forecast, showForecast: $showForecast)
                    
                }
            }
            .navigationTitle("@Observed Object")
        }
    }
}




// Child View
struct ForecastView: View {
    
    @ObservedObject var forecast: Forecast
    @Binding var showForecast: Bool
    
    var body: some View {
        NavigationStack {
            List(forecast.sevenDays) { day in
                Label {
                    Text(day.day)
                } icon: {
                    Image(systemName: day.icon)
                        .foregroundColor(.red)
                }
            }
            
            Button("Close") {
                showForecast.toggle()
            }
        }
        .font(.title)
    }
}
    

    
// Preview
struct ObsevableObject_WithSubView_Previews: PreviewProvider {
    static var previews: some View {
        ObsevableObject_WithSubView()
    }
}





