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
    //MARK: Outlets

    @IBOutlet var scoreLbl: UILabel!
    
    @IBOutlet var roundLbl: UILabel!
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startOverButtonTapped(_ sender: UIButton) {
    }
    @IBAction func infoButtonTapped(_ sender: UIButton) {
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
        
        currentValue = lroundf(sender.value)
    }
    
    @IBAction func hitMeButtonTapped(_ sender: UIButton) {
        
        let message = "The value of slider is \(currentValue)"
        
        let alert = UIAlertController(title: "Title", message: message, preferredStyle: .actionSheet)
            
        let action = UIAlertAction(title: "TitleAction", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

