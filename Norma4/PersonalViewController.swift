//
//  PersonalViewController.swift
//  Norma4
//
//  Created by Artem Misesin on 12/3/16.
//  Copyright © 2016 Artem Misesin. All rights reserved.
//

import UIKit
import Foundation

class PersonalViewController: UITableViewController {
    
    @IBAction func callSupport() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
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
    
    var info: [[String]] = [
        ["164",
        "Макси (125 грн/мес.)",
        "+38 (093) 017 29 18"],
        ["94.154.238.222",
        "255.255.255.0",
        "94.154.223.242",
        "94.45.64.34"]
        ]
    
    var labels: [[String]] = [[
        "Баланс",
        "Тариф",
        "Телефон"],
        ["IP-адрес",
         "Маска подсети",
        "DNS Основной",
        "DNS Второстепенный"]
    ]
    
    var planPrice = 125
    
    var lowBalance: Bool {
        if planPrice > Int(info[0][0])! {
            return true
        } else {
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (index, _) in info.enumerated(){
            for (index1, string) in info[index].enumerated(){
                if index != 0 {
                    info[index][index1] = NSLocalizedString(string, comment: "Detail text")
                } else {
                    info[index][index1] = "\(info[index][index1]) грн"
                }
            }
        }
        for (index, _) in labels.enumerated() {
            for (index1, string) in labels[index].enumerated() {
                labels[index][index1] = NSLocalizedString(string, comment: "Label text")
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        } else {
            return "Сетевые настройки"
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 3
        } else if section == 1 {
            return 4
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell
        cell.textLabel?.text = labels[indexPath.section][indexPath.row]
        cell.detailTextLabel!.text = info[indexPath.section][indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

}
