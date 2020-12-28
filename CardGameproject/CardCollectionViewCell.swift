//
//  CardCollectionViewCell.swift
//  CardGameproject
//
//  Created by Mounika Reddy on 25/06/20.
//  Copyright © 2020 Mounika Reddy. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var frontFaceImageView: UIImageView!
 
    @IBOutlet weak var backFaceImageView: UIImageView!
    
    var card :Card?
    
    func getCell(card:Card) {
        
        //keep the track of card
        self.card = card
        
        //set up image to frontfacecard
        frontFaceImageView.image = UIImage(named: card.imageName)
        
        if card.isMatched == true{
            backFaceImageView.alpha = 0
            frontFaceImageView.alpha = 0
            return
        }else{
            
            backFaceImageView.alpha = 1
            frontFaceImageView.alpha = 1
            
        }
        
        // reset the state of cell whether we tapped cell or not
        if card.isFlipped == true {
            
            // calling the flipup function to show the front face of cell which we tapped and it should be opened without any animation
            flipUpCard(duration: 0)
            
        }else{
            // show the back face of cell
            flipDownCard(duration: 0,delay: 0)
        }
        
    }
    
    func flipUpCard(duration:TimeInterval = 0.3){
        // using transition class to flip the cards animation when we tap thr cell
        UIView.transition(from: backFaceImageView, to: frontFaceImageView, duration: duration, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        
        // set the status of card
        card?.isFlipped = true
        
    }
    
    func flipDownCard(duration:TimeInterval = 0.3, delay:TimeInterval = 0.5){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            // using transition class to flip the cards animation when we tap thr cell
            UIView.transition(from: self.frontFaceImageView, to: self.backFaceImageView, duration: duration, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        }
                    // set the status of card
                   self.card?.isFlipped = false
    }
    
    func removeCard(){
        
        // imageViews are going to invisible once they matched
            backFaceImageView.alpha = 0
            
            
            UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
                
                self.frontFaceImageView.alpha = 0
                
            }, completion: nil)
            
        }
        
}
