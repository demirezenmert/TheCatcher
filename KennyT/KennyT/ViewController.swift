    //
    //  ViewController.swift
    //  KennyT
    //
    //  Created by Mert Demirezen on 6.06.2019.
    //  Copyright © 2019 Mert Demirezen. All rights reserved.
    //

    import UIKit
    

    class ViewController: UIViewController {
        

        // --- MARKS : IBOUTLETS
        @IBOutlet weak var scoreText: UILabel!
        
        @IBOutlet weak var timerText: UILabel!
        @IBOutlet weak var hScoreText: UILabel!
        @IBOutlet var kennyArray: [UIButton]!
          
        
        // --- MARKS : IBVARIABLES
        var m = gameVariables ()
        
        
      lazy  var kennyCount = kennyArray.count
        var score  = 0 {
            willSet {
                scoreText.text = "Score:\(score)"
            }
        }
        var gameTime = 10 {
            willSet {
                timerText.text = String(gameTime)
            }
        }
        var timer = Timer()
        var timer2 = Timer()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
     
            let hScore = UserDefaults.standard.object(forKey: "HScore")

            if let SCoree = hScore as? Int {
                hScoreText.text = "HiGh Score:\(SCoree)"
            }else{
                hScoreText.text = "0"
            }
            
           
            // Marks : Game Timer :
            timer = Timer.scheduledTimer(timeInterval: 1 , target: self, selector: #selector(self.m.hideKenny2), userInfo: nil, repeats:  true)
            timerGame()
            
        }
        
        
        // --- MARKS : IBACTIONS
        
        
        @IBAction func touchedKenny(_ sender: UIButton) {
            m.increaseScoree()
         
            
            
        }
        // Marks Funcs :    Hide kenny
    
        @objc func endGame () {
            timer.invalidate()
            timer2.invalidate()
            print("gameFinish")

            if score > Int(hScoreText.text!)! {
                UserDefaults.standard.set(score, forKey: "Hscore")
                UserDefaults.standard.synchronize()
                hScoreText.text = "High Score:\(score)"
            }
            else {
                score = 0
                gameTime = 10
                alert()

            }
            score = 0
            gameTime = 10
            alert()
            
        }
//        @objc func descraseTime () {
//            if gameTime < 1 {
//                endGame()
//
//                //hideKenny()
//            }
//                gameTime -= 1
//
//        }
        @objc func timerGame () {
            timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.m.descreaseTime), userInfo: nil, repeats: true)
        }
        @objc func alert () {
            let alertt = UIAlertController(title: "Time's Up", message: nil, preferredStyle: .alert)
            let reply = UIAlertAction(title: "Play Again", style: .default) { (UIAlertAction) in
              self.timer = Timer.scheduledTimer(timeInterval: 1 , target: self, selector: #selector(self.m.hideKenny2), userInfo: nil, repeats:  true)
                self.timerGame()
            }
            alertt.addAction(reply)
            present(alertt, animated: true, completion: nil)
        }
        

    }

