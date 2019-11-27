//
//  ViewController.swift
//  Parsing-JSON-Lab
//
//  Created by casandra grullon on 11/25/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var weather = [WeatherInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }

    func loadData(){
        weather = WeatherData.currentWeather()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weatherDetails = segue.destination as? WeatherDetailVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("segue connection busted...")
        }
        weatherDetails.weatherData = weather[indexPath.row]
    }
}
extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weather.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        let city = weather[indexPath.row]
        cell.textLabel?.text = city.name
        
        return cell
    }
}
