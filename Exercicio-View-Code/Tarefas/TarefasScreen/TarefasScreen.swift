//
//  TarefasScreen.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 27/03/23.
//

import UIKit

protocol TarefasScreenProtocol: AnyObject {
    func tappedTarefasButton()
}


class TarefasScreen: UIView {
    
    weak var delegate: TarefasScreenProtocol?
    
    
    public func delegate(delegate: TarefasScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        var label = UILabel(text: "Tarefas", font: UIFont.boldSystemFont(ofSize: 24), textColor: .black)
        
        return label
        
    }()
    
    lazy var textLabel: UILabel = {
        var label = UILabel(text: "Agende sua tarefa", font: UIFont.boldSystemFont(ofSize: 20), textColor: .black)
        
        return label
        
    }()
    
    lazy var tarefaTextField: UITextField = {
        var tf = UITextField(placeholder: "Digite aqui sua tarefa", textColor: .black.withAlphaComponent(0.5), font: UIFont.systemFont(ofSize: 16), backgroundColor: .darkGray.withAlphaComponent(0.3), textAlignment: .left, cornerRadius: 7, clipsToBounds: true, isEnabled: true, isUserInteractionEnabled: true, keyboardType: .twitter)
        
        return tf
    }()
    public func textFieldDelegate(delegate: UITextFieldDelegate){
        self.tarefaTextField.delegate = delegate
    }
    
    lazy var tarefaButton: UIButton = {
        var button = UIButton(title: "Confirmar", font: UIFont.systemFont(ofSize: 16), titleColor: .white, target: self, action: #selector(tappedTarefasButton), isEnable: true, backgroundColor: .blue,textAlignment: .left, cornerRadius: 7,clipsToBounds: true)
        
        return button
    }()
    
    @objc func tappedTarefasButton(_ sender: UIButton){
        delegate?.tappedTarefasButton()
    }
    
    lazy var tableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.separatorStyle = .singleLine
        tbv.backgroundColor = .darkGray.withAlphaComponent(0.5)
        tbv.rowHeight = UITableView.automaticDimension
        tbv.estimatedRowHeight = 44
        tbv.allowsSelection = true
        tbv.register(TarefasTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        return tbv
    }()
    
    public func setupTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
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
        addSubview(textLabel)
        addSubview(tarefaTextField)
        addSubview(tarefaButton)
        addSubview(tableView)
    }
    

    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            textLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 40),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            tarefaTextField.topAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: 20),
            tarefaTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tarefaTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            tarefaTextField.heightAnchor.constraint(equalToConstant: 40),
            
            tarefaButton.topAnchor.constraint(equalTo: self.tarefaTextField.bottomAnchor, constant: 20),
            tarefaButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tarefaButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            tarefaButton.heightAnchor.constraint(equalToConstant: 35),
            
            tableView.topAnchor.constraint(equalTo: self.tarefaButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20), // Corrigido
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10) // Corrigido
                   
            
        ])
    }

}
