//
//  Bubble.swift
//  Pop it
//
//  Created by Thaw Zin on 24/4/21.
//

import UIKit

class Bubble: UIButton{
    
    var score = 0
    var bubble = [CGRect]()
    
    override init(frame: CGRect){
    super.init(frame: frame)
        
        self.bubbleType()
        //bubble to be showen in this range
        let xPosition = CGFloat.random(in: 20...300)
        let yPosition = CGFloat.random(in: 150...800)
        
        self.frame = CGRect (x: xPosition, y: yPosition, width: 60, height: 60)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //different colors of bubble and their scores
    @objc func bubbleType() {
        let randomBubbleType = Float.random(in: 0.0...1.0)
        switch randomBubbleType {
        
        case 0.0...0.4:
            self.backgroundColor = .systemRed
            score = 1
            
        case 0.41...0.7:
            self.backgroundColor = .systemPink
            score = 2
            
        case 0.71...0.86:
            self.backgroundColor = .systemGreen
            score = 5
            
        case 0.87...0.97:
            self.backgroundColor = .systemBlue
            score = 8
            
        default:
            self.backgroundColor = .black
            score = 10
            
        }
    }
    //bubble animation
    func animation(){
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.duration = 0.5
        animation.fromValue = 1
        animation.toValue = 0.8
        animation.repeatCount = 1
        animation.initialVelocity  = 0.5
        animation.damping = 1
        
        layer.add(animation, forKey: nil)
    }
}
