//
//  Forecast.swift
//  Weather
//
//  Created by beso on 28.02.22.
//

import Foundation
// MARK: - Welcome
struct Welcome1: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List1]
    let city: City1
}
// MARK: - City
struct City1: Codable {
    let id: Int
    let name: String
    let coord: Coord1
    let country: String
    let population, timezone, sunrise, sunset: Int
}
// MARK: - Coord
struct Coord1: Codable {
    let lat, lon: Double
}
// MARK: - List
struct List1: Codable {
    let dt: Int
    let main: MainClass1
    let weather: [Weather1]
    let clouds: Clouds1
    let wind: Wind1
    let visibility: Int
    let pop: Double
    let sys: Sys1
    let dtTxt: String
    let rain: Rain1?
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain
    }
}
// MARK: - Clouds
struct Clouds1: Codable {
    let all: Int
}
// MARK: - MainClass
struct MainClass1: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}
// MARK: - Rain
struct Rain1: Codable {
    let the3H: Double
    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}
// MARK: - Sys
struct Sys1: Codable {
    let pod: String
}
// MARK: - Weather
struct Weather1: Codable {
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
// MARK: - Wind
struct Wind1: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
} 
