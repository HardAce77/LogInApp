//
//  LogInViewController.swift
//  LogInApp
//
//  Created by Nikita Neluybin on 01.10.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var username: String!
    
    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradient()
        welcomeLabel.text = "Welcome, \(username ?? "")!"
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
