//
//  Storage.swift
//  Item Manager
//
//  Created by Aakash Sharma on 12/4/18.
//  Copyright © 2018 Aakash Sharma. All rights reserved.
//

import Foundation

class Storage{
    static let shared: Storage = Storage()
    
    var objects: [Items]
    
    private init(){
        objects = [Items]()
    }
}
