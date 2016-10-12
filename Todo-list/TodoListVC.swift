//
//  TodoListVC.swift
//  Todo-list
//
//  Created by Yuma@duck on 8/10/16.
//  Copyright © 2016 Yuma@duck. All rights reserved.
//

import UIKit

class TodoListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, TodoDelegate {
    @IBOutlet weak var tableView: UITableView!

    var todos = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func addTodo(txt: String) {
        todos.append(txt)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = todos[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            if let addVC = segue.destination as? AddTodoVC {
                addVC.delegate = self
            }
        }
    }
}
