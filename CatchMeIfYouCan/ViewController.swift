//
//  ViewController.swift
//  CatchMeIfYouCan
//
//  Created by Mert Cihangiroğlu on 1/24/19.
//  Copyright © 2019 MertCihangiroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var HighScoreLabel: UILabel!
    
    @IBOutlet weak var Candy1: UIImageView!
    @IBOutlet weak var Candy2: UIImageView!
    @IBOutlet weak var Candy3: UIImageView!
    @IBOutlet weak var Candy4: UIImageView!
    @IBOutlet weak var Candy5: UIImageView!
    @IBOutlet weak var Candy6: UIImageView!
    @IBOutlet weak var Candy7: UIImageView!
    @IBOutlet weak var Candy8: UIImageView!
    @IBOutlet weak var Candy9: UIImageView!
    
    var score = 0
    var timer = Timer()
    var counter = 0
    lazy var  candyArray = [Candy1,Candy2,Candy3,Candy4,Candy5,Candy6,Candy7,Candy8,Candy9]
    
    
    override func viewDidLoad() {
        
         super.viewDidLoad()
        
        ScoreLabel.text = "Score:\(score)"
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        //this is only a test for checking if gitkraken works fine or not
        Candy1.isUserInteractionEnabled = true
        Candy2.isUserInteractionEnabled = true
        Candy3.isUserInteractionEnabled = true
        Candy4.isUserInteractionEnabled = true
        Candy5.isUserInteractionEnabled = true
        Candy6.isUserInteractionEnabled = true
        Candy7.isUserInteractionEnabled = true
        Candy8.isUserInteractionEnabled = true
        Candy9.isUserInteractionEnabled = true
        
        Candy1.addGestureRecognizer(recognizer1)
        Candy2.addGestureRecognizer(recognizer2)
        Candy3.addGestureRecognizer(recognizer3)
        Candy4.addGestureRecognizer(recognizer4)
        Candy5.addGestureRecognizer(recognizer5)
        Candy6.addGestureRecognizer(recognizer6)
        Candy7.addGestureRecognizer(recognizer7)
        Candy8.addGestureRecognizer(recognizer8)
        Candy9.addGestureRecognizer(recognizer9)
        
        //Timers
        
        counter = 10
        TimeLabel.text = "\(counter)" // or string(label)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.CountDown), userInfo: nil, repeats: true)
        
        //array
        
        
         func hideCandy() {
            for candy in candyArray {
                candy!.isHidden = true
                
            }
            let random = Int(arc4random_uniform(UInt32(candyArray.count - 1)))
            candyArray[random]?.isHidden = false
            
        }
    }
    
    
    @objc func CountDown(){
        counter -= 1
        TimeLabel.text = "\(counter)"
        if counter == 0 {
            timer.invalidate()
            let alert = UIAlertController(title: "Time", message: "Game is Over", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert,animated: true,completion: nil)
        }
        
    }
    
    
    @objc func increaseScore(){
        
        score += 1
        ScoreLabel.text = "Score:\(score)"
    }
    
    
}


