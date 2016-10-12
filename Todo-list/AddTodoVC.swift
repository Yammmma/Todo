//
//  AddTodoVC.swift
//  Todo-list
//
//  Created by Yuma@duck on 8/10/16.
//  Copyright © 2016 Yuma@duck. All rights reserved.
//

import UIKit

protocol TodoDelegate {
    func addTodo(txt: String)
}

class AddTodoVC: UIViewController {
    @IBOutlet weak var todoTxtField: UITextField!

    var delegate: TodoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func addTodo(_ sender: AnyObject) {
        if let todoTxt = todoTxtField.text, let myButler = delegate {
            delegate?.addTodo(txt: todoTxt)
            dismiss(animated: true, completion: nil)
        }
        
        hideKeyboard()
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
}
