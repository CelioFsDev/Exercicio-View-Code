//
//  TarefasVC.swift
//  Exercicio-View-Code
//
//  Created by Celio Ferreira on 27/03/23.
//

// Importa o UIKit, o framework de interface do usuário
import UIKit

// Cria uma classe chamada TarefasVC, que herda de UIViewController
class TarefasVC: UIViewController {

    // Cria uma variável opcional do tipo TarefasScreen
    var tarefasScreen: TarefasScreen?
    // Cria uma instância do modelo de dados chamado TarefasViewModel
    let viewModel = TarefasViewModel()
    
    // Substitui a função loadView do UIViewController
    override func loadView() {
        // Inicializa a variável tarefasScreen com uma instância de TarefasScreen
        self.tarefasScreen = TarefasScreen()
        // Atribui a tarefasScreen como a view principal deste UIViewController
        self.view = self.tarefasScreen
    }
    
    // Substitui a função viewDidLoad do UIViewController
    override func viewDidLoad() {
        
        // Chama a função viewDidLoad da classe base
        super.viewDidLoad()
        
        // Define o delegate do textField na tarefasScreen como esta classe
        self.tarefasScreen?.textFieldDelegate(delegate: self)
        // Define o delegate da tarefasScreen como esta classe
        self.tarefasScreen?.delegate(delegate: self)
        // Configura a tableView na tarefasScreen com esta classe como dataSource e delegate
        self.tarefasScreen?.setupTableView(dataSource: self, delegate: self)
    }
}

// Cria uma extensão da classe TarefasVC, adotando o protocolo UITextFieldDelegate
extension TarefasVC: UITextFieldDelegate {
    // Função chamada quando o textField começa a edição
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    // Função chamada quando o textField termina a edição
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    // Função chamada quando o usuário pressiona a tecla return no teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return false
    }
}

// Cria uma extensão da classe TarefasVC, adotando o protocolo TarefasScreenProtocol
extension TarefasVC: TarefasScreenProtocol {
    // Função chamada quando o botão "tarefas" é pressionado
    func tappedTarefasButton() {
        print(#function)
        // Verifica se a tarefasScreen e o título da tarefa estão definidos e não estão vazios
        guard let tarefasScreen = tarefasScreen,
              let tarefaTitle = tarefasScreen.tarefaTextField.text, !tarefaTitle.isEmpty else {
            return
        }
        // Adiciona a nova tarefa ao viewModel
        viewModel.adicionarTarefa(titulo: tarefaTitle)
        // Limpa o texto do textField na tarefasScreen
        tarefasScreen.tarefaTextField.text = ""
        // Recarrega os dados da tableView na tarefasScreen
        tarefasScreen.tableView.reloadData()
    }
}

// Cria uma extensão da classe TarefasVC, adotando os protocolos UITableViewDataSource e UITableViewDelegate
extension TarefasVC: UITableViewDataSource, UITableViewDelegate {
    // Função que retorna o número de linhas na tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tarefas.count
    }
    
    // Função que retorna a célula para uma determinada linha na tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cria e reutiliza uma célula com identificador "CustomCell" e faz o cast para TarefasTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TarefasTableViewCell
       
        // Recupera a tarefa correspondente ao índice da linha atual
        let tarefa = viewModel.tarefas[indexPath.row]
        
        // Configura a célula com o título da tarefa
        cell.configureCell(title: tarefa.title)
        

        // Retorna a célula configurada
        return cell
    }
    // Função que permite a edição das linhas da tableView
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Permite que as linhas da tabela possam ser editadas
        return true
    }
}
