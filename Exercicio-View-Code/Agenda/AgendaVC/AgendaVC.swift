//
//  AgendaVC.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 28/03/23.
//

import UIKit

class AgendaVC: UIViewController {
    
    // Declaração de propriedades da classe
    var agendaScreen: AgendaScreen?
    let viewModel = AgendaViewModel()
    
    // Computed property que retorna a agenda filtrada para a data selecionada
    var filteredAgenda: [AgendaViewModel.AgendaItem] {
        let selectedDate = agendaScreen?.calendar.date ?? Date()
        return viewModel.filteredAgenda(selectedDate: selectedDate)
    }
    
    // Função que é executada quando a view é carregada
    override func loadView() {
        self.agendaScreen = AgendaScreen()
        self.view = self.agendaScreen
    }
    
    // Função que é executada quando a view é carregada na memória
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configura o delegate do textField e do AgendaScreenProtocol
        self.agendaScreen?.textFieldDelegate(delegate: self)
        self.agendaScreen?.delegate(delegate: self)
        
        // Configura o dataSource e delegate da tableView
        self.agendaScreen?.setupTableView(dataSource: self, delegate: self)
    }
}

// Implementação do AgendaScreenProtocol para tratar ação do botão de confirmar e a mudança de data
extension AgendaVC: AgendaScreenProtocol {
    func tappedConfirmedButton() {
        guard let agendaScreen = agendaScreen,
              let agendaTitle = agendaScreen.agendaTextField.text,
              !agendaTitle.isEmpty else {
            return
        }

        // Adiciona uma nova tarefa na agenda e recarrega a tabela
        let selectedDate = agendaScreen.calendar.date
        viewModel.addAgendaItem(date: selectedDate, title: agendaTitle)
        agendaScreen.agendaTextField.text = ""
        agendaScreen.tableView.reloadData()
    }
    
    func selectedDateChanged() {
        // Recarrega a tabela quando a data selecionada é alterada
        agendaScreen?.tableView.reloadData()
    }
}

// Implementação dos métodos do UITextFieldDelegate
extension AgendaVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return false
    }
}

// Implementação do UITableViewDataSource e UITableViewDelegate para a tableView
extension AgendaVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Retorna o número de linhas na tabela
        return filteredAgenda.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configura a célula da tabela com as informações da agenda
        let cell = tableView.dequeueReusableCell(withIdentifier: "AgendaTableViewCell", for: indexPath) as! AgendaTableViewCell
        
        let agendaItem = filteredAgenda[indexPath.row]
        cell.configureCell(title: agendaItem.title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Permite que as linhas da tabela possam ser editadas
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove a tarefa da agenda e a linha correspondente na tabela
            viewModel.removeAgendaItem(at: indexPath.row)
            // remover a agenda do array
            viewModel.removeAgendaItem(at: indexPath.row)
            
            // remover a linha da tabela
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // aqui é onde você pode adicionar uma nova agenda
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "Editar") { [weak self] _, indexPath in
            guard let self = self else { return }
            
            let alertController = UIAlertController(
                title: "Editar Tarefa",
                message: "Insira o novo texto para a tarefa",
                preferredStyle: .alert
            )
            
            alertController.addTextField { textField in
                textField.text = self.filteredAgenda[indexPath.row].title
            }
            
            let confirmAction = UIAlertAction(title: "Confirmar", style: .default) { _ in
                if let newTarefa = alertController.textFields?.first?.text, !newTarefa.isEmpty {
                    self.viewModel.updateAgendaTitle(at: indexPath.row, title: newTarefa)
                    self.agendaScreen?.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        editAction.backgroundColor = .blue
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Deletar") { [weak self] _, indexPath in
            guard let self = self else { return }
            
            self.viewModel.removeAgendaItem(at: indexPath.row)
            self.agendaScreen?.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.backgroundColor = .red
        return [deleteAction, editAction]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAgendaItem = filteredAgenda[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let dateString = dateFormatter.string(from: selectedAgendaItem.date)
        print("Agenda selecionada em \(dateString): \(selectedAgendaItem.title)")
    }
}
