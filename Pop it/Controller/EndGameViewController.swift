//
//  EndGameViewController.swift
//  Pop it
//
//  Created by Thaw Zin on 30/4/21.
//

import UIKit

class EndGameViewController: UIViewController {

    @IBOutlet weak var playerScoreLabel: UILabel!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var scoreboardButton: UIButton!
    
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "goBackToSettingVIew", sender: nil)
    }
    @IBAction func scoreboardButton1(_ sender: Any) {
        performSegue(withIdentifier: "goBackHighScoreTable", sender: nil)
    }
    var currentPlayerScore = UserDefaults.standard.value(forKey: "currentPlayerScore") as! Int
    var playerName = UserDefaults.standard.value(forKey: "playerName") as! String
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restartButton.layer.cornerRadius = 20
        scoreboardButton.layer.cornerRadius = 20
        
        playerNameLabel.text = "Your name: \(playerName)"
        playerScoreLabel.text = "Your score: \(currentPlayerScore)"
        
        
    }
    

}
