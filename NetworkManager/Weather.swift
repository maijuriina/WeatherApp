//
//  Weather.swift
//  WeatherApp (iOS)
//
//  Created by Maijuriina Mustonen on 01/02/2021.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
