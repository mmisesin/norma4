//
//  ViewController.swift
//  Norma4
//
//  Created by Artem Misesin on 12/2/16.
//  Copyright © 2016 Artem Misesin. All rights reserved.
//

import UIKit

var globalLogin: String?

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var logoConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var login: UITextField!

    @IBAction func loginChanged() {
        checkTextFields()
    }
    
    @IBOutlet weak var password: UITextField!

    @IBAction func passwordChange() {
        checkTextFields()
    }
    
    @IBOutlet weak var enter: UIButton!
    
    @IBAction func enterAction() {
        globalLogin = login.text
    }
    
    @IBAction func callSupport() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let firstNumber = UIAlertAction(title: "+38 (096) 287 38 58", style: .default) { (action) in
            if let url = NSURL(string: "tel://+380962873858") {
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            }
            
        }
        alertController.addAction(firstNumber)
        
        let secondNumber = UIAlertAction(title: "+38 (095) 889 98 56", style: .default) { (action) in
            if let url = NSURL(string: "tel://+380958899856") {
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(secondNumber)
        
        self.present(alertController, animated: true) {
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTextFields()
        self.navigationController?.isNavigationBarHidden = true
        if UIScreen.main.bounds.height == 568 {
            logoConstraint.constant = 100
        }
        
        login.delegate = self
        password.delegate = self
        login.enablesReturnKeyAutomatically = true
        password.enablesReturnKeyAutomatically = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextField = password {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        if textField == password {
            if enteredDataIsCorrect() {
                performSegue(withIdentifier: "signIn", sender: self)
            } else {
                self.view.endEditing(true)
                let alertController = UIAlertController(title: "Ошибка Авторизации", message: "Неправильный логин или пароль.", preferredStyle: .alert)
                
                let okOption = UIAlertAction(title: "OK", style: .cancel, handler: {(action) in})
                
                alertController.addAction(okOption)
                
                self.present(alertController, animated: true)
            }
        }
                // Do not add a line break
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func checkTextFields() {
        if let passwordString = password.text {
            if let loginString = login.text {
                if passwordString.characters.count <= 8 || loginString.isEmpty{
                    enter.isEnabled = false
                } else {
                    enter.isEnabled = true
                }
            }
        }
    }
    
    private func enteredDataIsCorrect() -> Bool {
        if let passwordField = password.text {
            if let loginField = login.text {
                if passwordField.characters.count >= 8 && !loginField.isEmpty && !loginField.contains(" ") {
                    return true
                }
            }
        }
        return false
    }


}

