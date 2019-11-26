//
//  ColorsVC.swift
//  Parsing-JSON-Lab
//
//  Created by casandra grullon on 11/25/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class ColorsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var colors = [Color]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        loadData()
    }
    func loadData(){
        colors = ColorsData.getColors()
    }


}

extension ColorsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name.value
        cell.backgroundColor = UIColor(red: CGFloat(color.rgb.r) , green: CGFloat(color.rgb.g), blue: CGFloat(color.rgb.b), alpha: 1)
        
        return cell
    }
}
