//
//  Body.swift
//  Snake
//
//  Created by Gabriel Bendia on 12/12/17.
//  Copyright © 2017 Gabriel Bendia. All rights reserved.
//

import Foundation
import UIKit

/// Classe que representa uma parte do corpo da cobra
class Body {
    
    // Posição atual
    var x: Int!
    var y: Int!
    
    // Se a parte do corpo está com comida ou não
    var hasFood: Bool!
    
    // Tamanho de cada parte do corpo (diâmetro do círculo). É alterado quando o jogo inicia para ser do tamanho do lado de cada casa do grid
    private var size: CGFloat!
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        self.hasFood = false
        self.size = GameView.cellSize
    }
    
    /// Retorna o tamanho da parte do corpo da cobra.
    ///
    /// - Returns: Maior tamanho possível para o corpo da cobra (diâmtro quando tem comida nessa parte)
    func getSize() -> CGFloat {
        return self.size
    }
    
    /// Avalia se tem ou não comida na parte do corpo e retorna o raio correspondente.
    ///
    /// - Returns: Raio da parte do corpo. Os raios são diferentes para os casos de ter ou não comida na parte do corpo.
    func getRadius() -> CGFloat {
        // Retorna o maior raio para indicar que há comida nessa parte
        if self.hasFood {
            return CGFloat(getSize()/2)
        } else {
            // Retorna um
            return CGFloat(Double(getSize())/2 * 0.7)
        }
    }
    
}
