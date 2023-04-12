//
//  TarefasVC.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 27/03/23.
//

import UIKit

class TarefasVC: UIViewController {

    
    
    var tarefasScreen: TarefasScreen?
    let viewModel = TarefasViewModel()
    
    override func loadView() {
        self.tarefasScreen = TarefasScreen()
        self.view = self.tarefasScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tarefasScreen?.textFieldDelegate(delegate: self)
        self.tarefasScreen?.delegate(delegate: self)
        self.tarefasScreen?.setupTableView(dataSource: self, delegate: self)
        
    }
    
    

}
extension TarefasVC: UITextFieldDelegate {
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
    func tappedTarefasButton() {
        print(#function)
        guard let tarefasScreen = tarefasScreen,
              let tarefaTitle = tarefasScreen.tarefaTextField.text, !tarefaTitle.isEmpty else {
            return
        }
        viewModel.adicionarTarefa(titulo: tarefaTitle)
        tarefasScreen.tarefaTextField.text = ""
        tarefasScreen.tableView.reloadData()
    }
}

extension TarefasVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tarefas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TarefasTableViewCell
        let tarefa = viewModel.tarefas[indexPath.row]
        cell.configureCell(title: tarefa.title)
        

        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Permite que as linhas da tabela possam ser editadas
        return true
    }
}
