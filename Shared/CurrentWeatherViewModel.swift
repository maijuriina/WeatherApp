//
//  CurrentWeatherViewModel.swift
//  WeatherApp (iOS)
//
//  Created by Maijuriina Mustonen on 01/02/2021.
//

import Foundation
import Combine

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: WeatherModel?
    let networkManager = WeatherNetworkManager()
    
    init() {
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch(by city: String =
                "Lappeenranta") {
        networkManager.fetchCurrentWeather(city: city) {
            self.current = $0
        }
    }
}
