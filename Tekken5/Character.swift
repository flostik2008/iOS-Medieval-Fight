//
//  Character.swift
//  Tekken5
//
//  Created by Evgeny Vlasov on 8/17/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp = 100
    
    private var _attackPower = 10
    
    var name = ""
    
    var hp: Int {
        return _hp
    }
    
    var attackPower: Int {
        return _attackPower
    }
    
    var isAlive: Bool {
        get {
        if self._hp <= 0 {
            return false
        } else {
            return true
        }
        }
    }
    
    
    init(name:String, attackPower:Int) {
        self.name = name
        self._attackPower = attackPower
    }
    
    func attackHappened(attackPower: Int) -> Bool {
        self._hp -= attackPower
        return true
    }
    
}





