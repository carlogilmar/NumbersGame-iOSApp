//
//  GameViewController.swift
//  GuessNumbers
//
//  Created by Carlo Gilmar on 3/20/18.
//  Copyright © 2018 Carlo Gilmar. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var numberToGuess: Int!
    var score: Int = 3
    var coins: Int = 3
    
    @IBAction func startButtonDidTap(_ sender: UIButton) {
        
        self.numberToGuess = self.randomNumber(upperBound: 100)
        
        let wrongNumber = self.randomNumber(upperBound: 100)
        let flipCoin = self.randomNumber(upperBound: 2)
        
        if (flipCoin == 0){
            self.leftButton.setTitle("\(self.numberToGuess!)", for: .normal)
            self.leftButton.tag = self.numberToGuess!
            self.rightButton.setTitle("\(wrongNumber)", for: .normal)
            self.rightButton.tag = wrongNumber
        } else {
            self.rightButton.setTitle("\(self.numberToGuess!)", for: .normal)
            self.rightButton.tag = self.numberToGuess!
            self.leftButton.setTitle("\(wrongNumber)", for: .normal)
            self.leftButton.tag = wrongNumber
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        let numberAsText = numberFormatter.string(for: numberToGuess)
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: numberAsText!)
        synthesizer.speak(utterance)
    }
    
    @IBAction func leftButtonDidTap(_ sender: UIButton) {
        
        if sender.tag == self.numberToGuess {
            self.score = self.score + 1
            self.scoreLabel.text = "Score: \(self.score)"
            self.startButtonDidTap(self.startButton)
        } else {
            self.coins = self.coins - 1
            
            if self.coins == 0 {
                self.performSegue(withIdentifier: "gameOver", sender: nil)
            } else {
                self.coinLabel.text = "Coins: \(self.coins)"
                self.startButtonDidTap(self.startButton)
            }
            
        }
        
    }
    
    @IBAction func rightButtonDidTap(_ sender: UIButton) {
        
        if sender.tag == self.numberToGuess {
            self.score = self.score + 1
            self.scoreLabel.text = "Score: \(self.score)"
            self.startButtonDidTap(self.startButton)
        } else {
            self.coins = self.coins - 1
            
            if self.coins == 0 {
                self.performSegue(withIdentifier: "gameOver", sender: nil)
            } else {
                self.coinLabel.text = "Coins: \(self.coins)"
                self.startButtonDidTap(self.startButton)
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomNumber(upperBound: UInt32) -> Int{
        return (Int(arc4random_uniform(upperBound)))
    }

}
