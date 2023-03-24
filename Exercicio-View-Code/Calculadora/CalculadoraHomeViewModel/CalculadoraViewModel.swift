//
//  CalculadoraViewModel.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 23/03/23.
//

import Foundation
import UIKit

class CalculadoraHomeViewModel {
    
    private var numero1: Int?
    private var numero2: Int?
    private var operacao: Operacao = .soma
    
    var resultado: String? {
        guard let numero1 = self.numero1, let numero2 = self.numero2 else {
            return nil
        }
        
        switch self.operacao {
        case .soma:
            return "\(numero1 + numero2)"
        case .subtracao:
            return "\(numero1 - numero2)"
        case .multiplicacao:
            return "\(numero1 * numero2)"
        case .divisao:
            if numero2 == 0 {
                return "Erro: divisão por zero"
            } else {
                return "\(Double(numero1) / Double(numero2))"
            }
        }
    }
    
    func setNumero1(_ numero: String?) {
        self.numero1 = Int(numero ?? "")
    }
    
    func setNumero2(_ numero: String?) {
        self.numero2 = Int(numero ?? "")
    }
    
    func setOperacao(_ operacao: Operacao) {
        self.operacao = operacao
    }
    
}

enum Operacao {
    case soma
    case subtracao
    case multiplicacao
    case divisao
}

