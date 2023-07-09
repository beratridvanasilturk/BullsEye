//
//  ViewController.swift
//  BullsEye
//
//  Created by Berat Rıdvan Asiltürk on 7.07.2023.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Variables
    var currentValue = 0
    var targetValue = 0
    var round = 0
    var totalScore = 0
    
    //MARK: Outlets
    @IBOutlet var slider: UISlider!
    @IBOutlet var scoreLbl: UILabel!
    @IBOutlet var targetLbl: UILabel!
    @IBOutlet var roundLbl: UILabel!
    
    //MARK: Function
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }

    func updateLabels(){
        targetLbl.text = String(targetValue)
        scoreLbl.text = String(totalScore)
        roundLbl.text = String(round)
    }

    //MARK: Actions
    @IBAction func startOverButtonTapped(_ sender: UIButton) {
    }
    @IBAction func infoButtonTapped(_ sender: UIButton) {
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
        
        currentValue = lroundf(sender.value)
    }
    
    @IBAction func hitMeButtonTapped(_ slider: UIButton) {
        
        
        //Difference Calculator, abs mean is absolute value (mutlak deger)
        let differenceTargetCurrent = abs(currentValue - targetValue)
        
        let points = 100 - differenceTargetCurrent
        
        totalScore += points
        
        var title: String
        if differenceTargetCurrent == 0 {
            title = "Perfect"
        } else if differenceTargetCurrent < 10 {
            title = "Very Close"
        } else if differenceTargetCurrent < 20 {
            title = "Not Bad"
        } else {
            title = "Not even close"
        }
        

        let message = "Your score point is \(points)" +
                      "\n Total score is \(totalScore)"
        
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
        let action = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
        
        round += 1
        if round == 5 {
            
            let alert = UIAlertAction(title: "GAME OVER", style: .default)
            print("Game Over")
        }
        
        
        
       
        startNewRound()
        
    }
}

