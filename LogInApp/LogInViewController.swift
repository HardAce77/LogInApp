//
//  LogInViewController.swift
//  LogInApp
//
//  Created by Nikita Neluybin on 01.10.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    var username: String!
    
    @IBOutlet var welcomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(username ?? "")"
    }
}
