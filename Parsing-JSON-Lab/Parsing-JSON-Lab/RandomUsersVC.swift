//
//  RandomUsersVC.swift
//  Parsing-JSON-Lab
//
//  Created by casandra grullon on 11/25/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class RandomUsersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var randomUsers = [RandomUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        
    }
    
    func loadData() {
        randomUsers = RandomUserData.getUsers()
    }
}

extension RandomUsersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUsers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        let user = randomUsers[indexPath.row]
        
        let userFirstName = user.name["first"] ?? ""
        let userLastName = user.name["last"] ?? ""
        
        cell.textLabel?.text = ("\(userFirstName) \(userLastName)")
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
}
