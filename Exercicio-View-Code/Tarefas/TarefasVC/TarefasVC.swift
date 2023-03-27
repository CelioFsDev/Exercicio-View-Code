//
//  TarefasVC.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 27/03/23.
//

import UIKit

class TarefasVC: UIViewController {

    var tarefasScreen: TarefasScreen?
    var tarefas: [String] = []
    
    override func loadView() {
        self.tarefasScreen = TarefasScreen()
        self.view = self.tarefasScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tarefasScreen?.textFieldDelegate(delegate: self)
        self.tarefasScreen?.delegate(delegate: self)

        // configurar dataSource e delegate
        self.tarefasScreen?.setupTableView(dataSource: self, delegate: self)
       
    }

}

extension TarefasVC: UITextFieldDelegate{
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

extension TarefasVC: TarefasScreenProtocol {
    func tappedConfirmedButton() {
        guard let tarefa = tarefasScreen?.tarefasTextField.text, !tarefa.isEmpty else { return }
        
        tarefas.append(tarefa)
        tarefasScreen?.tarefasTextField.text = ""
        tarefasScreen?.tableView.reloadData()
    }
}


extension TarefasVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TarefasTableViewCell
        
        let tarefa = tarefas[indexPath.row]
        cell.configureCell(title: tarefa)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // remover a tarefa do array
            tarefas.remove(at: indexPath.row)
            
            // remover a linha da tabela
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // aqui é onde você pode adicionar uma nova tarefa
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "Editar") { [weak self] _, indexPath in
            guard let self = self else { return }

            let alertController = UIAlertController(title: "Editar Tarefa", message: "Insira o novo texto para a tarefa", preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.text = self.tarefas[indexPath.row]
            }

            let confirmAction = UIAlertAction(title: "Confirmar", style: .default) { _ in
                if let newTarefa = alertController.textFields?.first?.text, !newTarefa.isEmpty {
                    self.tarefas[indexPath.row] = newTarefa
                    self.tarefasScreen?.tableView.reloadRows(at: [indexPath], with: .automatic)
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

            self.tarefas.remove(at: indexPath.row)
            self.tarefasScreen?.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = .red
        return [deleteAction, editAction]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }

}
