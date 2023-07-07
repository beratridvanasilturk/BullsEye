//
//  ViewController.swift
//  BullsEye
//
//  Created by Berat Rıdvan Asiltürk on 7.07.2023.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Variables
    var currentValue = 50
    var targetValue = 0
    var round = 1
    //MARK: Outlets

    @IBOutlet var slider: UISlider!
    @IBOutlet var scoreLbl: UILabel!
    
    @IBOutlet var targetLbl: UILabel!
    @IBOutlet var roundLbl: UILabel!
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    //MARK: Functions
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }

    func updateLabels(){
        targetLbl.text = String(targetValue)
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
        
        let message = "The value of slider is \(currentValue)" +
                      "\n The target value is \(targetValue)"
        
        let alert = UIAlertController(title: "Title", message: message, preferredStyle: .alert)
            
        let action = UIAlertAction(title: "TitleAction", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
        
        round += 1
        if round == 5 {
            print("Game Over")
        }
        startNewRound()
    }
    
}

