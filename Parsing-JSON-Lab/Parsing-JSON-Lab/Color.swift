//
//  Color.swift
//  Parsing-JSON-Lab
//
//  Created by casandra grullon on 11/26/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct ColorsData: Codable {
    let results: [Color]
}

struct Color: Codable {
    var hex: [String: String]
    var name: [String: String]
    var rgb: [String: Double]
}

extension ColorsData {
    static func getColors() -> [Color]{
        var colorInfo = [Color]()
        
        guard let fileURL = Bundle.main.url(forResource: "colorsData", withExtension: "json") else{
            fatalError("url issues")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            let colorData = try JSONDecoder().decode(ColorsData.self, from: data)
            colorInfo = colorData.results
        } catch {
            fatalError("\(error)")
        }
        return colorInfo
    }
}
