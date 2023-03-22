//
//  CalculadoraHomeScreen.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 22/03/23.
//

import UIKit

protocol CalculadoraHomeScreenProtocol: AnyObject {
    func tappedResultButton()
}

class CalculadoraHomeScreen: UIView {

    weak var delegate: CalculadoraHomeScreenProtocol?
    
    public func delegate(delegate: CalculadoraHomeScreenProtocol){
        self.delegate = delegate
    }
    
}
