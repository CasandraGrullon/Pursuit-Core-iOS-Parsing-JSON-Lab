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
    
    var weather = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }

    func loadData(){
        weather = WeatherData.currentWeather()
    }
}
extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weather.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        var cityTemp = weather[indexPath.row]
        cell.textLabel?.text = cityTemp.name
        
        
        return cell
    }
}
