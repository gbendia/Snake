//
//  GameViewController.swift
//  Snake
//
//  Created by Gabriel Bendia on 12/12/17.
//  Copyright © 2017 Gabriel Bendia. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var gameView: GameView!
    var timeInterval: TimeInterval!
    var gameTime: Timer!
    var difficultyTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameView = GameView(view: self.view, parent: self)
        print("\n\ntimeInterval: \(self.timeInterval)\n\n")
        
    }
    
}
