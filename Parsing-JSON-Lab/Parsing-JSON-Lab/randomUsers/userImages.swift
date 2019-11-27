//
//  userImages.swift
//  Parsing-JSON-Lab
//
//  Created by casandra grullon on 11/27/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

struct userImage {
    static func getPicture(for urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            print("error")
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("no")
            }
                if let data = data {
                    let image = UIImage(data: data)
                    completion(.success(image))
                }
            }
        dataTask.resume()
    }
}
