//
//  BioViewController.swift
//  LogInApp
//
//  Created by Nikita Neluybin on 05.10.2022.
//

import UIKit

class BioViewController: UIViewController {

    @IBOutlet var bioLabel: UILabel!
    
    var bioInfo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bioLabel.text = bioInfo
        addGradient(topColor: primaryColor, bottomColor: secondaryColor)
    }
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    func addGradient(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}
