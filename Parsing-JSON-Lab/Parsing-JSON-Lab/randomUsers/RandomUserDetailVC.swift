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
    @IBOutlet weak var userImageView: UIImageView!
    
    var randomUser: RandomUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePage()
        formatDate()
    }
    
    func updatePage(){
        guard let user = randomUser else {
            fatalError("issue")
        }
        
        let fullAddress = "\(user.location.street.number) \(user.location.street.name) \(user.location.city), \(user.location.country)"
        
        addressLabel.text = fullAddress
        phoneNumberLabel.text = user.phone
        
        
        userImage.getPicture(for: user.picture.medium) { [unowned self] (result) in
            switch result {
            case .failure(let error):
                print("error: \(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.userImageView.image = image
                }
            }
        }
    }
    func formatDate(){
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime,
                                          .withDashSeparatorInDate,
                                          .withFullDate,
                                          .withFractionalSeconds,
                                          .withColonSeparatorInTimeZone]
        isoDateFormatter.timeZone = TimeZone.current
        let timestamp = isoDateFormatter.string(from: Date())
        print(timestamp)
        let timestampString = randomUser?.dob.date ?? ""
        if let date = isoDateFormatter.date(from: timestampString) {
        let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "MMMM, dd, yyyy"
        let dateFormattedString = dateFormatter.string(from: date)
        birthdayLabel.text = dateFormattedString
        } else {
        print("not a valid date")
        }
    }
    
}
