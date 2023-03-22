//
//  HomeScreen.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 22/03/23.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedCalculadoraButton()
}

class HomeScreen: UIView {

    weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(text: "Aplicativos", font: UIFont.systemFont(ofSize: 24), textColor: .black)
        
        return label
    }()
    
    lazy var calculadoraButton: UIButton = {
        let button = UIButton(title: "Calculadora ", font: UIFont.systemFont(ofSize: 16), titleColor: .white, target: self, action: #selector(tappedCalculadoraButton), isEnable: true, backgroundColor: .blue, textAlignment: .center, cornerRadius: 7, clipsToBounds: true)
        
        return button
    }()
    @objc func tappedCalculadoraButton(_ sender: UIButton){
        delegate?.tappedCalculadoraButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCreationView()
        configConstraints()
        
        self.setBackgroundColor(.white)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupCreationView(){
        addSubview(titleLabel)
        addSubview(calculadoraButton)
    }
    

    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            calculadoraButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            calculadoraButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            
            
        ])
    }
    
}
