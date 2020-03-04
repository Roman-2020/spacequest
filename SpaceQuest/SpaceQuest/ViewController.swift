//
//  ViewController.swift
//  SpaceQuest
//
//  Created by Ysaguirre, Roman J on 2/26/20.
//  Copyright © 2020 Ysaguirre, Roman J. All rights reserved.
//

import UIKit









class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = "Mission Launch"
        
        func didScore(points:Int){
           score = score + points
          if(score % chars == 0) {
                   score=0 }
           myScore.text = "Score: \(score)"
        }
        
        
    }

    func didScore(points:Int){
       score = score + points
     if(score % chars == 0) {
              score=0 }
       myScore.text = "Score: \(score)"
    }
    
    
    //variables ~~~~~~~~~~~~~~~~~~~~~~~~~~
    var rating:Int = 1
    var crewrating:Int = 1
    var total:Int = 1
    
    var score:Int = 0

  var chars:Int = Int(arc4random_uniform(10) + 2)
    
    var counter:Int = 25
    var timer = Timer()
    var isTimerRunning:Bool = false
    
    
    //outlets ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    @IBOutlet weak var myLabel: UILabel!


    @IBOutlet weak var myName: UITextField!
    
    
    @IBAction func myButton(_ sender: Any) {
        let name = myName.text!
        myLabel.text = "Solar Mission \(name)"
             
        myName.resignFirstResponder()}
    
    

    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBAction func myRating(_ sender: UISlider) {
        let rating = Int(sender.value)
        if(rating > 0 && rating <= 5) {
         ratingLabel.text = "The Moon"
        }
        else if(rating > 5 && rating <= 10) {
         ratingLabel.text = "Mars"
        }
        else if(rating > 10 && rating <= 15) {
         ratingLabel.text = "Jupiter moon Titan"
        }
        else {
         ratingLabel.text = "Earth 2"
        }
        
        
        
     }
 
    
    @IBOutlet weak var crewLabel: UILabel!
    
    @IBAction func crewSize(_ sender: UISlider) {
        let crewrating = Int(sender.value)
              crewLabel.text = " \(crewrating)"
       
    }
   
    //variable total was to collect destination scale amount and crew scale  amount into a hidden total, which would be the number to beat in the divsible math game
    
    
    
    @IBAction func launch(_ sender: Any) {
    if isTimerRunning == false {
                    runTimer()
                    }
        myResult.isHidden = true
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    
    func runTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
            isTimerRunning = true
                }
        
    @objc func updateTimer() {
            counter -= 1
            timerLabel.text = "\(counter)"
            if(counter == 0) {
                timerLabel.text = "Time's Up!"
                timer.invalidate()
        myResult.isHidden = false
        myOxygen.isHidden = true
        myWater.isHidden = true
        myFood.isHidden = true
        myFuel.isHidden = true
            }
        total = rating + crewrating
        if (total < score ){ myResult.text = "Mission Success!"}
         else { myResult.text = "Mission Failed.."}
        }


    
    @IBOutlet weak var myScore: UILabel!

    //a certain score has to be met to "win", score has to be equal to or greater than total ( destination + crew size hidden/internal/non displayed value)
    
    @IBAction func myOxygen(_ sender: Any) {
       didScore(points:1)
        if isTimerRunning == false {
                  runTimer()
                  }
    }
    
    
    @IBOutlet weak var myOxygen: UIButton!
    
    
    @IBAction func myWater(_ sender: Any) {
        didScore(points:2)
        if isTimerRunning == false {
                  runTimer()
                  }
    }
    @IBOutlet weak var myWater: UIButton!
    
    
    
    @IBAction func myFood(_ sender: Any) {
        didScore(points:3)
        if isTimerRunning == false {
                  runTimer()
                  }}
    
    @IBOutlet weak var myFood: UIButton!
    
    @IBAction func myFuel(_ sender: Any) {
         didScore(points:4)
        if isTimerRunning == false {
                   runTimer()
                   }}

    @IBOutlet weak var myFuel: UIButton!
    
    
    
    @IBAction func myRestart(_ sender: Any) {
              score = 0
               myScore.text = "Score: \(score)"
               timer.invalidate()
               counter = 25
               timerLabel.text = "\(counter)"
               isTimerRunning = false
        myResult.isHidden = true
            myOxygen.isHidden = false
            myWater.isHidden = false
            myFood.isHidden = false
            myFuel.isHidden = false
               chars = Int(arc4random_uniform(10) + 2)
        }
    
    @IBOutlet weak var myResult: UILabel!

}


