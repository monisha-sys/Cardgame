//
//  CardModel.swift
//  CardGameproject
//
//  Created by Mounika Reddy on 25/06/20.
//  Copyright © 2020 Mounika Reddy. All rights reserved.
//

import Foundation
class CardModel {
    
    func getCard()->[Card]{
        
        // create an empty array to get the card
        var generatedCards = [Card]()
        
        //randomly generating 4 pairs of cards
        for _ in 1...8{
            
            // generate a random number
            let randomNumber = arc4random_uniform(13) + 1
            
            // create two new card objects
            let cardOne = Card()
            let cardTwo = Card()
            
            //set images to new card objects
            cardOne.imageName = "card\(randomNumber)"
            cardTwo.imageName = "card\(randomNumber)"
            
            // append the images of cards to empty array
            generatedCards.append(cardOne)
            generatedCards.append(cardTwo)
            
            print(randomNumber)
            
        }
        
        // randomize the cards within the array
        generatedCards.shuffle()
        
      //return the array
        return generatedCards
    }
    
}
