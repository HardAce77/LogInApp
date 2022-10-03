//
//  ViewController.swift
//  LogInApp
//
//  Created by Nikita Neluybin on 01.10.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
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
        view.endEditing(true)
    }
    
    @IBAction func forgotButton(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Oops", andMessage: "Your username is \(userName) 😉")
        : showAlert(withTitle: "Oops", andMessage: "Your password is \(password) 😉")
    }
    
    @IBAction func logInButtonPressed() {
        if userTF.text == userName, passwordTF.text == password {
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        } else {
            showAlert(withTitle: "Invalid login or password",
                      andMessage: "Please, enter correct login and password",
                      forTextField: passwordTF)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userTF.text = ""
        passwordTF.text = ""
    }
}

extension LoginViewController {
    
    private func showAlert(withTitle title: String, andMessage message: String, forTextField textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTF.text = ""
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
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
}
