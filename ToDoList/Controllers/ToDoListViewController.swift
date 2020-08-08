//
//  ViewController.swift
//  ToDoList
//
//  Created by Edgar on 8/8/20.
//  Copyright © 2020 Edgar. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = Item()
        item.title = "Find Mike"
        itemArray.append(item)
        
        let item1 = Item()
        item1.title = "Bay eggs"
        itemArray.append(item1)
        
        let item2 = Item()
        item2.title = "Hello"
        itemArray.append(item2)
        
        if let items = defaults.array(forKey: "ToDoListItemsArray") as? [Item] {
            itemArray = items
        }
        
    }
    
    //    MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //    MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    //    MARK: - Add new item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new today item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            let item = Item()
            item.title = textField.text!
            
            self.itemArray.append(item)
            self.defaults.set(self.itemArray, forKey: "ToDoListItemsArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

