//
//  SettingViewController.swift
//  Pop it
//
//  Created by Thaw Zin on 23/4/21.
//

import UIKit

class SettingViewController: UIViewController{

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var timeSliderLabel: UILabel!
    
    @IBOutlet weak var timerSlider: UISlider!
    
    @IBOutlet weak var bubbleSlider: UISlider!
    
    @IBOutlet weak var bubbleSliderLabel: UILabel!
    
    @IBOutlet weak var startGameButton: UIButton!
    //setting the defaults value for timer and no of bubbles sliders
    var timeSliderValue = 60
    var bubbleSliderValue = 15
    
    @IBAction func timerSlider(_ sender: UISlider) {
        timeSliderValue = Int(sender.value)
        timeSliderLabel.text = String(Int(sender.value))
    }
    
    @IBAction func bubbleSlider(_ sender: UISlider) {
        bubbleSliderValue = Int(sender.value)
        bubbleSliderLabel.text = String(Int(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGameButton.layer.cornerRadius = 20
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToGame"
        {
            let vc = segue.destination as! GameViewController
            vc.remainingTime = timeSliderValue
            vc.noOfBubble = bubbleSliderValue
        }
        //if nameTextField has no input name, Unknown will be shown.
        //if does, input name will be shown.
        guard nameTextField.text!.count == 0 else{
            let playerName = String(nameTextField.text!)
            UserDefaults.standard.set(playerName, forKey: "playerName")
            return
        }
        let playerName = "Unknown"
        UserDefaults.standard.set(playerName, forKey: "playerName")
    

    }
    
}
