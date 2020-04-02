//
//  KennyCon.swift
//  KennyT
//
//  Created by Mert Demirezen on 6.06.2019.
//  Copyright © 2019 Mert Demirezen. All rights reserved.
//

import Foundation
import UIKit

class gameVariables : ViewController  {
    
    @objc func increaseScoree() {
        score += 1
    }
    
    @objc func hideKenny2() {
        for i in kennyArray.indices {
            kennyArray[i].isHidden = true
            }
        let randomKenny2 = Int(arc4random_uniform(UInt32(self.kennyCount)))
        self.kennyArray[randomKenny2].isHidden = false
    }
    @objc func descreaseTime () {
        if gameTime < 1 {
            endGame()
        }
        gameTime -= 1
    }

    
}
