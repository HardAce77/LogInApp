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
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTF.text = user.username
        passwordTF.text = user.password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? TabBarViewController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.username = "\(user.person.firstName) \(user.person.secondName)"
            } else if let navigationVC = viewController as? UINavigationController {
                guard let userVC = navigationVC.topViewController as? UserViewController else { return }
                userVC.person = user.person
            }
        }
    }
    
    @IBAction func forgotButton(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Oops", andMessage: "Your username is \(user.username) 😉")
        : showAlert(withTitle: "Oops", andMessage: "Your password is \(user.password) 😉")
    }
    
    @IBAction func logInButtonPressed() {
        if userTF.text == user.username, passwordTF.text == user.password {
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
    
    private func showAlert(withTitle title: String, andMessage message: String, forTextField textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTF.text = ""
            textField?.becomeFirstResponder()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController {
    
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
