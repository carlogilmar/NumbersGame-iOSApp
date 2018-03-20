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
    
    @IBAction func startButtonDidTap(_ sender: UIButton) {
        
        self.numberToGuess = self.randomNumber(upperBound: 100)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        let numberAsText = numberFormatter.string(for: numberToGuess)
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: numberAsText!)
        synthesizer.speak(utterance)
    }
    
    @IBAction func leftButtonDidTap(_ sender: UIButton) {
    
    }
    
    @IBAction func rightButtonDidTap(_ sender: UIButton) {
    
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
