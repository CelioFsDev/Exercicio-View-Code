//
//  AgendaScreen.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 28/03/23.
//

import UIKit

class AgendaScreen: UIView {
    
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
        let selectedDate = sender.date
        print("Data selecionada: \(selectedDate)")
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
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            // Adiciona as restrições do calendário abaixo do titleLabel
            calendar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            calendar.centerXAnchor.constraint(equalTo: centerXAnchor),
            calendar.heightAnchor.constraint(equalToConstant: 100) // Ajuste a altura conforme necessário
        ])
    }
}
