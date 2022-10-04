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
        addGradient(topColor: primaryColor, bottomColor: secondaryColor)
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
