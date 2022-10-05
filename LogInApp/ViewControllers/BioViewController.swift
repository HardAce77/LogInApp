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
        view.addGradient()
    }
}
