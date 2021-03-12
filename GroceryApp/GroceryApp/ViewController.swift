//
//  ViewController.swift
//  GroceryApp
//
//  Created by Colin Quelle on 3/8/21.
//  Copyright © 2021 Colin Quelle. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var enterButton: UIButton!
    
    var items = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self;
        table.delegate = self;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell();
        cell.textLabel?.text = items[indexPath.row];
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(indexPath.row);
        let url = URL(string: "https://shop.wegmans.com/search?search_term=" + items[indexPath.row]);
        let sfWindow = SFSafariViewController(url: url!);
        present(sfWindow, animated: true);
        
        table.deselectRow(at: indexPath, animated: true);
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool{
        return true;
    }
    
    @IBAction func enterText(_sender: UIButton){
        if(textField.text?.trimmingCharacters(in: .whitespaces).isEmpty == true){
            return;
        }
        else{
            items.append(textField.text!);
            textField.text = "";
            self.table.reloadData();
        }
        
        print(items);
    }
    
    
    
}

