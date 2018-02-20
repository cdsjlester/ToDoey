//
//  ViewController.swift
//  ToDoey
//
//  Created by Craig Lester on 2/20/18.
//  Copyright © 2018 Craig Lester. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
var itemArray = ["Go Home", "get Groceries", "get AirBnB"]
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
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
       var toDoItemToAdd = UITextField()
        let alert  = UIAlertController(title: "Add a New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            //button clicked on alert
            if toDoItemToAdd.text != ""{
                self.itemArray.append(toDoItemToAdd.text!)
                self.tableView.reloadData()
            }else{
                //do something if no text
                //print (self.tableView.indexPathForSelectedRow!)
                self.tableView.reloadData()
            }
           
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = ("create new item")
            toDoItemToAdd = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

