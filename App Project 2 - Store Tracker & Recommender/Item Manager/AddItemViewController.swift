//
//  AddItemViewController.swift
//  Item Manager
//
//  Created by Aakash Sharma on 12/10/18.
//  Copyright © 2018 Aakash Sharma. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController{
    
    @IBOutlet weak var itemNameInput: UITextField!
    @IBOutlet weak var itemQuantityInput: UITextField!
    @IBOutlet weak var itemDescriptionInput: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    @objc
    @IBAction func addItem() -> Void{
        
        let newItemName = itemNameInput.text!
        let newItemQuantity = itemQuantityInput.text!
        let newItemDescription = itemDescriptionInput.text!
        
        let newItem = Items(itemName: newItemName, itemQuantity: newItemQuantity, itemDescription: newItemDescription)
        
        Storage.shared.objects.append(newItem)
            performSegue(withIdentifier: "backToTable", sender: self)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
