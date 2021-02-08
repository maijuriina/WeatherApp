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
    @State var city: String = ""
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()
    
    var body: some View {
        VStack () {
            TextField("Search...", text: $city, onCommit: {
                self.weather.fetch(by: self.city)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            
            GeometryReader { gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ?
                                gr.size.height : gr.size.height * 0.5).animation(.easeOut(duration: 0.6))
            }
        }
          .background(
            Image("dark_background")
                .resizable()
                .scaledToFill()
                .clipped()
                .edgesIgnoringSafeArea(.all)
          )
        .padding(.leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
