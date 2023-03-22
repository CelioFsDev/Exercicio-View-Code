//
//  CalculadoraHomeVC.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 22/03/23.
//

import UIKit

class CalculadoraHomeVC: UIViewController {
    
    var calculadoraHomeScreen: CalculadoraHomeScreen?
    
    override func loadView() {
        self.calculadoraHomeScreen = CalculadoraHomeScreen()
        self.view = self.calculadoraHomeScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    

}
