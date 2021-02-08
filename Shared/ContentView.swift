//
//  ContentView.swift
//  Shared
//
//  Created by Maijuriina Mustonen on 25/01/2021.
//

import SwiftUI
import UIKit

struct ContentView: View {
    // create instance of NetworkManager
    let networkManager = WeatherNetworkManager()
    @State var city: String = "Lappeenranta"
    @State private var selected = 0
    //var weatherModel: WeatherModel?
    @ObservedObject var weather = CurrentWeatherViewModel()
    
    var body: some View {
        VStack () {
            GeometryReader { gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ?
                                gr.size.height : gr.size.height * 0.50).animation(.easeOut(duration: 0.5))
            }
            Spacer()
            
        }

          .background(
            Image("dark_background")
                .resizable()
                .scaledToFill()
                .clipped()
                .edgesIgnoringSafeArea(.all)
          )
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
