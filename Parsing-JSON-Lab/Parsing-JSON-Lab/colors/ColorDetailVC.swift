//
//  ColorDetailVC.swift
//  Parsing-JSON-Lab
//
//  Created by casandra grullon on 11/26/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import UIKit

class ColorDetailVC: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var hexValueLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    var colorsInfo: Color?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatePage()
    }

    func updatePage(){
        guard let info = colorsInfo else{
            fatalError("colorsInfo is empty")
        }
        let red = CGFloat(info.rgb.r / 255)
        let green = CGFloat(info.rgb.g / 255)
        let blue = CGFloat(info.rgb.b / 255)
        let hexValue = info.hex["value"] ?? ""
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        hexValueLabel.text = "hex value: \(hexValue)"
        redValueLabel.text = "red value: \(info.rgb.r.description)"
        greenValueLabel.text = "green value: \(info.rgb.g.description)"
        blueValueLabel.text = "blue value: \(info.rgb.b.description)"
    }

}
