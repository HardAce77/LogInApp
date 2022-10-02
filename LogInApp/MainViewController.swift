//
//  ViewController.swift
//  LogInApp
//
//  Created by Nikita Neluybin on 01.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameButton: UIButton!
    @IBOutlet var passwordButton: UIButton!
    
    @IBOutlet var userTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let userName = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = userName
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
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userTF.text = ""
        passwordTF.text = ""
    }
}

extension LoginViewController {
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
