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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let randomUserDetail = segue.destination as? RandomUserDetailVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("segue issues")
        }
        randomUserDetail.randomUser = randomUsers[indexPath.row]
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
        let fullName = ("\(userFirstName) \(userLastName)")
        
        cell.textLabel?.text = fullName
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
}
