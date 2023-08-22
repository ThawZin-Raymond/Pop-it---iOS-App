//
//  HomePageViewController.swift
//  Pop it
//
//  Created by Thaw Zin on 23/4/21.
//

import UIKit

class HomePageViewController: UIViewController {

    
    @IBOutlet weak var playGameButton: UIButton!
    @IBOutlet weak var viewScoreboardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playGameButton.layer.cornerRadius = 20
        viewScoreboardButton.layer.cornerRadius = 20
        
        let rankOneScore = UserDefaults.standard.value(forKey: "rankOneScore")
        let rankTwoScore = UserDefaults.standard.value(forKey: "rankTwoScore")
        let rankThreeScore = UserDefaults.standard.value(forKey: "rankThreeScore")
        let currentPlayerScore = UserDefaults.standard.value(forKey: "currentPlayerScore")
        //set the default value for each ranking in ScoreboardViewController
        if (rankOneScore == nil)
        {
            UserDefaults.standard.set(0, forKey: "rankOneScore")
            UserDefaults.standard.set("---", forKey: "rankOneName")
        }
        
        if (rankTwoScore == nil)
        {
            UserDefaults.standard.set(0, forKey: "rankTwoScore")
            UserDefaults.standard.set("---", forKey: "rankTwoName")
        }
        if (rankThreeScore == nil)
        {
            UserDefaults.standard.set(0, forKey: "rankThreeScore")
            UserDefaults.standard.set("---", forKey: "rankThreeName")
        }
        //set the default value for current player score in the EndGameViewController
        if (currentPlayerScore == nil)
        {
            UserDefaults.standard.set(0, forKey: "currentPlayerScore")
        }
        
    }
}
