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
    @IBOutlet var editButton: UIButton!
    
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
        
        if(self.table.isEditing == false){
            table.cellForRow(at: indexPath)?.selectionStyle = .default;
            var foodString = items[indexPath.row].trimmingCharacters(in: .whitespacesAndNewlines);
            foodString = foodString.replacingOccurrences(of: " ", with: "%20");
            let url = URL(string: "https://shop.wegmans.com/search?search_term=" + foodString);
            let sfWindow = SFSafariViewController(url: url!);
            present(sfWindow, animated: true);
            table.deselectRow(at: indexPath, animated: true);
        }
        else{
            table.cellForRow(at: indexPath)?.selectionStyle = .none;
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool{
        return true;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            items.remove(at: indexPath.row);
            self.table.deleteRows(at: [indexPath], with: .fade);
            if(items.count == 0){
                editButton.setTitle("Edit", for: .normal);
                self.table.isEditing = false;
            }
        }
        self.table.reloadData();
    }
    
    @IBAction func editTable(_ sender: UIButton){
        if(self.table.isEditing == false){
            self.table.isEditing = true;
            editButton.setTitle("Done", for: .normal);
        }
        else{
            self.table.isEditing = false;
            editButton.setTitle("Edit", for: .normal);
        }
    }
    
    @IBAction func enterText(_sender: UIButton){
        if(textField.text?.trimmingCharacters(in: .whitespaces).isEmpty == true){
            return;
        }
        else{
            items.append(textField.text!);
            textField.text = "";
            self.table.isEditing = false;
            editButton.setTitle("Edit", for: .normal);
            self.table.reloadData();
        }
        
        print(items);
    }
    
    
    
}

