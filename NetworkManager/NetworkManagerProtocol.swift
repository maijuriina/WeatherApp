//
//  NetworkManagerProtocol.swift
//  WeatherApp (iOS)
//
//  Created by Maijuriina Mustonen on 01/02/2021.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchCurrentWeather(city: String, completion: @escaping (WeatherModel) -> ())
    //func fetchNextFiveWeatherForecast(city: String, completion: @escaping ([ForecastTemperature]) -> ())
}
