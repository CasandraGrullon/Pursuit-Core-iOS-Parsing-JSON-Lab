//
//  WeatherDetailVC.swift
//  Parsing-JSON-Lab
//
//  Created by casandra grullon on 11/26/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class WeatherDetailVC: UIViewController {

    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    var weatherData : WeatherInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePage()
    }

    func updatePage() {
        guard let weather = weatherData else {
            fatalError("weatherData is empty")
        }
        navigationItem.title = weather.name
        currentTempLabel.text = weather.temp.description
        
        currentWeatherLabel.text = weather.weather.description
        
        if weather.weather.description.contains("clouds") {
            weatherImageView.image = UIImage(systemName: "cloud.sun.fill")
            weatherImageView.tintColor = .gray
        } else if weather.weather.description.contains("rain") {
            weatherImageView.image = UIImage(systemName: "cloud.rain.fill")
            weatherImageView.tintColor = .systemTeal
        } else {
            weatherImageView.image = UIImage(systemName: "sun.max.fill")
            weatherImageView.tintColor = .yellow
        }
    }

}
