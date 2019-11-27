//
//  RandomUserDetailVC.swift
//  Parsing-JSON-Lab
//
//  Created by casandra grullon on 11/26/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class RandomUserDetailVC: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    var randomUser: RandomUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func updatePage(){
        guard let user = randomUser else {
            fatalError("issue")
        }
        
        addressLabel.text = ""
        phoneNumberLabel.text = user.phone
        birthdayLabel.text = user.dob.date
        
    }

}
