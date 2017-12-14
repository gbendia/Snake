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
    
    var points: Int! {
        didSet {
            self.gameView.numberOfPointsLabel.text = "\(points)"
        }
    }
    var currentTime: Int! {
        didSet {
            self.gameView.timeLabel.text = "\(currentTime)"
        }
    }
    
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
    
    // MARK: - View Controller Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameView = GameView(view: self.view, parent: self)
        
        self.points = 0
        self.currentTime = 0
        
        // Associa os gestos de swipe up, swipe down, swipe left e swipe right à função criada, swipe(_ gestureRecognizer: UISwipeGestureRecognizer), para realizar a troca de direção da cobra de acordo com o swipe do jogador.
        for direction in [UISwipeGestureRecognizerDirection.right, UISwipeGestureRecognizerDirection.left, UISwipeGestureRecognizerDirection.up, UISwipeGestureRecognizerDirection.down] {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
            gesture.direction = direction
            self.view.addGestureRecognizer(gesture)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("\n\ntimeInterval: \(self.timeInterval)\n\n")
        
        // Inicialização da grid
        self.grid = [ : ]
        for i in 0...18 {
            self.grid[i] = [Int : Int]()
            for j in 0...11 {
                self.grid[i]?[j] = 0
            }
        }
        
        self.startGame()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Ativa o timer para a cobra se movimentar
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    @objc func swipe(_ gestureRecognizer: UISwipeGestureRecognizer) {
        
        // Guarda a direção atual da cobra
        var direction: Direction
        direction = self.snake.getDirection()
        
        switch gestureRecognizer.direction {
        case .up:
            direction = .up
        case .down:
            direction = .down
        case .left:
            direction = .left
        case .right:
            direction = .right
        default:
            print("\n***** Unknown direction ******\n\n")
        }
        if self.snake.changeDirection(to: direction) {
            print("Snake changed direction to \(self.snake.getDirection())\n")
        }
        
    }
    
    // MARK: - Lógica do jogo
    
    /// Inicia um novo jogo criando uma nova cobra e resetando a grid
    private func startGame() {
        self.snake = Snake()
        self.drawSnake()
        self.createFood()
    }
    
    /// Função chamada para encerrar o jogo quando a cobra bate na parede
    private func endGame() {
        // Provisoriamente, volta pra tela de inicio depois de 5 segundos
        
        
        // Fazer a cobra piscar e mostrar um alerta depois
        
    }
    
    /// Verifica o próximo movimento da cobra para fazer as devidas atualizações na interface e realiza o movimento, caso possível.
    private func moveSnake() {
        
        // Variável que indica se a cobra comeu na rodada
        var snakeAte = false
        
        // Posição atual da cabeça da cobra
        let snakeX = self.snake.body.first?.x!
        let snakeY = self.snake.body.first?.y!
        
        // Checando a direção para ver se a cobra irá bater na parede ou não
        switch self.snake.getDirection() {
        case .up:
            if snakeY! - 1 < 0 || self.grid[snakeY! - 1]?[snakeX!] == 2 {
                // Vai bater na parede ou nela mesma
                self.endGame()
                return;
            } else {
                // Não vai bater na parede, então pode se movimentar
                if self.grid[snakeY! - 1]?[snakeX!] == 2 {
                    // Vai comer uma fruta no próximo movimento
                    
                    // Atualiza para onde a cobra vai (para nao criar uma comida na próxima posição da cobra)
                    self.grid[snakeY! - 1]?[snakeX!] = 1
                    
                    // Cria nova comida para a cobra
                    self.createFood()
                    snakeAte = true
                }
            }
            
        case .down:
            if snakeY! + 1 > 18 || self.grid[snakeY! + 1]?[snakeX!] == 1 {
                // Vai bater na parede ou nela mesma
                self.endGame()
                return;
            } else {
                // Não vai bater na parede, então pode se movimentar
                if self.grid[snakeY! + 1]?[snakeX!] == 2 {
                    // Vai comer uma fruta no próximo movimento
                    
                    // Atualiza para onde a cobra vai (para nao criar uma comida na próxima posição da cobra)
                    self.grid[snakeY! + 1]?[snakeX!] = 1
                    
                    // Cria nova comida para a cobra
                    self.createFood()
                    snakeAte = true
                }
            }
            
        case.left:
            if snakeX! - 1 < 0 || self.grid[snakeY!]?[snakeX! - 1] == 1 {
                // Vai bater na parede ou nela mesma
                self.endGame()
                return;
            } else {
                // Não vai bater na parede, então pode se movimentar
                if self.grid[snakeY!]?[snakeX! - 1] == 2 {
                    // Vai comer uma fruta no próximo movimento
                    
                    // Atualiza para onde a cobra vai (para nao criar uma comida na próxima posição da cobra)
                    self.grid[snakeY!]?[snakeX! - 1] = 1
                    
                    // Cria nova comida para a cobra
                    self.createFood()
                    snakeAte = true
                }
            }
            
        case.right:
            if snakeX! + 1 > 11 || self.grid[snakeY! - 1]?[snakeX! + 1] == 1 {
                // Vai bater na parede ou nela mesma
                self.endGame()
                return;
            } else {
                // Não vai bater na parede, então pode se movimentar
                if self.grid[snakeY! - 1]?[snakeX! + 1] == 2 {
                    // Vai comer uma fruta no próximo movimento
                    
                    // Atualiza para onde a cobra vai (para nao criar uma comida na próxima posição da cobra)
                    self.grid[snakeY! - 1]?[snakeX! + 1] = 1
                    
                    // Cria nova comida para a cobra
                    self.createFood()
                    snakeAte = true
                }
            }
        }
        
        // Caso passe do switch, a cobra pode se movimentar e já comeu a fruta caso esse seja seu próximo movimento. Basta andar e atualiar sua posição na tela.
        
        // Verifica se deve adicionar uma parte à cobra (caso em que a comida já chegou no final do corpo)
        if (self.snake.body.last?.hasFood)! {
            // Cobra vai ganhar uma parte nova, então só adiciona o desenho da cabeça e atualiza o desenho da ultima parte
            
            self.snake.move()
            
            // Verifica se a cobra comeu no movimento
            if snakeAte {
                self.snake.eat()
                
                // Cria nova comida para a cobra
                self.createFood()
            }
            
            // Adiciona o desenho da cabeça
            self.drawBodyFromSnake(pos: 0)
            
            // Atualiza o desenho da ultima parte da cobra
            self.removeDrawnBodyFromSnake(pos: self.snake.body.count-1)
            self.drawBodyFromSnake(pos: self.snake.body.count-1)
            
        } else {
            // Cobra pode realizar o movimento normalmente
            
            self.snake.move()
            
            // Remove o desenho da ultima parte do corpo
            self.removeDrawnBodyFromSnake(pos: self.snake.body.count-1)
            
            if snakeAte {
                self.snake.eat()
                
                // Cria nova comida para a cobra
                self.createFood()
            }
            
            // Adiciona o desenho da cabeça
            self.drawBodyFromSnake(pos: 0)
        }
        
        print("\nFinalizei o movimento: \(String(describing: snakeX)), \(String(describing: snakeY)) -> \(String(describing: self.snake.body.first?.x)), \(String(describing: self.snake.body.first?.y))\n")
        
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
    
    // MARK: - Desenho
    
    /// Desenha uma parte do corpo específica da cobra na grid
    ///
    /// - Parameter pos: Indice da parte do corpo da cobra que deverá ser desenhada
    private func drawBodyFromSnake(pos: Int) {
        self.gameView.drawCirleInGrid(x: self.snake.body[pos].x, y: self.snake.body[pos].y, radius: self.snake.body[pos].getRadius(), color: UIColor(red: 9/255, green: 41/255, blue: 3/255, alpha: 1))
        self.grid[self.snake.body[pos].y]?[self.snake.body[pos].x] = 1
    }
    
    /// Remove o desenho de uma parte do corpo específica da cobra
    ///
    /// - Parameter pos: Indice da parte do corpo da cobra que deverá ser removida da grid
    private func removeDrawnBodyFromSnake(pos: Int) {
        self.gameView.removeDrawingFromPosition(x: self.snake.body[pos].x, y: self.snake.body[pos].y)
        self.grid[self.snake.body[pos].y]?[self.snake.body[pos].x] = 0
    }
    
    /// Desenha todas as partes do corpo da cobra na grid
    private func drawSnake() {
        for i in 0...snake.body.count-1 {
            self.drawBodyFromSnake(pos: i)
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
