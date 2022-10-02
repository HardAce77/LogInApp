//
//  ViewController.swift
//  LogInApp
//
//  Created by Nikita Neluybin on 01.10.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var usernameButton: UIButton!
    @IBOutlet var passwordButton: UIButton!
    
    @IBOutlet var userTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let userName = "User"
    private let password = "Password"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = userName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userTF:
            passwordTF.becomeFirstResponder()
        default:
            passwordTF.resignFirstResponder()
            logInButtonPressed()
        }
        return true
    }
    
    @IBAction func forgotButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            showAlert(withTitle: "Oops", andMessage: "Your username is User 😉", forTextField: nil)
        default:
            showAlert(withTitle: "Oops", andMessage: "Your password is Password 😉", forTextField: nil)
        }
    }
    
    @IBAction func logInButtonPressed() {
        if userTF.text == userName, passwordTF.text == password {
            performSegue(withIdentifier: "LogIn", sender: self)
        } else {
            showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password", forTextField: passwordTF)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userTF.text = ""
        passwordTF.text = ""
    }
}

extension LoginViewController {
    
    private func showAlert(withTitle title: String, andMessage message: String, forTextField textField: UITextField?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTF.text = ""
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
