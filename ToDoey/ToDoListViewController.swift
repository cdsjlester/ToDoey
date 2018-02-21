//
//  ViewController.swift
//  ToDoey
//
//  Created by Craig Lester on 2/20/18.
//  Copyright © 2018 Craig Lester. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    var toDoItemToAdd = UITextField()
    let defaults = UserDefaults.standard
    var itemArray = ["Go Home", "get Groceries", "get AirBnB"]
    override func viewDidLoad() {
        super.viewDidLoad()
        if let  items = defaults.array(forKey: "Item") as? [String]{
            itemArray = items
        }
        
    }

   //Mark - Tableview Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryView?.tintColor = UIColor.green
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
 
    @IBAction func addItem(_ sender: UIBarButtonItem) {
       
        let alert  = UIAlertController(title: "Add a New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            //button clicked on alert
            if self.toDoItemToAdd.text != ""{
                self.itemArray.append(self.toDoItemToAdd.text!)
                self.defaults.set(self.itemArray, forKey: "Item")
                self.tableView.reloadData()
            }else{
                //do something if no text
                print (self.itemArray)
                self.tableView.reloadData()
            }
           
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = ("create new item")
            self.toDoItemToAdd = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

