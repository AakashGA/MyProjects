//
//  ViewController.swift
//  Dice Application
//
//  Created by Aakash Sharma on 10/19/18.
//  Copyright © 2018 Aakash Sharma. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var musicEffect: AVAudioPlayer = AVAudioPlayer()

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
           let musicFile = Bundle.main.path(forResource:"Theme", ofType: ".wav")
        
            try musicEffect = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: musicFile!) as URL)
        }
        catch {
            print(error)
        }
    
    }
    @IBAction func playMusic(_ sender: UIButton) {
    musicEffect.play()
    }
    
    @IBAction func rollDice(_ sender: UIButton) {
        
        let firstNumber = arc4random_uniform(5) + 1
        
        let secondNumber = arc4random_uniform(5) + 1
        
        label.text = "Hello World! Adding the 2 dice is: \(firstNumber + secondNumber)"
        
        leftImageView.image = UIImage(named: "Dice\(firstNumber)")
        
        rightImageView.image = UIImage(named: "Dice\(secondNumber)")
    }
    
    @IBAction func moreOptions(_ sender: UIButton) {
        
    UIApplication.shared.open(URL(string: "https://www.apple.com/ios/app-store/")! as URL, options: [:], completionHandler: nil)
    }
    
    
}

