//
//  ViewController.swift
//  LogInApp
//
//  Created by Nikita Neluybin on 01.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var usernameButton: UIButton!
    @IBOutlet var passwordButton: UIButton!

    @IBOutlet var userTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    let userName = "User"
    let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let logInVC = segue.destination as? LogInViewController else { return }
        logInVC.username = userName
    }
    
    @IBAction func forgotButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            showAlert(withTitle: "Oops", andMessage: "Your username is User")
        default:
            showAlert(withTitle: "Oops", andMessage: "Your password is Password")
        }
    }
    
    @IBAction func logInButtonPressed() {
        if userTF.text == userName, passwordTF.text == password {
        } else {
            showAlert(withTitle: "Error", andMessage: "Wrong username or password")
            passwordTF.text = ""
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userTF.text = ""
        passwordTF.text = ""
    }
}

extension ViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
