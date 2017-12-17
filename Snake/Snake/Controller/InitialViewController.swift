//
//  InitialViewController.swift
//  Snake
//
//  Created by Gabriel Bendia on 12/12/17.
//  Copyright © 2017 Gabriel Bendia. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    var initialView: InitialView!
    
    // MARK: - View Controller Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialView = InitialView(view: self.view, parent: self)
        
        // Adicionando métodos dos botões
        initialView.easyModeButton.addTarget(self, action: #selector(easyTapped), for: .touchUpInside)
        initialView.mediumModeButton.addTarget(self, action: #selector(mediumTapped), for: .touchUpInside)
        initialView.hardModeButton.addTarget(self, action: #selector(hardTapped), for: .touchUpInside)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Métodos -
    
    // MARK: - Botões
    
    @objc func easyTapped() {
        
        print("\n\nEASY MODE\n\n")
        
        // Inserindo intervalo de tempo fácil
        let interval = TimeInterval(exactly: 0.4)
        
        let gameController = GameViewController()
        gameController.timeInterval = interval
        self.present(gameController, animated: true, completion: nil)
        
    }
    
    @objc func mediumTapped() {
        
        print("\n\nMEDIUM MODE\n\n")
        
        // Inserindo intervalo de tempo médio
        let interval = TimeInterval(exactly: 0.25)
        
        let gameController = GameViewController()
        gameController.timeInterval = interval
        self.present(gameController, animated: true, completion: nil)
        
    }
    
    @objc func hardTapped() {
        
        print("\n\nHARD MODE\n\n")
        
        // Inserindo intervalo de tempo difícil
        let interval = TimeInterval(exactly: 0.1)
        
        let gameController = GameViewController()
        gameController.timeInterval = interval
        self.present(gameController, animated: true, completion: nil)
        
    }
    
}
