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

    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var money: UILabel!
    
    @IBOutlet weak var planLabel: UILabel!
    @IBOutlet weak var plan: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var ipAddressLabel: UILabel!
    @IBOutlet weak var ipAddress: UILabel!
    
    
    @IBOutlet weak var subnetworkMaskLabel: UILabel!
    @IBOutlet weak var subnetworkMask: UILabel!
    
    @IBOutlet weak var primaryDNSLabel: UILabel!
    @IBOutlet weak var primaryDNS: UILabel!
    
    @IBOutlet weak var secondaryDNSLabel: UILabel!
    @IBOutlet weak var secondaryDNS: UILabel!
    
    var detailLabels: [UILabel] = []
    
    var masterLabels: [UILabel] = []
    
    var info: [Any] = [
        164,
        "Макси (125 грн./мес.)",
        "+38 (093) 017 29 18",
        "94.154.238.222",
        "255.255.255.0",
        "94.154.223.242",
        "94.45.64.34"
        ]
    
    var planPrice = 125
    
    var lowBalance: Bool {
        if planPrice > info[0] as! Int {
            return true
        } else {
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabels.append(money)
        detailLabels.append(plan)
        detailLabels.append(phoneNumber)
        detailLabels.append(ipAddress)
        detailLabels.append(subnetworkMask)
        detailLabels.append(primaryDNS)
        detailLabels.append(secondaryDNS)
        
        masterLabels.append(moneyLabel)
        masterLabels.append(planLabel)
        masterLabels.append(phoneLabel)
        masterLabels.append(ipAddressLabel)
        masterLabels.append(subnetworkMaskLabel)
        masterLabels.append(primaryDNSLabel)
        masterLabels.append(secondaryDNSLabel)
        
        for (index, label) in detailLabels.enumerated(){
            if index != 0 {
                label.text = NSLocalizedString(info[index] as! String, comment: "Detail text")
            } else {
                label.text = "\(info[index]) грн"
            }
        }
        
        for label in masterLabels {
            label.text = NSLocalizedString(label.text!, comment: "Label text")
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

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 2
//    }
    
    

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        if section == 1 {
//            return 3
//        } else if section == 2 {
//            return 4
//        }
//        return 0
//    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        // Configure the cell
//        cell.detailTextLabel!.text = "test2"
//        return cell
//    }

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }

}
