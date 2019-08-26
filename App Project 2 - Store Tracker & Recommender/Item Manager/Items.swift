//
//  Items.swift
//  Item Manager
//
//  Created by Aakash Sharma on 12/4/18.
//  Copyright © 2018 Aakash Sharma. All rights reserved.
//

import Foundation

class Items{
    var itemName:String
    var itemQuantity:String
    var itemDescription:String
    
    //Use of interpolation
    init(itemName:String, itemQuantity:String, itemDescription:String){
        self.itemName = itemName
        self.itemQuantity = itemQuantity
        self.itemDescription = itemDescription
    }
}
