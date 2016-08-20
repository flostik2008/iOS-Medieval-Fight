//
//  ViewController.swift
//  Tekken5
//
//  Created by Evgeny Vlasov on 8/17/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MainLbl: UILabel!
    @IBOutlet weak var HPLbl1: UILabel!
    @IBOutlet weak var HPLbl2: UILabel!
    
    @IBOutlet weak var Character2Img: UIImageView!
    @IBOutlet weak var Character1Img: UIImageView!
    
    @IBOutlet weak var AttackBtn1: UIButton!
    @IBOutlet weak var AttackBtn2: UIButton!
    
    @IBOutlet weak var AttackLbl1: UILabel!
    @IBOutlet weak var AttackLbl2: UILabel!
    
    
    var leftCharacter: Character!
    var rightCharacter: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        generateBothCharacters()
        
        MainLbl.text = "\(leftCharacter.name) is going to fight \(rightCharacter.name)"
        
        HPLbl1.text = "Hlth \(leftCharacter.hp)\nAttck \(leftCharacter.attackPower)"
        
        HPLbl2.text = "Hlth \(rightCharacter.hp)\nAttck \(rightCharacter.attackPower)"
        
        print(" left character attack power = \(leftCharacter.attackPower) and right one = \(rightCharacter.attackPower)")

        
    }

    func generateBothCharacters() {
        let character1 = Character(name: "Dorsy21", attackPower: 16)
        let character2 = Character(name: "Jack2009", attackPower: 11)
        let character3 = Character(name: "Steve17", attackPower: 14)
        let character4 = Character(name: "Elizabeth", attackPower: 17)
        let character5 = Character(name: "Keytlyn", attackPower: 14)
        var arrayOfAllCharacters = [Character] ()
        
        arrayOfAllCharacters += [character1, character2, character3, character4, character5]
       
        
        // generate a such a character so it will be different from the other one. 
 
        
        // create an array of 2 different characters. Then we will access that array and give them as indexes to "arrayOfAllCharacters"
        
        var arrayOf2Digits = [Int] ()
        var i = 0
        while arrayOf2Digits.count <= 1 {
            i++
            let rand = Int(arc4random_uniform(UInt32(5)))
            for (var ii = 0; ii<2; ii++){
                if arrayOf2Digits.contains(rand) {
                
                } else {
                    arrayOf2Digits.append(rand)
                }
                }
        
        }
        
        print("\(arrayOf2Digits)")
        
        leftCharacter = arrayOfAllCharacters[arrayOf2Digits[0]]
        rightCharacter = arrayOfAllCharacters[arrayOf2Digits[1]]
        
        print("\(leftCharacter.name) and \(rightCharacter.name)")
        
    
    }
   
    
    @IBAction func attack1Tapped(sender: AnyObject) {

        if rightCharacter.attackHappened(leftCharacter.attackPower) {
            MainLbl.text = "\(leftCharacter.name) is attacking \(rightCharacter.name)!"
        }
      
        print("\(leftCharacter.name) hp:ap \(leftCharacter.hp) \(leftCharacter.attackPower), \(rightCharacter.name) hp:ap \(rightCharacter.hp) \(rightCharacter.attackPower)")
    
        HPLbl2.text = "Hlth \(rightCharacter.hp)\nAttck \(rightCharacter.attackPower)"
       
        if rightCharacter.hp > 0 {
        HPLbl2.text = "Hlth \(rightCharacter.hp)\nAttck \(rightCharacter.attackPower)"
    } else if rightCharacter.hp <= 0 {
    HPLbl2.text = "Dead"
            Character2Img.hidden = true
            
        // This will disable attack buttons for 3 sec until new game.
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "generateBothCharacters", userInfo: nil, repeats: false)
    }
    
    
        if !rightCharacter.isAlive {
            MainLbl.text = ""
            MainLbl.text = "\(rightCharacter.name) died. \(leftCharacter.name) won."        }
        
        
    
    }
    
    
    @IBAction func attack2Tapped(sender: AnyObject) {
    
        if leftCharacter.attackHappened(rightCharacter.attackPower) {
            MainLbl.text = "\(rightCharacter.name) is attacking \(leftCharacter.name)!"
        }
        
        print("\(leftCharacter.name) hp:ap \(leftCharacter.hp) \(leftCharacter.attackPower), \(rightCharacter.name) hp:ap \(rightCharacter.hp) \(rightCharacter.attackPower)")
        
        if leftCharacter.hp > 0 {
        HPLbl1.text = "Hlth \(leftCharacter.hp)\nAttck \(leftCharacter.attackPower)"
        } else if leftCharacter.hp <= 0 {
            HPLbl1.text = "Dead"
            Character1Img.hidden = true
            // This will disable attack buttons for 3 sec until new game.
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "generateBothCharacters", userInfo: nil, repeats: false)
        }
        
        
        if !leftCharacter.isAlive {
              MainLbl.text = ""
            MainLbl.text = "\(leftCharacter.name) died. \(rightCharacter.name) won."
        }
    }
}






