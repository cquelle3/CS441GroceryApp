//
//  ViewController.swift
//  GroceryApp
//
//  Created by Colin Quelle on 3/8/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var enterButton: UIButton!
    
    var items = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // table.delegate = self;
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count;
    }
    
    @IBAction func enterText(_sender: UIButton){
        if(textField.text?.isEmpty == true){
            return;
        }
        else{
            items.append(textField.text!);
            textField.text = "";
            table.reloadData();
        }
    }
    
    
    
    
    
}

