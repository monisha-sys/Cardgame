//
//  ViewController.swift
//  CardGameproject
//
//  Created by Mounika Reddy on 25/06/20.
//  Copyright © 2020 Mounika Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var firstCardFlipped:IndexPath?
    
    let modelObj = CardModel()
    var cardArray = [Card]()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardArray = modelObj.getCard()
        
        // set the viewcontroller as the datasource and delegate of the collection view
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        
       
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return number of items in section
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        //configure the cell
        
        // return it
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
             // Configure the state of the cell based on the properties of the Card that it represents
              
              let cardCell = cell as? CardCollectionViewCell
              
              // Get the card from the card array
              let card = cardArray[indexPath.row]
              
              // Finish configuring the cell
              cardCell?.getCell(card: card)

              
    }
    
    // didSelectItemAt method is used to represent the which item we selected and what operation should work by tapping that particular item
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // reference to the cell that what we tapped
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        if cell.card?.isFlipped == false && cell.card?.isMatched == false{
            
            //flip up cell
            cell.flipUpCard()
            
            // check firstcard is flipped or second one
            if firstCardFlipped == nil{
                
                // first card is flipped
                firstCardFlipped = indexPath
                
            }else{
                
                // second card is flipped
                matching(secondCardFlipped: indexPath)
            }
            
        }
        
    }
    
    func matching(secondCardFlipped:IndexPath)  {
        
         // Get the two card objects
         let cardOne = cardArray[firstCardFlipped!.row]
         let cardTwo = cardArray[secondCardFlipped.row]
         
         // Get the two collection view cells that represent card one and two
        let cardOneCell = cardCollectionView.cellForItem(at: firstCardFlipped!) as? CardCollectionViewCell
         let cardTwoCell = cardCollectionView.cellForItem(at: secondCardFlipped) as? CardCollectionViewCell
         
         // Compare the two cards
         if cardOne.imageName == cardTwo.imageName {
             
             // It's a match
             // Set the status and remove them
             cardOne.isMatched = true
             cardTwo.isMatched = true
             
             cardOneCell?.removeCard()
             cardTwoCell?.removeCard()
             
        }
         else {
             
             // It's not a match
             cardOne.isFlipped = false
             cardTwo.isFlipped = false
             
             // Flip them back over
             cardOneCell?.flipDownCard()
             cardTwoCell?.flipDownCard()
         }
         
         // Reset the firstFlippedCardIndex property
         firstCardFlipped = nil
    }
    
    
    
}

