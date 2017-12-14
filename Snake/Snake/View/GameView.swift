//
//  GameView.swift
//  Snake
//
//  Created by Gabriel Bendia on 12/12/17.
//  Copyright © 2017 Gabriel Bendia. All rights reserved.
//

import UIKit

class GameView: UIView {
    
    var pointsLabel: UILabel!
    var numberOfPointsLabel: UILabel!
    var timeLabel: UILabel!
    var secondsLabel: UILabel!
    
    // Matriz representando as casas onde a cobra pode andar. 19 de altura e 12 de largura, com um total de 228 casas
    var grid: UIView!
    var borderSize: CGFloat!
    var cellSize: CGFloat!
    
    init(view: UIView, parent: GameViewController) {
        super.init(frame: view.frame)
        
        // Caso seja o iPhone SE, a matriz será diferente por causa do tamanho da tela
        if view.frame.width == 320 {
            self.borderSize = 10
        } else {
            self.borderSize = 7.5
        }
        self.cellSize = (view.frame.width - 2 * self.borderSize) / 12
        
        // Configurações da View
        view.backgroundColor = UIColor.init(red: 9/255, green: 41/255, blue: 3/255, alpha: 1)
        
        // MARK: grid
        self.grid = UIView(frame: CGRect(x: self.borderSize, y: view.frame.height - (self.borderSize + 19 * cellSize), width: 12 * cellSize, height: 19 * cellSize))
        self.grid.backgroundColor = .white
        
        // MARK: pointsLabel
        self.pointsLabel = UILabel(frame: CGRect(x: self.borderSize, y: self.grid.frame.origin.y - 2 * (view.frame.height * 0.0264084), width: view.frame.width * 0.15625, height: view.frame.height * 0.0264084))
        self.pointsLabel.font = UIFont(name: "AvenirNext-Medium", size: 14)
        self.pointsLabel.text = "pontos"
        self.pointsLabel.textColor = .white
        self.pointsLabel.textAlignment = .left
        
        // MARK: numberOfPointsLabel
        self.numberOfPointsLabel = UILabel(frame: CGRect(x: self.borderSize, y: self.pointsLabel.frame.origin.y - (view.frame.height * 0.0352112), width: view.frame.width * 0.15625, height: view.frame.height * 0.0264084))
        self.numberOfPointsLabel.font = UIFont(name: "AvenirNext-Bold", size: 16)
        self.numberOfPointsLabel.text = "0"
        self.numberOfPointsLabel.textColor = .white
        self.numberOfPointsLabel.textAlignment = .left
        
        // MARK: timeLabel
        self.timeLabel = UILabel(frame: CGRect(x: view.frame.width - (self.borderSize + view.frame.width * 0.09375), y: self.grid.frame.origin.y - 2 * (view.frame.height * 0.0264084), width: view.frame.width * 0.09375, height: view.frame.height * 0.0264084))
        self.timeLabel.font = UIFont(name: "AvenirNext-Medium", size: 14)
        self.timeLabel.text = "seg"
        self.timeLabel.textColor = .white
        self.timeLabel.textAlignment = .right
        
        // MARK: secondsLabel
        self.secondsLabel = UILabel(frame: CGRect(x: view.frame.width - (self.borderSize + view.frame.width * 0.15625), y: self.timeLabel.frame.origin.y - (view.frame.height * 0.0352112), width: view.frame.width * 0.15625, height: view.frame.height * 0.0264084))
        self.secondsLabel.font = UIFont(name: "AvenirNext-Bold", size: 16)
        self.secondsLabel.text = "0"
        self.secondsLabel.textColor = .white
        self.secondsLabel.textAlignment = .right
        
        // MARK: - Add Subviews -
        view.addSubview(grid)
        view.addSubview(pointsLabel)
        view.addSubview(numberOfPointsLabel)
        view.addSubview(timeLabel)
        view.addSubview(secondsLabel)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Métodos da Interface -
    
}
