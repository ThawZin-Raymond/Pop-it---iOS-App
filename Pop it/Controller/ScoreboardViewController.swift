//
//  ScoreboardViewController.swift
//  Pop it
//
//  Created by Thaw Zin on 28/4/21.
//

import UIKit

class ScoreboardViewController: UIViewController {

    
    @IBOutlet weak var rankOneScoreLabel: UILabel!
    @IBOutlet weak var rankOneNameLabel: UILabel!
    
    @IBOutlet weak var rankTwoScoreLabel: UILabel!
    @IBOutlet weak var rankTwoNameLabel: UILabel!
    
    @IBOutlet weak var rankThreeScoreLabel: UILabel!
    @IBOutlet weak var rankThreeNameLabel: UILabel!
    
    var rankOneScore = UserDefaults.standard.value(forKey: "rankOneScore") as! Int
    var rankOneName =  UserDefaults.standard.value(forKey: "rankOneName") as! String
    
    var rankTwoScore = UserDefaults.standard.value(forKey: "rankTwoScore") as! Int
    var rankTwoName = UserDefaults.standard.value(forKey: "rankTwoName") as! String
    
    var rankThreeScore = UserDefaults.standard.value(forKey: "rankThreeScore") as! Int
    var rankThreeName = UserDefaults.standard.value(forKey: "rankThreeName") as! String
    
    override func viewDidLoad() {
        super.viewDidLoad()
//setting up for the highscore board based on ranking
        
        rankOneScoreLabel.text = String(rankOneScore)
        rankOneNameLabel.text = rankOneName
        
        rankTwoScoreLabel.text = String(rankTwoScore)
        rankTwoNameLabel.text = rankTwoName
        
        rankThreeScoreLabel.text = String(rankThreeScore)
        rankThreeNameLabel.text = rankThreeName
    }

}
