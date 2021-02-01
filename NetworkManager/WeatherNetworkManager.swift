//
//  WeatherNetworkManager.swift
//  WeatherApp (iOS)
//
//  Created by Maijuriina Mustonen on 01/02/2021.
//

import Foundation

class WeatherNetworkManager : NetworkManagerProtocol {
    func fetchCurrentWeather(city: String, completion: @escaping (WeatherModel) -> ()) {
    let formattedCity = city.replacingOccurrences(of: " ", with: "+")
    let API_URL = "https://api.openweathermap.org/data/2.5/weather?q=\(formattedCity)&appid=\(NetworkProperties.API_KEY)&units=metric"

    guard let url = URL(string: API_URL) else { // create url
        fatalError()
    }
                 
    //start urlsession with request
    let urlRequest = URLRequest(url: url)
    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
    guard let data = data else { return }
        
        // if not nil, decode with WeatherModel
        do {
            let currentWeather = try JSONDecoder().decode(WeatherModel.self, from: data)
            print(currentWeather)
            completion(currentWeather)
        } catch {
             print(error)
        }

    }.resume()
    }
}
    /*    func fetchCurrentLocationWeather(lat: String, lon: String, completion: @escaping (WeatherModel) -> ()) {
     <#code#>
    }*/
    /*func fetchNextFiveWeatherForecast(city: String, completion: [ForecastTemperature]) {
        <#code#>
    }*/

