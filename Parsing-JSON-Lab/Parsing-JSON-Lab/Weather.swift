//
//  Weather.swift
//  Parsing-JSON-Lab
//
//  Created by casandra grullon on 11/25/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let list: [Weather]
}

struct Weather: Codable {
    var name: String
    var main: [String : Double]
//    var weather: [[String : Any]]
}

extension WeatherData {
    static func currentWeather() -> [Weather] {
        var weather = [Weather]()
        
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
