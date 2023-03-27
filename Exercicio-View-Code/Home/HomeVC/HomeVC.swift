//
//  ViewController.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 22/03/23.
//

import UIKit

class HomeVC: UIViewController {
    

    var homeScreen: HomeScreen?
    let viewModel = HomeViewModel()
    
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.delegate(delegate: self)
        
    }
    
    

}

extension HomeVC: HomeScreenProtocol {
    
    func tappedTarefasButton() {
        print(#function)
    }
    
    func tappedAlteraCorButton() {
        self.view.backgroundColor = viewModel.randomColor()
    }
    
    func tappedCalculadoraButton() {
        let calculadoraHomeVC = CalculadoraHomeVC()
        self.navigationController?.pushViewController(calculadoraHomeVC, animated: true)
    }
    
    
}
