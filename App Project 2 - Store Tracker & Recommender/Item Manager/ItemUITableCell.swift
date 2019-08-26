//
//  ItemUITableCell.swift
//  Item Manager
//
//  Created by Aakash Sharma on 12/6/18.
//  Copyright © 2018 Aakash Sharma. All rights reserved.
//

import UIKit

class ItemUITableCell: UITableViewCell{
    
    var itemName:String = ""
    var itemQuantity:String = ""
    var itemDescription:String = ""
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    
    
}

