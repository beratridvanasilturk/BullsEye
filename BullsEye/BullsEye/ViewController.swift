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
    @IBOutlet var hitMeButtonOutlet: UIButton!
    
    //MARK: Function
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    func startNewRound(){
        //CATransition Animation
        let transition = CATransition()
        // Transition type new round baslerken bu class icerisindeki propertyleri anime etme seklini belirliyor. Dikkatli bakilacak olursa hem slider'i hem de label'lari .fade animasyonu ile guncellendigi gorulur.
        transition.type = .fade
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
        
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
        
        hitMeButtonOutlet.isEnabled = true
        round = 0
        totalScore = 0
        currentValue = 0
        startNewRound()
        
        let transition = CATransition()
        // Transition type oyun tekrar baslerken bu class icerisindeki propertyleri anime etme seklini belirliyor.
        transition.type = .push
        transition.duration = 0.8
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
        
    }
    @IBAction func infoButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        
        currentValue = lroundf(sender.value)
        
    }
    
    @IBAction func hitMeButtonTapped(_ slider: UIButton) {
        
        //Difference Calculator, abs mean is absolute value (mutlak deger)
        let differenceTargetCurrent = abs(currentValue - targetValue)
        var points = 100 - differenceTargetCurrent
        var title: String
        
        if differenceTargetCurrent == 0 {
            title = "Perfect"
            points += 100
            print("User deserved extra 100 points")
        } else if differenceTargetCurrent < 10 {
            title = "Very Close"
        } else if differenceTargetCurrent < 20 {
            title = "Not Bad"
        } else {
            title = "Not even close"
        }
        
        totalScore += points
        
        let message = "Your score in this round \(points)" +
        "\n Your guess \(currentValue)" +
        "\n Total score is \(totalScore)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true)
        
        round += 1
        
        if round == 11 {
            action.isEnabled = false
            // Dissmis the Hit Me Button for Restart Game
            hitMeButtonOutlet.isEnabled = false
            
            let action = UIAlertAction(title: "Restart The Game", style: .cancel)
            alert.addAction(action)
            
        }
    }
}

