//
//  DetailViewController.swift
//  Item Manager
//
//  Created by Aakash Sharma on 12/4/18.
//  Copyright © 2018 Aakash Sharma. All rights reserved.
//

import UIKit

struct Country: Decodable{
    let name: String
    let capital: String
    let region: String
}

class DetailViewController: UIViewController {
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var itemQuantityLabel: UILabel!
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = itemNameLabel{
                label.text = detail.itemName
            }
            if let label = itemQuantityLabel {
                label.text = detail.itemQuantity
            }
            if let label = detailDescriptionLabel {
                label.text = detail.itemDescription
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "https://restcountries.eu/rest/v2/all"
        let urlObject = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObject!){(data, response, error) in
            do{
                let countries = try JSONDecoder().decode([Country].self, from: data!)
                
                for country in countries{
                    print(country.name + ": " + country.capital)
                }
            }catch{
                print("We Got An Error")
            }
        }.resume()
        configureView()
    }

    var detailItem: Items? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

