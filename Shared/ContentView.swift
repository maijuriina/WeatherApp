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
    var weather: WeatherModel?
    @ObservedObject var currentWeatherModel: CurrentWeatherViewModel = CurrentWeatherViewModel()
    
    let currentLocation: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false // enables auto-layout
            label.text = "...Location"
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 38, weight: .heavy)
            return label
        }()
    
    let currentDate: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Date"
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 38, weight: .heavy)
            return label
        }()
    
    let currentTemp: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Temperature"
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 38, weight: .heavy)
            return label
        }()
    
    let tempSymbol: UIImageView = {
           let img = UIImageView()
            img.translatesAutoresizingMaskIntoConstraints = false
            return img
        }()
    
    
    func loadData(city: String) {
        networkManager.fetchCurrentWeather(city: city) { (weather) in
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yyyy"
            let stringDate = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.dt)))
            
            DispatchQueue.main.async {
                self.currentTemp.text = (String(weather.main.temp))
                self.currentLocation.text = "\(weather.name ?? "") , \(weather.sys.country ?? "")"
                self.currentDate.text = stringDate
                UserDefaults.standard.set("\(weather.name ?? "")", forKey: "SelectedCity")
            }
        }
    }
    
    var body: some View {
        VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            
            Text("WeatherApp")
                .padding()
                .font(.title)
            Text(networkManager.fetchCurrentWeather(city: "Lappeenranta", completion: <#T##(WeatherModel) -> ()#>))
            //Text(networkManager.fetchCurrentWeather(city: "Lappeenranta"))
            //Text(String(weather?.main.temp ?? 0) + " °C")
            //Text(String(weather?.name ?? "Lappeenranta"))
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
