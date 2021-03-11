//
//  ViewController.swift
//  GroceryApp
//
//  Created by Colin Quelle on 3/8/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var enterButton: UIButton!
    
    var items = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self;
        // Do any additional setup after loading the view.
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        print("entered cellForRowAt");
        
        let cell = UITableViewCell();
        cell.textLabel?.text = items[indexPath.row];
        return cell;
    }
    
    @IBAction func enterText(_sender: UIButton){
        if(textField.text?.isEmpty == true){
            return;
        }
        else{
            
            items.append(textField.text!);
            textField.text = "";
            
            print(items);
            
            DispatchQueue.main.async { self.table.reloadData() }
        }
    }
    
    
    
}

