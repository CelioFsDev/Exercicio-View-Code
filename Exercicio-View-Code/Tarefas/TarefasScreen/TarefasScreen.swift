//
//  TarefasScreen.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 27/03/23.
//

import UIKit // Importa o framework UIKit

// Protocolo para ação do botão de tarefas
protocol TarefasScreenProtocol: AnyObject {
    func tappedTarefasButton()
}

// Classe TarefasScreen que herda de UIView
class TarefasScreen: UIView {
    
    // Propriedade delegate do tipo TarefasScreenProtocol
    weak var delegate: TarefasScreenProtocol?
    
    // Método para atribuir o delegate
    public func delegate(delegate: TarefasScreenProtocol){
        self.delegate = delegate
    }
    
    // Label para o título da tela
    lazy var titleLabel: UILabel = {
        var label = UILabel(text: "Tarefas", font: UIFont.boldSystemFont(ofSize: 24), textColor: .black)
        return label
    }()
    
    // Label para uma descrição na tela
    lazy var textLabel: UILabel = {
        var label = UILabel(text: "Agende sua tarefa", font: UIFont.boldSystemFont(ofSize: 20), textColor: .black)
        return label
    }()
    
    // Campo de texto para inserir a tarefa
    lazy var tarefaTextField: UITextField = {
        var tf = UITextField(placeholder: "Digite aqui sua tarefa", textColor: .black.withAlphaComponent(0.5), font: UIFont.systemFont(ofSize: 16), backgroundColor: .darkGray.withAlphaComponent(0.3), textAlignment: .left, cornerRadius: 7, clipsToBounds: true, isEnabled: true, isUserInteractionEnabled: true, keyboardType: .twitter)
        return tf
    }()
    
    // Método para atribuir o delegate do campo de texto
    public func textFieldDelegate(delegate: UITextFieldDelegate){
        self.tarefaTextField.delegate = delegate
    }
    
    // Botão para confirmar a tarefa
    lazy var tarefaButton: UIButton = {
        var button = UIButton(title: "Confirmar", font: UIFont.systemFont(ofSize: 16), titleColor: .white, target: self, action: #selector(tappedTarefasButton), isEnable: true, backgroundColor: .blue,textAlignment: .left, cornerRadius: 7,clipsToBounds: true)
        return button
    }()
    
    // Função chamada ao tocar no botão de tarefas
    @objc func tappedTarefasButton(_ sender: UIButton){
        delegate?.tappedTarefasButton()
    }
    
    // TableView para listar as tarefas
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
    
    // Método para configurar o dataSource e o delegate da tableView
    public func setupTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    
    // Inicializador da classe
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCreationView()
        configConstraints()
        self.setBackgroundColor(.white)
    }
    
    // Inicializador necessário, mas não implementado
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Método para adicionar os elementos na view
       private func setupCreationView(){
           addSubview(titleLabel) // Adiciona a label do título
           addSubview(textLabel) // Adiciona a label de descrição
           addSubview(tarefaTextField) // Adiciona o campo de texto para a tarefa
           addSubview(tarefaButton) // Adiciona o botão de confirmação
           addSubview(tableView) // Adiciona a tabela para listar as tarefas
       }
       
       // Método para configurar as restrições de layout
       private func configConstraints(){
           NSLayoutConstraint.activate([ // Ativa as restrições de layout
               
               // Restrições para a label do título
               titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
               titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
               
               // Restrições para a label de descrição
               textLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 40),
               textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
               
               // Restrições para o campo de texto da tarefa
               tarefaTextField.topAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: 20),
               tarefaTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
               tarefaTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
               tarefaTextField.heightAnchor.constraint(equalToConstant: 40),
               
               // Restrições para o botão de confirmação
               tarefaButton.topAnchor.constraint(equalTo: self.tarefaTextField.bottomAnchor, constant: 20),
               tarefaButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
               tarefaButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
               tarefaButton.heightAnchor.constraint(equalToConstant: 35),
               
               // Restrições para a tabela de tarefas
               tableView.topAnchor.constraint(equalTo: self.tarefaButton.bottomAnchor, constant: 10),
               tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
               tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
               tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
           ])
       }
   }
