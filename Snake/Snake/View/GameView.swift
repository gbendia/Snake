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
    var gameOverLabel: UILabel!
    var restartButton: UIButton!
    var backButton: UIButton!
    
    // Matriz representando as casas onde a cobra pode andar. 19 de altura e 12 de largura, com um total de 228 casas. Indipendente do telefone, a matriz terá esses mesmos valores.
    var grid: UIView!
    var borderSize: CGFloat!
    
    static var cellSize: CGFloat!
    
    init(view: UIView, parent: GameViewController) {
        super.init(frame: view.frame)
        
        // Caso seja o iPhone SE, a matriz será diferente por causa do tamanho da tela
        if view.frame.width == 320 {
            self.borderSize = 10
        } else {
            self.borderSize = 7.5
        }
        GameView.cellSize = (view.frame.width - 2 * self.borderSize) / 12
        
        // Configurações da View
        view.backgroundColor = UIColor(red: 9/255, green: 41/255, blue: 3/255, alpha: 1)
        
        // MARK: - Inicialização dos elementos da interface -
        
        // MARK: grid
        self.grid = UIView(frame: CGRect(x: self.borderSize, y: view.frame.height - (self.borderSize + 19 * GameView.cellSize), width: 12 * GameView.cellSize, height: 19 * GameView.cellSize))
        let gridBackgroundImage = UIImageView(image: UIImage(named: "Snake_Grid"))
        gridBackgroundImage.frame = CGRect(x: 0, y: 0, width: self.grid.frame.width, height: self.grid.frame.height)
        gridBackgroundImage.contentMode = .scaleAspectFit
        self.grid.addSubview(gridBackgroundImage)
        
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
        
        // MARK: gameOverLabel
        self.gameOverLabel = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.193661, width: view.frame.width * 0.6, height: view.frame.height * 0.264084))
        // Ajustando o x do centro para o meio da tela (como é subview da grid, tem que diminuir o x da grid para ficar no meio)
        self.gameOverLabel.center.x = self.grid.center.x - self.borderSize
        self.gameOverLabel.lineBreakMode = .byClipping
        self.gameOverLabel.numberOfLines = 0
        self.gameOverLabel.font = UIFont(name: "AvenirNext-Bold", size: 52)
        self.gameOverLabel.text = "GAME\nOVER"
        self.gameOverLabel.textAlignment = .center
        self.gameOverLabel.textColor = UIColor(red: 9/255, green: 41/255, blue: 3/255, alpha: 1)
        self.gameOverLabel.isHidden = true
        
        // MARK: restartButton
        self.restartButton = UIButton(type: .system)
        self.restartButton.frame = CGRect(x: 0, y: self.gameOverLabel.frame.maxY + view.frame.height * 0.0704225, width: view.frame.height * 0.390625, height: view.frame.height * 0.0440140)
        // Ajustando o x do centro para o meio da tela (como é subview da grid, tem que diminuir o x da grid para ficar no meio)
        self.restartButton.center.x = self.grid.center.x - self.borderSize
        self.restartButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 22)
        self.restartButton.setTitle("recomeçar", for: .normal)
        self.restartButton.titleLabel?.textAlignment = .center
        self.restartButton.tintColor = UIColor(red: 9/255, green: 41/255, blue: 3/255, alpha: 1)
        self.restartButton.isHidden = true
        
        // MARK: backButton
        self.backButton = UIButton(type: .system)
        self.backButton.frame = CGRect(x: 0, y: self.restartButton.frame.maxY + view.frame.height * 0.0440140, width: view.frame.width * 0.40625, height: view.frame.height * 0.0440140)
        // Ajustando o x do centro para o meio da tela (como é subview da grid, tem que diminuir o x da grid para ficar no meio)
        self.backButton.center.x = self.grid.center.x - self.borderSize
        self.backButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 22)
        self.backButton.setTitle("sair do jogo", for: .normal)
        self.backButton.titleLabel?.textAlignment = .center
        self.backButton.tintColor = UIColor(red: 9/255, green: 41/255, blue: 3/255, alpha: 1)
        self.backButton.isHidden = true
        
        // MARK: - Add Subviews -
        view.addSubview(grid)
        view.addSubview(pointsLabel)
        view.addSubview(numberOfPointsLabel)
        view.addSubview(timeLabel)
        view.addSubview(secondsLabel)
        self.grid.addSubview(gameOverLabel)
        self.grid.addSubview(restartButton)
        self.grid.addSubview(backButton)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Métodos -
    
    // MARK: - Inserindo desenhos
    
    func drawCirleInGrid(x: Int, y: Int, radius: CGFloat, color: UIColor) {
        
        let originPoint = CGPoint(x: GameView.cellSize/2 + CGFloat(x) * GameView.cellSize, y: GameView.cellSize/2 + CGFloat(y) * GameView.cellSize)
        let circlePath = UIBezierPath(arcCenter: originPoint, radius: radius, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = color.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.name = "\(x), \(y)"
        
        grid.layer.addSublayer(shapeLayer)
        
    }
    
    // MARK: - Removendo desenhos
    
    /// Remove todos os desenhos da grid
    func removeDrawingFromPosition(x: Int, y: Int) {
        if let index = grid.layer.sublayers?.index(where: {( $0.name == "\(x), \(y)" )}) {
            grid.layer.sublayers?.remove(at: index)
        }
    }
    
}
