//
//  Snake.swift
//  Snake
//
//  Created by Gabriel Bendia on 12/12/17.
//  Copyright © 2017 Gabriel Bendia. All rights reserved.
//

import Foundation

/// Direções possíveis para onde a cobra pode estar olhando (direção de movimento)
enum Direction {
    case up
    case down
    case left
    case right
}

/// Classe responsável por representar a cobra (array de partes do corpo - Body) e fazer seus movimentos
class Snake {
    
    // Corpo da cobra. Posição inicial é a cabeça da cobra e a posição final é o rabo.
    var body: [Body]!
    
    // Direção para onde a cobra está olhando.
    private var direction: Direction!
    
    init() {
        
        // A cobra sempre começa com 3 partes para o seu corpo (cabeça, corpo e rabo), numa posição previamente definida, olhando para a direita.
        self.body = [Body]()
        self.direction = .right
        
        // Posição inicial da cabeça
        var posX = 0
        let posY = 0
        for _ in 0...2 {
            let newBody = Body(x: posX, y: posY)
            self.body.append(newBody)
            posX -= Body.getSize() // Tamanho de uma parte do corpo (diâmetro da maior bolinha) para inserir a próxima
        }
        
    }
    
    // MARK: - Métodos -
    
    /// Movimenta a cobra. A ultima parte do corpo é retirada e uma é inserida na frente da cobra. Caso a última parte da cobra tenha comida, uma parte nova é inserida no fim para a cobra crescer.
    func move() {
        
        // Caso a cobra tenha comido e a comida chegou ao final uma parte nova é adicionada.
        if (self.body.last?.hasFood)! {
            // Retira a comida da última parte do corpo.
            self.body.last?.hasFood = false;
        } else {
            // Caso não haja comida, remove a última parte do corpo da cobra e pega a posição da cabeça.
            self.body.removeLast()
        }
        
        // Pega a posição atual da cabeça.
        var posX = self.body.first?.x
        var posY = self.body.first?.y
        
        // Verifica a direção que a cobra está olhando para ver em qual posição a cabeça deve estar.
        switch self.direction {
        case .up:
            // Atualiza coordenada y para cima
            posY! -= Body.getSize()
        
        case .down:
            // Atualiza coordenada y para baixo
            posY! += Body.getSize()
        
        case .left:
            // Atualiza a coordenada x para esquerda
            posX! -= Body.getSize()
        
        case .right:
            // Atualiza a coordenada x para direita
            posX! += Body.getSize()
        
        default:
            print("\n***** Unknown direction ******\n\n")
            return
        }
        
        // Cria nova parte.
        let newBody = Body(x: posX!, y: posY!)
        
        // Insere a cabeça na nova posição.
        self.body.insert(newBody, at: 0)
        
    }
    
    /// Altera a direção para onde a cobra está olhando
    ///
    /// - Parameter direction: Direção para onde a cobra deve olhar
    /// - Returns: Sucesso da operação. true se bem sucedida, false caso contrário
    func changeDirection(to direction: Direction) -> Bool {
        
        print("Current direction: \(self.direction)\n")
        print("New direction: \(direction)\n")
        
        switch self.direction {
        case .up:
            // Só pode mudar para direita ou esquerda
            if direction == .left || direction == .right {
                self.direction = direction
                print("Direction successfuly changed\n")
                return true
            }
        
        case .down:
            // Só pode mudar para direita ou esquerda
            if direction == .left || direction == .right {
                self.direction = direction
                print("Direction successfuly changed\n")
                return true
            }
        
        case .left:
            // Só pode mudar para cima ou para baixo
            if direction == .up || direction == .down {
                self.direction = direction
                print("Direction successfuly changed\n")
                return true
            }
        
        case .right:
            // Só pode mudar para cima ou para baixo
            if direction == .up || direction == .down {
                self.direction = direction
                print("Direction successfuly changed\n")
                return true
            }
        
        default:
            print("\n***** Unknown direction ******\n\n")
        }
        
        return false
        
    }
    
    /// Função para pegar a direção atual da cobra. Desta forma mantém o encapsulamento.
    ///
    /// - Returns: Direção atual para onde a cobra está olhando.
    func getDirection() -> Direction {
        return self.direction
    }
    
}
