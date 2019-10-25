//
//  ViewController.swift
//  Shopping List Core Data
//
//  Created by IWAN EVANS on 25/10/2019.
//  Copyright © 2019 Iwan Evans. All rights reserved.
//

import UIKit

//by using UITableViewController dont need to use delegates and didnt need to create IBOutlet etc, done behind the scenes
class ViewController: UITableViewController {
    
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }

    //add new items to list
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        //creating local variable to use alerttextfield
       var textField = UITextField()
        
        //button on UI alert
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen when add button is clicked on UIAlert
            self.shoppingList.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

