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

    // MARK: - Properties

    weak var delegate: CalculadoraHomeScreenProtocol?
    
    public func delegate(delegate: CalculadoraHomeScreenProtocol){
        self.delegate = delegate
    }

    lazy var nameLabel: UILabel = {
        let label = UILabel(
            text: "Calculadora",
            font: UIFont.systemFont(ofSize: 24),
            textColor: .black
        )

        return label
    }()

    lazy var resultadoTextField: UITextField = {
        let textField = UITextField(
            placeholder: "Resultado",
            textColor: .black,
            font: UIFont.systemFont(ofSize: 24),
            backgroundColor: .gray.withAlphaComponent(0.3),
            textAlignment: .center,
            cornerRadius: 7,
            clipsToBounds: true,
            isEnabled: false,
            isUserInteractionEnabled: true,
            keyboardType: .default
        )

        return textField
    }()

    lazy var numero1TextField: UITextField = {
        let textField = UITextField(
            placeholder: "0.0",
            textColor: .black,
            font: UIFont.systemFont(ofSize: 16),
            backgroundColor: .gray.withAlphaComponent(0.3),
            textAlignment: .center,
            cornerRadius: 7,
            clipsToBounds: true,
            isEnabled: true,
            isUserInteractionEnabled: true,
            keyboardType: .numberPad
        )

        return textField
    }()

    lazy var numero2TextField: UITextField = {
        let textField = UITextField(
            placeholder: "0.0",
            textColor: .black,
            font: UIFont.systemFont(ofSize: 16),
            backgroundColor: .gray.withAlphaComponent(0.3),
            textAlignment: .center,
            cornerRadius: 7,
            clipsToBounds: true,
            isEnabled: true,
            isUserInteractionEnabled: true,
            keyboardType: .numberPad
        )

        return textField
    }()

    let segmentedControl: UISegmentedControl = {
        let items = ["+", "-", "*", "/"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        return segmentedControl
    }()

    lazy var resultadoButton: UIButton = {
        let button = UIButton(
            title: "Confirmar",
            font: UIFont.systemFont(ofSize: 16),
            titleColor: .white,
            target: self,
            action: #selector(tappedResultButton),
            isEnable: true,
            backgroundColor: .blue,
            textAlignment: .center,
            cornerRadius: 7,
            clipsToBounds: true
        )

        return button
    }()
    
    @objc func tappedResultButton(_ sender: UIButton) {
        delegate?.tappedResultButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCreationView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupCreationView(){
        addSubview(nameLabel)
        addSubview(resultadoTextField)
        addSubview(numero1TextField)
        addSubview(segmentedControl)
        addSubview(numero2TextField)
        addSubview(resultadoButton)
        backgroundColor = .white
        
    }
    
    public func textFieldDelegate(delegate: UITextFieldDelegate){
        self.numero1TextField.delegate = delegate
        self.numero2TextField.delegate = delegate
        self.resultadoTextField.delegate = delegate
    }
    
    

        
    
    // MARK: - Constraints da label
    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

    // MARK: - Constraints do resultadoTextField
    private func setupResultadoTextFieldConstraints() {
        NSLayoutConstraint.activate([
            resultadoTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            resultadoTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            resultadoTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            resultadoTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    // MARK: - Constraints dos textFields de entrada
    private func setupNumero1TextFieldConstraints() {
        NSLayoutConstraint.activate([
            numero1TextField.topAnchor.constraint(equalTo: resultadoTextField.bottomAnchor, constant: 10),
            numero1TextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            numero1TextField.widthAnchor.constraint(equalToConstant: 80),
            numero1TextField.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        NSLayoutConstraint.activate([
            numero2TextField.topAnchor.constraint(equalTo: resultadoTextField.bottomAnchor, constant: 10),
            numero2TextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            numero2TextField.widthAnchor.constraint(equalToConstant: 80),
            numero2TextField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }

    // MARK: - Constraints do segmentedControl
    private func setupSegmentedControlConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: resultadoTextField.bottomAnchor, constant: 10),
            segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

    // MARK: - Constraints do resultadoButton
    private func setupResultadoButtonConstraints() {
        NSLayoutConstraint.activate([
            resultadoButton.topAnchor.constraint(equalTo: numero1TextField.bottomAnchor, constant: 30),
            resultadoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resultadoButton.heightAnchor.constraint(equalToConstant: 50),
            resultadoButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }

    // MARK: - Configuração geral das constraints
    private func configConstraints() {
        setupNameLabelConstraints()
        setupResultadoTextFieldConstraints()
        setupNumero1TextFieldConstraints()
        setupSegmentedControlConstraints()
        setupResultadoButtonConstraints()
    }

    
}
