//
//  Weather.swift
//  WeatherApp (iOS)
//
//  Created by Maijuriina Mustonen on 01/02/2021.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

struct Main: Codable {
    let temp, feels_like, temp_min, temp_max, pressure, humidity: Float
}

struct Sys: Codable {
    let country: String?
    let sunrise, sunset: Int?
}


struct WeatherModel: Codable {
    let weather: [Weather]
    let main: Main
    let sys: Sys
    let name: String?
    let dt: Int
    let timezone: Int?
    let dt_txt: String?
}
