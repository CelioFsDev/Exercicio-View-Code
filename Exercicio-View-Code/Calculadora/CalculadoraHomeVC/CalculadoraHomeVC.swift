//
//  CalculadoraHomeVC.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 22/03/23.
//

import UIKit

class CalculadoraHomeVC: UIViewController {
    
    var calculadoraHomeScreen: CalculadoraHomeScreen?
    let viewModel = CalculadoraHomeViewModel()
    
    override func loadView() {
        self.calculadoraHomeScreen = CalculadoraHomeScreen()
        self.view = self.calculadoraHomeScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculadoraHomeScreen?.textFieldDelegate(delegate: self)
        self.calculadoraHomeScreen?.delegate(delegate: self)
    }
    
    public func calcularResultado() {
        viewModel.setNumero1(calculadoraHomeScreen?.numero1TextField.text)
        viewModel.setNumero2(calculadoraHomeScreen?.numero2TextField.text)
        
        switch calculadoraHomeScreen?.segmentedControl.selectedSegmentIndex {
            case 0:
                viewModel.setOperacao(.soma)
            case 1:
                viewModel.setOperacao(.subtracao)
            case 2:
                viewModel.setOperacao(.multiplicacao)
            case 3:
                viewModel.setOperacao(.divisao)
            default:
                break
        }
        
        calculadoraHomeScreen?.resultadoTextField.text = viewModel.resultado
    }
}

extension CalculadoraHomeVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        resignFirstResponder()
        return false
    }
    
}
extension CalculadoraHomeVC:CalculadoraHomeScreenProtocol{
   
    func tappedResultButton() {
        print("Clicou no botao")
        calcularResultado()
        
    }
}
