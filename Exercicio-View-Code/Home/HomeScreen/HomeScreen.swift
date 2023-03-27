//
//  HomeScreen.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 22/03/23.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedCalculadoraButton()
    func tappedAlteraCorButton()
    func tappedTarefasButton()
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
    
    lazy var alteraCorButton: UIButton = {
        let button = UIButton(title: "Altera Cor", font: UIFont.systemFont(ofSize: 16), titleColor: .white, target: self, action: #selector(tappedAlteraCorButton), isEnable: true, backgroundColor: .blue, textAlignment: .center, cornerRadius: 7, clipsToBounds: true)
        
        return button
    }()
    @objc func tappedAlteraCorButton(_ sender: UIButton){
        delegate?.tappedAlteraCorButton()
    }
    
    lazy var tarefasButton: UIButton = {
        let button = UIButton(title: "Tarefas", font: UIFont.systemFont(ofSize: 16), titleColor: .white, target: self, action: #selector(tappedTarefasButton), isEnable: true, backgroundColor: .blue, textAlignment: .center, cornerRadius: 7, clipsToBounds: true)
        
        return button
    }()
    @objc func tappedTarefasButton(_ sender: UIButton){
        delegate?.tappedTarefasButton()
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
        addSubview(alteraCorButton)
        addSubview(tarefasButton)
    }
    

    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            calculadoraButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            calculadoraButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            calculadoraButton.heightAnchor.constraint(equalToConstant: 50),
            calculadoraButton.widthAnchor.constraint(equalToConstant: 100),
            
            alteraCorButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            alteraCorButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            alteraCorButton.heightAnchor.constraint(equalToConstant: 50),
            alteraCorButton.widthAnchor.constraint(equalToConstant: 100),
            
            tarefasButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            tarefasButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tarefasButton.heightAnchor.constraint(equalToConstant: 50),
            tarefasButton.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
}
