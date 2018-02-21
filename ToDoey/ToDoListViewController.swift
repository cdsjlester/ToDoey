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
    //let defaults = UserDefaults.standard
    var itemArray = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.title = "find Mike"
        itemArray.append(newItem)
//        if let  items = defaults.array(forKey: "Item") as? [Item]{
//            itemArray = items
//        }
        
    }

   //Mark - Tableview Datasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let data = itemArray[indexPath.row]
        
        cell.accessoryType = data.done  ? .checkmark : .none
        
//        if data.done == true{
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
        cell.textLabel?.text = data.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //toggle checkmark
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.cellForRow(at: indexPath)?.accessoryView?.tintColor = UIColor.green
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
 
    @IBAction func addItem(_ sender: UIBarButtonItem) {
       
        let alert  = UIAlertController(title: "Add a New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            //button clicked on alert
            if self.toDoItemToAdd.text != ""{
                let data = Item()
                data.title = self.toDoItemToAdd.text!
                self.itemArray.append(data)
                //self.defaults.set(self.itemArray, forKey: "Item")
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

