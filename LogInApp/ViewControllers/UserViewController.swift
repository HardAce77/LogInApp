//
//  PersonViewController.swift
//  LogInApp
//
//  Created by Nikita Neluybin on 05.10.2022.
//

import UIKit

class UserViewController: UIViewController {
        
    @IBOutlet var infoLabels: [UILabel]!
    @IBOutlet var personPhoto: UIImageView!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(person.firstName) \(person.secondName)"
        setup(labels: infoLabels)
        view.addGradient()
    }
    
    override func viewDidLayoutSubviews() {
        personPhoto.layer.cornerRadius = personPhoto.layer.frame.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else { return }
        bioVC.bioInfo = person.bio
    }
    
    func setup(labels: [UILabel]) {
        labels.forEach { label in
            switch label.tag {
            case 0: label.text = person.firstName
            case 1: label.text = person.secondName
            case 2: label.text = String(person.age)
            case 3: label.text = person.company
            case 4: label.text = person.department
            default: label.text = person.jobTitle
            }
        }
    }
}
