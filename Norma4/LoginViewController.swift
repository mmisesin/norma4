//
//  ViewController.swift
//  Norma4
//
//  Created by Artem Misesin on 12/2/16.
//  Copyright © 2016 Artem Misesin. All rights reserved.
//

import UIKit

var globalLogin: String?

class LoginViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTextFields()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
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
                if passwordString.characters.count <= 8 || loginString.characters.isEmpty{
                    enter.isEnabled = false
                } else {
                    enter.isEnabled = true
                }
            }
        }
    }


}

