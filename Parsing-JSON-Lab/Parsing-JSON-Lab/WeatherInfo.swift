//
//  Weather.swift
//  Parsing-JSON-Lab
//
//  Created by casandra grullon on 11/25/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let list: [WeatherInfo]
}

struct WeatherInfo: Codable {
    var name: String
    var temp: Double
    var weather: Weather
}

struct Weather: Codable {
    var description: String
}

extension WeatherData {
    static func currentWeather() -> [WeatherInfo] {
        var weather = [WeatherInfo]()
        
        guard let fileURL = Bundle.main.url(forResource: "weatherData", withExtension: "json") else {
            fatalError("url issues")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            let weatherResults = try JSONDecoder().decode(WeatherData.self, from: data)
            weather = weatherResults.list
        } catch {
            fatalError("\(error)")
        }
        
        return weather
    }
    
}
