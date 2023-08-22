//
//  GameViewController.swift
//  Pop it
//
//  Created by Thaw Zin on 23/4/21.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var highscoreLabel: UILabel!
    
    var count = 0
    var theBubble = 0.0
    var remainingTime = 0
    var noOfBubble = 0
    var score = 0
    var highScore = 0
    var playerName = ""
    var timer = Timer()
    var bubble = Bubble()
    var bubbleArray = [Bubble]()
    var rankOneScore = UserDefaults.standard.value(forKey: "rankOneScore")
    var rankTwoScore = UserDefaults.standard.value(forKey: "rankTwoScore")
    var rankThreeScore = UserDefaults.standard.value(forKey: "rankThreeScore")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //show the scores on the ViewController
        scoreLabel.text = "Score: \(score)"
        remainingTimeLabel.text = "Time: \(remainingTime)"
        //store highscore
        highScore = UserDefaults.standard.integer(forKey: "highScore")
        highscoreLabel.text = "HighScore: \(highScore)"
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            timer in
            self.timerCountDown()
            self.removeBubble()
            self.bubbleToGenerate()
            
        }
    }
    //time countdown
    @objc func timerCountDown()
    {
        remainingTime -= 1
        remainingTimeLabel.text = "Time: \(remainingTime)"
        
        if(remainingTime == 0)
        {
            playerName = UserDefaults.standard.string(forKey: "playerName")!
            timer.invalidate()
            //0.5 second duration is when game ends and to show up the EndGameViewController
            Timer.scheduledTimer(timeInterval: 0.5, target:self, selector: #selector(GameViewController.endGame),userInfo: nil, repeats: false)
            self.gamePointsForScoreboard()
            self.gamePointForEndGame()
        }
    }
    //to avoid bubble overlapping
    func isOverlapped(bubbleToGenerate: Bubble) -> Bool{
        for currentBubbles in bubbleArray{
            if(bubbleToGenerate.frame.intersects(currentBubbles.frame)){
               return true
            }
        }
        return false
    }
    //to generate the bubble
    @objc func bubbleToGenerate()
    {
        let numberToGenerate = arc4random_uniform(UInt32(noOfBubble-bubbleArray.count))+1
        var a = 0
        while a < numberToGenerate{
            bubble = Bubble()
            if !isOverlapped(bubbleToGenerate: bubble){
                bubble.addTarget(self, action: #selector(bubblePressed), for: UIControl.Event.touchUpInside)
                self.view.addSubview(bubble)
                bubble.animation()
                a += 1
                bubbleArray += [bubble]
        }
        }
    }
    
    //adding score
    @objc func bubblePressed(sender: Bubble)
    {
        let theScore = Double(sender.score)
    
        if theScore == theBubble
        {
            score = score + Int(round(theScore*1.5))
        }
        else
        {
            theBubble = theScore
            score = score + Int(theScore)
        }
        scoreLabel.text = "Score: \(score)"
        
        //the way to find highscore
        if(score > highScore)
        {
            highScore = score
            UserDefaults.standard.set(highScore, forKey: "highScore")
            highscoreLabel.text = "HighScore: \(highScore)"
        }
        //remove the bubble
        sender.removeFromSuperview()
    }
    
    @objc func removeBubble(){
        var a = 0
        while a < bubbleArray.count {
            if arc4random_uniform(50) < 30 {
                bubbleArray[a].removeFromSuperview()
                bubbleArray.remove(at: a)
                a += 1
            }
        }
    }
    //ranking
    @objc func gamePointsForScoreboard()
    {
        let rank1Score = UserDefaults.standard.value(forKey: "rankOneScore")
        let rank1Name = UserDefaults.standard.value(forKey: "rankOneName")
        
        let rank2Score = UserDefaults.standard.value(forKey: "rankTwoScore")
        let rank2Name = UserDefaults.standard.value(forKey: "rankTwoName")
        
        if(score > rankOneScore as! Int)//when score is greater than rankOneScore
        {
            UserDefaults.standard.set(score,forKey: "rankOneScore")
            UserDefaults.standard.set(playerName, forKey: "rankOneName")
            
            UserDefaults.standard.set(rank1Score,forKey: "rankTwoScore")
            UserDefaults.standard.set(rank1Name,forKey: "rankTwoName")
            
            UserDefaults.standard.set(rank2Score, forKey: "rankThreeScore")
            UserDefaults.standard.set(rank2Name, forKey: "rankThreeName")
        }
        else if(score > rankTwoScore as! Int)//when score is greater than rankTwoScore
        {
            UserDefaults.standard.set(score,forKey: "rankTwoScore")
            UserDefaults.standard.set(playerName, forKey: "rankTwoName")
            
            UserDefaults.standard.set(rank2Score, forKey: "rankThreeScore")
            UserDefaults.standard.set(rank2Name, forKey: "rankThreeName")
        }
        else if(score > rankThreeScore as! Int)//when score is greater than rankThreeScore
        {
            UserDefaults.standard.set(score,forKey: "rankThreeScore")
            UserDefaults.standard.set(playerName, forKey: "rankThreeName")
        }
    }
    //set the values of score and playerName for EndGameViewController
    @objc func gamePointForEndGame(){
        UserDefaults.standard.set(score, forKey: "currentPlayerScore")
        UserDefaults.standard.set(playerName, forKey: "playerName")
    }
    
    //show the ScoreboardViewController
    @objc func endGame()
    {
        performSegue(withIdentifier: "goToEndGameView", sender: nil)
        
    }

}
