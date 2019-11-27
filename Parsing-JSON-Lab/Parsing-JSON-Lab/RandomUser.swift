//
//  RandomUser.swift
//  Parsing-JSON-Lab
//
//  Created by casandra grullon on 11/26/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct RandomUserData: Codable {
    let results: [RandomUser]
}

struct RandomUser: Codable {
    var name: [String:String]
    var location: [Address]
    var phone: String
    var dob: DOB
    var email: String
}

struct Address: Codable {
    var number: Int
    var name: String
    var city: String
    var country: String
    var postcode: Int
}

struct DOB: Codable {
    var date: String
}

extension RandomUserData {
    static func getUsers() -> [RandomUser] {
        var user = [RandomUser]()
        
        guard let fileURL = Bundle.main.url(forResource: "randomUsersData", withExtension: "json") else {
            fatalError("url issues")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            let userData = try JSONDecoder().decode(RandomUserData.self, from: data)
            user = userData.results
        } catch {
            fatalError("issue in do catch")
        }
        
        return user
    }
}

