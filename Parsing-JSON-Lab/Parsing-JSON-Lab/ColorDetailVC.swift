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
        
        colorView.backgroundColor = UIColor(red: CGFloat(info.rgb.r), green: CGFloat(info.rgb.g), blue: CGFloat(info.rgb.b), alpha: 1)
        hexValueLabel.text = info.hex["value"]
        redValueLabel.text = info.rgb.r.description
        greenValueLabel.text = info.rgb.g.description
        blueValueLabel.text = info.rgb.b.description
    }

}
