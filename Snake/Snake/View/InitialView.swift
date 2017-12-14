//
//  InitialView.swift
//  Snake
//
//  Created by Gabriel Bendia on 12/12/17.
//  Copyright © 2017 Gabriel Bendia. All rights reserved.
//

import UIKit

class InitialView: UIView {
    
    var titleImage: UIImageView!
    var easyModeButton: UIButton!
    var mediumModeButton: UIButton!
    var hardModeButton: UIButton!
    
    init(view: UIView, parent: InitialViewController) {
        super.init(frame: view.frame)
        
        // Configurações da View
        view.backgroundColor = UIColor.init(red: 9/255, green: 41/255, blue: 3/255, alpha: 1)
        
        // MARK: titleImage
        self.titleImage = UIImageView(frame: CGRect.init(x: 0, y: view.frame.height * 0.255281, width: view.frame.width * 0.734375, height: view.frame.height * 0.105633))
        // Ajustando o x do centro para o meio da tela
        self.titleImage.center.x = view.center.x
        self.titleImage.image = UIImage(named: "Snake_Title")
        self.titleImage.contentMode = .scaleAspectFit
        
        // MARK: easyModeButton
        
        self.easyModeButton = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.540492, width: view.frame.width * 0.1875, height: view.frame.height * 0.0528169))
        // Ajustando o x do centro para o meio da tela
        self.easyModeButton.center.x = view.center.x
        self.easyModeButton.setTitle("fácil", for: .normal)
        self.easyModeButton.tintColor = .white
        self.easyModeButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 24)
        self.easyModeButton.titleLabel?.textAlignment = .center
        self.easyModeButton.sendActions(for: .touchDown)
//        self.easyModeButton.showsTouchWhenHighlighted = true
//        self.easyModeButton.reversesTitleShadowWhenHighlighted = true
        
        // MARK: mediumModeButton
        self.mediumModeButton = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.665492, width: view.frame.width * 0.25, height: view.frame.height * 0.0528169))
        // Ajustando o x do centro para o meio da tela
        self.mediumModeButton.center.x = view.center.x
        self.mediumModeButton.setTitle("médio", for: .normal)
        self.mediumModeButton.tintColor = .white
        self.mediumModeButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 24)
        self.mediumModeButton.titleLabel?.textAlignment = .center
        
        // MARK: hardModeButton
        self.hardModeButton = UIButton(frame: CGRect(x: 0, y: view.frame.height * 0.788732, width: view.frame.width * 0.234375, height: view.frame.height * 0.0528169))
        // Ajustando o x do centro para o meio da tela
        self.hardModeButton.center.x = view.center.x
        self.hardModeButton.setTitle("difícil", for: .normal)
        self.hardModeButton.tintColor = .white
        self.hardModeButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 24)
        self.hardModeButton.titleLabel?.textAlignment = .center
        
        // MARK: - Add Subviews -
        view.addSubview(titleImage)
        view.addSubview(easyModeButton)
        view.addSubview(mediumModeButton)
        view.addSubview(hardModeButton)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
