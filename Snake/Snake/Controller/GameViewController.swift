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
    
    // Intervalo de tempo da dificuldade selecionada
    // Fácil:   1 segundo
    // Médio:   0.5 segundo
    // Difícil: 0.25 segundo
    var timeInterval: TimeInterval!
    
    // Timer para contar o tempo de jogo
    var gameTime: Timer!
    
    // Timer para realizar o movimento da cobra
    var difficultyTimer: Timer!
    
    // Cobra do jogador
    private var snake: Snake!
    
    // Matriz auxiliar para guardar onde tem cobra (1) e onde tem comida (2). Caso não tenha nada, é representado por 0.
    private var grid: [Int : [Int : Int]]!
    
    // Posição da comida
    private var foodX: Int! = -1
    private var foodY: Int! = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameView = GameView(view: self.view, parent: self)
        print("\n\ntimeInterval: \(self.timeInterval)\n\n")
        
        // Inicialização da grid
        self.grid = [ : ]
        for i in 0...18 {
            self.grid[i] = [Int : Int]()
            for j in 0...11 {
                self.grid[i]?[j] = 0
            }
        }
        
        self.snake = Snake()
        self.drawSnake()
        self.createFood()
        
        self.showGrid()
        
    }
    
    // MARK: - Métodos -
    
    /// Mostra a grid do jogo atual no console
    func showGrid() {
        for i in 0...18 {
            for j in 0...11 {
                print("\((grid[i]?[j])!) ", terminator: "")
            }
            print("")
        }
    }
    
    /// Cria comida numa posição onde não tem nenhuma parte da cobra
    private func createFood() {
        
        // Caso já exista uma comida no jogo, remove o desenho para criar outro
        if foodX != -1 && foodY != -1 {
            self.gameView.removeDrawingFromPosition(x: foodX, y: foodY)
            self.grid[foodX]?[foodY] = 0
        }
        
        // Sorteia uma posição para a comida até encontrar uma posição onde não há nada
        var validPosition = false
        while !validPosition {
            self.foodX = Int(arc4random_uniform(11))
            self.foodY = Int(arc4random_uniform(18))
            
            // Verifica se não há alguma coisa na casa sorteada
            if grid[foodX]?[foodY] == 0 {
                validPosition = true
                self.grid[foodY]?[foodX] = 2
            }
        }
        self.drawFood()
        
    }
    
    // MARK: Desenho
    
    /// Desenha uma parte do corpo específica da cobra na grid
    ///
    /// - Parameter pos: Indice da parte do corpo da cobra que deverá ser desenhada
    private func drawBodyFromSnake(pos: Int) {
        self.gameView.drawCirleInGrid(x: self.snake.body[pos].x, y: self.snake.body[pos].y, radius: self.snake.body[pos].getRadius(), color: UIColor(red: 9/255, green: 41/255, blue: 3/255, alpha: 1))
    }
    
    /// Remove o desenho de uma parte do corpo específica da cobra
    ///
    /// - Parameter pos: Indice da parte do corpo da cobra que deverá ser removida da grid
    private func removeDrawnBodyFromSnake(pos: Int) {
        self.gameView.removeDrawingFromPosition(x: self.snake.body[pos].x, y: self.snake.body[pos].y)
    }
    
    /// Desenha todas as partes do corpo da cobra na grid
    private func drawSnake() {
        for i in 0...snake.body.count-1 {
            self.drawBodyFromSnake(pos: i)
            self.grid[self.snake.body[i].y]?[self.snake.body[i].x] = 1
        }
    }
    
    /// Remove a cobra da tela removendo o desenho de todas as suas partes
    private func removeSnake() {
        for i in 0...snake.body.count-1 {
            self.removeDrawnBodyFromSnake(pos: i)
        }
    }
    
    /// Desenha, numa posição aleatória, um círculo vermelho com o raio 0.8 do tamanho da célula para representar a comida da cobra
    private func drawFood() {
        self.gameView.drawCirleInGrid(x: self.foodX, y: self.foodY, radius: GameView.cellSize/2 * 0.8, color: UIColor(red: 150/255, green: 0/255, blue: 0/255, alpha: 1))
    }
    
}
