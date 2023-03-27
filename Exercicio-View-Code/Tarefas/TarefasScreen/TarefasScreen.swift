//
//  TarefasScreen.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 27/03/23.
//

import UIKit

protocol TarefasScreenProtocol: AnyObject {
    func tappedConfirmedButton()
}

class TarefasScreen: UIView {
   
    
    weak var delegate: TarefasScreenProtocol?
    
    
    public func delegate(delegate: TarefasScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(text: "Tarefas", font: UIFont.systemFont(ofSize: 24), textColor: .black)

        return label
    }()
    
    lazy var tarefasTextField: UITextField = {
        let txf = UITextField(placeholder: "Digite a Tarefa", textColor:.black , font: UIFont.systemFont(ofSize: 20), backgroundColor: .gray.withAlphaComponent(0.2), textAlignment: .center, cornerRadius: 7, clipsToBounds: true, isEnabled: true, isUserInteractionEnabled: true, keyboardType: .default)
        
        return txf
    }()
    
    lazy var confirmedButton: UIButton = {
        let button = UIButton(title: "Confirmar", font: UIFont.systemFont(ofSize: 16), titleColor: .white, target: self, action: #selector(tappedConfirmedButton), isEnable: true, backgroundColor: .blue, textAlignment: .center, cornerRadius: 7, clipsToBounds: true)
        
        return button
    }()
    
    @objc func tappedConfirmedButton(_ sender: UIButton){
        delegate?.tappedConfirmedButton()
        tableView.reloadData()
    }

    lazy var tableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.separatorStyle = .singleLine
        tbv.backgroundColor = .white
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

    public func textFieldDelegate(delegate: UITextFieldDelegate){
        self.tarefasTextField.delegate = delegate
    }
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCreationView()
        configConstraints()
        self.setBackgroundColor(.white)
        tableView.reloadData() //CArrega os dados da tableView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupCreationView(){
        addSubview(titleLabel)
        addSubview(tarefasTextField)
        addSubview(confirmedButton)
        addSubview(tableView)

    }
    

    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tarefasTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            tarefasTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tarefasTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tarefasTextField.widthAnchor.constraint(equalToConstant: 150),
            tarefasTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmedButton.topAnchor.constraint(equalTo: tarefasTextField.bottomAnchor, constant: 20),
            confirmedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            confirmedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            confirmedButton.widthAnchor.constraint(equalToConstant: 150),
            confirmedButton.heightAnchor.constraint(equalToConstant: 30),
            
            tableView.topAnchor.constraint(equalTo: confirmedButton.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
            
        ])
    }
}
