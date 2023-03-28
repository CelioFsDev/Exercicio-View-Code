//
//  AgendaScreen.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 28/03/23.
//

import UIKit

protocol AgendaScreenProtocol: AnyObject {
    func tappedConfirmedButton()
    func selectedDateChanged()
}


class AgendaScreen: UIView {
    
    weak var delegate: AgendaScreenProtocol?
    
    
    public func delegate(delegate: AgendaScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Calendario de Tarefas"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var calendar: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        return datePicker
    }()
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        print("Data selecionada: \(sender.date)")
        selectedDate = sender.date
    }
    
    lazy var agendaTextField: UITextField = {
        let txf = UITextField(placeholder: "Digite a Tarefa", textColor:.black , font: UIFont.systemFont(ofSize: 20), backgroundColor: .gray.withAlphaComponent(0.2), textAlignment: .center, cornerRadius: 7, clipsToBounds: true, isEnabled: true, isUserInteractionEnabled: true, keyboardType: .default)
        
        return txf
    }()
    
    public func textFieldDelegate(delegate: UITextFieldDelegate){
        self.agendaTextField.delegate = delegate
    }
    
    lazy var confirmedButton: UIButton = {
        let button = UIButton(title: "Confirmar", font: UIFont.systemFont(ofSize: 16), titleColor: .white, target: self, action: #selector(tappedConfirmedButton), isEnable: true, backgroundColor: .blue, textAlignment: .center, cornerRadius: 7, clipsToBounds: true)
        
        return button
    }()
    
    @objc func tappedConfirmedButton(_ sender: UIButton){
        delegate?.tappedConfirmedButton()
        
    }
    
    lazy var tableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.separatorStyle = .singleLine
        tbv.backgroundColor = .white
        tbv.rowHeight = UITableView.automaticDimension
        tbv.estimatedRowHeight = 44
        tbv.allowsSelection = true
        tbv.register(AgendaTableViewCell.self, forCellReuseIdentifier: "AgendaTableViewCell")
        return tbv
    }()
    
    public func setupTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    var selectedDate: Date = Date() {
        didSet {
            delegate?.selectedDateChanged()
        }
    }

  

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCreationView()
        configConstraints()
        setBackgroundColor(.white)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCreationView(){
        addSubview(titleLabel)
        addSubview(calendar)
        addSubview(agendaTextField)
        addSubview(confirmedButton)
        addSubview(tableView)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // Adiciona as restrições do calendário abaixo do titleLabel
            calendar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            calendar.centerXAnchor.constraint(equalTo: centerXAnchor),
            calendar.heightAnchor.constraint(equalToConstant: 100), // Ajuste a altura conforme necessário
            
            agendaTextField.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 10),
            agendaTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            agendaTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            agendaTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmedButton.topAnchor.constraint(equalTo: agendaTextField.bottomAnchor, constant: 10),
            confirmedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            confirmedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: confirmedButton.bottomAnchor, constant: 10), // Corrigido: referência ao confirmedButton.bottomAnchor
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10), // Adicionado: restrição à parte inferior da tela
        ])
    }
}
