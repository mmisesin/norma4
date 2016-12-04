//
//  SettingsTableViewController.swift
//  Norma4
//
//  Created by Artem Misesin on 12/3/16.
//  Copyright © 2016 Artem Misesin. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var currentLanguage = "English"
    
    private var labels = [
        "Login",
        "Notifications",
        "Language",
        "Version"
                  ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        cell.textLabel?.text = labels[indexPath.row]
        if let label = cell.textLabel!.text {
            switch label {
            case "Notifications":
                let notiSwitch = UISwitch()
                cell.detailTextLabel?.text = ""
                cell.accessoryView = notiSwitch
                cell.textLabel?.text = labels[indexPath.row]
            case "Language":
                cell.detailTextLabel?.text = currentLanguage
                cell.accessoryType = .disclosureIndicator
            case "Version":
                if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                        cell.detailTextLabel?.text = version
                }
            case "Login":
                cell.detailTextLabel?.text = globalLogin
            default: break;
            }
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                // ...
            }
            alertController.addAction(cancelAction)
            
            let russian = UIAlertAction(title: "Русский", style: .default) { (action) in
            }
            alertController.addAction(russian)
            
            let ukrainian = UIAlertAction(title: "Українська", style: .default) { (action) in
            }
            alertController.addAction(ukrainian)
            
            
            let english = UIAlertAction(title: "English", style: .default) { (action) in
                
            }
            alertController.addAction(english)
            
            self.present(alertController, animated: true) {
            }
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
